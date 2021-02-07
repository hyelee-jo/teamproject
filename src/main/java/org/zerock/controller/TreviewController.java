package org.zerock.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.zerock.domain.TreviewVO;
import org.zerock.service.TreviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@RequestMapping("/treview/*")
@Log4j
public class TreviewController {

	private TreviewService treviewService;

	private static String imagePath = "D:/upload/image";

	/**
	 * 여행후기 목록
	 * 
	 * @param params
	 * @param model
	 */
	@GetMapping("/list")
	public void list(@ModelAttribute("params") TreviewVO params, Model model) {

		log.info("[/treview/list] 여행후기 목록 :: params >> " + ToStringBuilder.reflectionToString(params));

		if (params.getPage() == null || params.getPage() < 1) {
			params.setPage(1);
		}
		params.setRows(10);
		params.setPage_rows(5);
		List<TreviewVO> treviewList = treviewService.selectTreviewList(params);
		model.addAttribute("treviewList", treviewList);

	}

	/**
	 * 여행후기 등록/수정
	 * 
	 * @param params
	 */
	@GetMapping("/write")
	public void write(@ModelAttribute("params") TreviewVO params, Model model) {

		log.info("[/treview/write] 여행후기 등록/수정 :: params >> " + ToStringBuilder.reflectionToString(params));

		if (params.getKey() != null) {
			params.setReviewno(Integer.parseInt(params.getKey()));
			TreviewVO treview = treviewService.selectTreview(params);
			model.addAttribute("treview", treview);
		}

		List<TreviewVO> orderlist = treviewService.selectOrderList();
		model.addAttribute("orderlist", orderlist);

	}

	/**
	 * 여행후기 insert/update
	 * 
	 * @param params
	 * @param model
	 * @param response
	 * @throws IOException
	 */
	@PostMapping("/writeSave")
	public void writeSave(Model model, HttpServletResponse response, MultipartHttpServletRequest request, @RequestParam("imageFile") MultipartFile imageFile) throws IOException {

		TreviewVO params = new TreviewVO();
		params.setReviewno(request.getParameter("reviewno").isEmpty() ? 0 : Integer.parseInt(request.getParameter("reviewno").toString()));
		params.setReviewtitle(request.getParameter("reviewtitle"));
		params.setOrderno(request.getParameter("orderno").isEmpty() ? 0 : Integer.parseInt(request.getParameter("orderno").toString()));
		params.setReviewcontent(request.getParameter("reviewcontent"));

		if (imageFile != null && imageFile.getOriginalFilename() != null && !imageFile.getOriginalFilename().isEmpty()) {
			String ext = imageFile.getOriginalFilename().substring(imageFile.getOriginalFilename().lastIndexOf(".") + 1);
			File dir = new File(imagePath);
			System.out.println("dir.exists()::" + dir.exists());
			if (!new File(imagePath).exists()) {
				new File(imagePath).mkdirs();
			}
			String fullDir = imagePath + "/" + UUID.randomUUID() + "." + ext;
			params.setImg_path(fullDir);
			imageFile.transferTo(new File(fullDir));
		}

		log.info("[/treview/writeSave] 여행후기 등록/수정 :: params >> " + ToStringBuilder.reflectionToString(params));

		String msg = "insert";
		if (params.getReviewno() != 0) {
			msg = "update";
		}

		treviewService.saveTreview(params);

		model.addAttribute("message", msg);
		model.addAttribute("redirect", "/treview/list");

		response.sendRedirect("/treview/message?message=/treview/writeSave/" + msg + "&redirect=/treview/view?key=" + params.getReviewno());

	}

	/**
	 * 여행후기 상세보기
	 * 
	 * @param params
	 * @param model
	 */
	@GetMapping("/view")
	public void view(@ModelAttribute("params") TreviewVO params, Model model) {

		log.info("[/treview/view] 여행후기 상세보기 :: params >> " + ToStringBuilder.reflectionToString(params));

		params.setReviewno(Integer.parseInt(params.getKey()));
		TreviewVO treview = treviewService.selectTreview(params);

		if (params.getPage() == null || params.getPage() < 1) {
			params.setPage(1);
		}
		params.setRows(5);
		params.setPage_rows(5);
		List<TreviewVO> replyList = treviewService.selectTreviewReplyList(params);

		model.addAttribute("treview", treview);
		model.addAttribute("replyList", replyList);

	}

	/**
	 * 여행후기 댓글 저장
	 * 
	 * @param params
	 * @param model
	 * @param response
	 * @throws IOException
	 */
	@PostMapping("/commentSave")
	public void commentSave(@ModelAttribute("params") TreviewVO params, Model model, HttpServletResponse response) throws IOException {

		log.info("[/treview/commentSave] 여행후기 댓글 저장 :: params >> " + ToStringBuilder.reflectionToString(params));

		treviewService.saveTreviewReply(params);

		response.sendRedirect("/treview/message?message=/treview/commentSave&redirect=/treview/view?key=" + params.getReviewno());

	}

	/**
	 * 여행후기 댓글 삭제
	 * 
	 * @param params
	 * @param model
	 * @param response
	 * @throws IOException
	 */
	@PostMapping("/treviewDelete")
	public void treviewDelete(@ModelAttribute("delete") TreviewVO params, Model model, HttpServletResponse response) throws IOException {

		log.info("[/treview/commentDelete] 여행후기 댓글 삭제 :: params >> " + ToStringBuilder.reflectionToString(params));

		if (params.getType().equals("treview")) {
			treviewService.deleteTreviewReplyAll(params);
			treviewService.deleteTreview(params);
			response.sendRedirect("/treview/message?message=/treview/treviewDelete/treview&redirect=/treview/list");
		} else if (params.getType().equals("comment")) {
			treviewService.deleteTreviewReply(params);
			response.sendRedirect("/treview/message?message=/treview/treviewDelete/comment&redirect=/treview/view?key=" + params.getReviewno());
		}

	}

	/**
	 * 여행후기 메세지
	 * 
	 * @param params
	 * @param model
	 */
	@GetMapping("/message")
	public void message(@ModelAttribute("params") TreviewVO params, Model model) {

		log.info("[/treview/message] 여행후기 메세지 :: params >> " + ToStringBuilder.reflectionToString(params));

		if (params.getMessage().equals("/treview/writeSave/insert")) {
			params.setMessage("여행후기가 등록되었습니다.");
		} else if (params.getMessage().equals("/treview/writeSave/update")) {
			params.setMessage("여행후기가 수정되었습니다.");
		} else if (params.getMessage().equals("/treview/commentSave")) {
			params.setMessage("댓글이 등록되었습니다.");
		} else if (params.getMessage().equals("/treview/treviewDelete/comment")) {
			params.setMessage("댓글이 삭제되었습니다.");
		} else if (params.getMessage().equals("/treview/treviewDelete/treview")) {
			params.setMessage("여행후기가 삭제되었습니다.");
		}

		model.addAttribute("params", params);

	}

}