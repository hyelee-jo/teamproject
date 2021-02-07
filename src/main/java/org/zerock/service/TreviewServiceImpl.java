package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.TreviewVO;
import org.zerock.mapper.TreviewMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class TreviewServiceImpl implements TreviewService {

	private TreviewMapper treviewMapper;

	@Override
	public List<TreviewVO> selectTreviewList(TreviewVO params) {
		return treviewMapper.selectTreviewList(params);
	}

	@Override
	public void saveTreview(TreviewVO params) {
		if (params.getReviewno() == 0) {
			params.setReviewno(treviewMapper.selectMaxKey());
			treviewMapper.insertTreview(params);
		} else {
			treviewMapper.updateTreview(params);
		}
	}

	@Override
	public List<TreviewVO> selectOrderList() {
		return treviewMapper.selectOrderList();
	}

	@Override
	public TreviewVO selectTreview(TreviewVO params) {
		return treviewMapper.selectTreview(params);
	}

	@Override
	public List<TreviewVO> selectTreviewReplyList(TreviewVO params) {
		return treviewMapper.selectTreviewReplyList(params);
	}

	@Override
	public void saveTreviewReply(TreviewVO params) {
		treviewMapper.insertTreviewReply(params);
	}

	@Override
	public void deleteTreviewReply(TreviewVO params) {
		treviewMapper.deleteTreviewReply(params);
	}

	@Override
	public void deleteTreviewReplyAll(TreviewVO params) {
		treviewMapper.deleteTreviewReplyAll(params);
	}

	@Override
	public void deleteTreview(TreviewVO params) {
		treviewMapper.deleteTreview(params);
	}

}