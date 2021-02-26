package org.zerock.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.MemberVO;
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
	public void list(@ModelAttribute("params") TreviewVO params, Model model, HttpServletRequest request) {
		this.getParamSet(request, model);

		this.getFileUrl(request, model);
	}

	/**
	 * 여행후기 등록/수정
	 * 
	 * @param params
	 */
	@GetMapping("/write")
	public void write(@ModelAttribute("params") TreviewVO params, Model model, HttpServletRequest request) {
		String url = javax.servlet.http.HttpUtils.getRequestURL(request).toString();
		model.addAttribute("ssl", "http://hl.yjoon.com");
		if (url.indexOf("http://") > -1) {
			model.addAttribute("ssl", "https://hl.yjoon.com");
		}
		this.getParamSet(request, model);

		this.getFileUrl(request, model);
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
	public void writeSave(Model model, HttpServletResponse response, HttpServletRequest request) throws IOException {

		TreviewVO params = new TreviewVO();
		params.setReviewno(request.getParameter("reviewno").isEmpty() ? 0 : Integer.parseInt(request.getParameter("reviewno").toString()));
		params.setReviewtitle(request.getParameter("reviewtitle"));
		params.setOrderno(request.getParameter("orderno").isEmpty() ? 0 : Integer.parseInt(request.getParameter("orderno").toString()));
		params.setReviewcontent(request.getParameter("reviewcontent"));
		params.setImg_path(request.getParameter("img_path"));
		params.setImg_name(request.getParameter("img_name"));
		params.setId(request.getParameter("id"));
		if (params.getId() == null) {
			params.setId("newbie");
		}

		log.info("[/treview/writeSave] 여행후기 등록/수정 :: params >> " + ToStringBuilder.reflectionToString(params));

		String msg = "insert";
		if (params.getReviewno() != null && params.getReviewno() > 0) {
			msg = "update";
		}

		treviewService.saveTreview(params);

		model.addAttribute("message", msg);
		model.addAttribute("redirect", "/treview/list");

		response.sendRedirect(request.getContextPath() + "/treview/message?message=/treview/writeSave/" + msg + "&redirect=/treview/view?key=" + params.getReviewno());

	}

	/**
	 * 여행후기 상세보기
	 * 
	 * @param params
	 * @param model
	 */
	@GetMapping("/view")
	public void view(@ModelAttribute("params") TreviewVO params, Model model, HttpServletRequest request) {
		String url = javax.servlet.http.HttpUtils.getRequestURL(request).toString();
		model.addAttribute("ssl", "http://");
		if (url.indexOf("http://") > -1) {
			model.addAttribute("ssl", "https://");
		}
		this.getParamSet(request, model);

		this.getFileUrl(request, model);
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
	public void commentSave(@ModelAttribute("params") TreviewVO params, Model model, HttpServletResponse response, HttpServletRequest request) throws IOException {

		log.info("[/treview/commentSave] 여행후기 댓글 저장 :: params >> " + ToStringBuilder.reflectionToString(params));

		treviewService.saveTreviewReply(params);

		response.sendRedirect(request.getContextPath() + "/treview/message?message=/treview/commentSave&redirect=/treview/view?key=" + params.getReviewno());

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
	public void treviewDelete(@ModelAttribute("delete") TreviewVO params, Model model, HttpServletResponse response, HttpServletRequest request) throws IOException {

		log.info("[/treview/commentDelete] 여행후기 댓글 삭제 :: params >> " + ToStringBuilder.reflectionToString(params));

		if (params.getType().equals("treview")) {
			treviewService.deleteTreviewReplyAll(params);
			treviewService.deleteTreview(params);
			response.sendRedirect(request.getContextPath() + "/treview/message?message=/treview/treviewDelete/treview&redirect=/treview/list");
		} else if (params.getType().equals("comment")) {
			treviewService.deleteTreviewReply(params);
			response.sendRedirect(request.getContextPath() + "/treview/message?message=/treview/treviewDelete/comment&redirect=/treview/view?key=" + params.getReviewno());
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
		} else if (params.getMessage().equals("/treview/tempLogin/login")) {
			params.setMessage("로그인되었습니다.");
		} else if (params.getMessage().equals("/treview/tempLogin/logout")) {
			params.setMessage("로그아웃되었습니다.");
		}

		model.addAttribute("params", params);

	}

	@GetMapping(path = "/download/{key}")
	public void fileDownload(@PathVariable(name = "key") String key, HttpServletResponse response) {

		TreviewVO treview = new TreviewVO();
		treview.setImg_key(key);
		treview = treviewService.selectTreviewByKey(treview);

		String fileName = treview.getImg_name();
		String saveFileName = treview.getImg_path();
		// String contentType = treview.getContentType();

		File file = new File(saveFileName);
		long fileLength = file.length();

		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		// response.setHeader("Content-Type", contentType);
		response.setHeader("Content-Length", "" + fileLength);
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");
		// 그 정보들을 가지고 reponse의 Header에 세팅한 후

		try (FileInputStream fis = new FileInputStream(saveFileName); OutputStream out = response.getOutputStream();) {
			// saveFileName을 파라미터로 넣어 inputStream 객체를 만들고
			// response에서 파일을 내보낼 OutputStream을 가져와서
			int readCount = 0;
			byte[] buffer = new byte[1024];
			// 파일 읽을 만큼 크기의 buffer를 생성한 후
			while ((readCount = fis.read(buffer)) != -1) {
				out.write(buffer, 0, readCount);
				// outputStream에 씌워준다
			}
		} catch (Exception ex) {
			throw new RuntimeException("file Load Error");
		}

	}

	private void getParamSet(HttpServletRequest request, Model model) {
		String getParamSet = null;
		Enumeration names = request.getParameterNames();
		while (names.hasMoreElements()) {
			String key = (String) names.nextElement();
			System.out.println(key + ": " + request.getParameter(key));
			if (getParamSet == null) {
				getParamSet = "?" + key + "=" + request.getParameter(key);
			} else {
				getParamSet += "&" + key + "=" + request.getParameter(key);
			}
		}
		model.addAttribute("getParamSet", getParamSet);
		model.addAttribute("requestUri", request.getRequestURI());

	}

	/**
	 * 임시로그인소스 (추후삭제)
	 * 
	 * @param model
	 * @param response
	 * @param request
	 * @throws IOException
	 */
	@PostMapping("/tempLogin")
	public void tempLogin(@ModelAttribute("params") TreviewVO params // params
			, Model model // model
			, HttpServletResponse response // response
			, HttpServletRequest request // request
	) throws IOException {

		if (params.getType() != null && params.getType().equals("login")) {
			MemberVO user = new MemberVO();
			user.setId(params.getId());
			request.getSession().setAttribute("authUser", user);
			response.sendRedirect(request.getContextPath() + "/treview/message?message=/treview/tempLogin/login&redirect=/treview/list");
		} else {
			request.getSession().removeAttribute("authUser");
			response.sendRedirect(request.getContextPath() + "/treview/message?message=/treview/tempLogin/logout&redirect=/treview/list");
		}

	}

	private void getFileUrl(HttpServletRequest request, Model model) {
		String url = javax.servlet.http.HttpUtils.getRequestURL(request).toString();
		model.addAttribute("ssl", "http://hlupload.yjoon.com");
		if (url.indexOf("http://") > -1) {
			model.addAttribute("ssl", "https://hlupload.yjoon.com");
		}
	}

}