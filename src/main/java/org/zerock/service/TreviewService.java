package org.zerock.service;

import java.util.List;

import org.zerock.domain.TreviewVO;

public interface TreviewService {

	public List<TreviewVO> selectTreviewList(TreviewVO params);

	public void saveTreview(TreviewVO params);

	public List<TreviewVO> selectOrderList();

	public TreviewVO selectTreview(TreviewVO params);

	public List<TreviewVO> selectTreviewReplyList(TreviewVO params);

	public void saveTreviewReply(TreviewVO params);

	public void deleteTreviewReply(TreviewVO params);

	public void deleteTreviewReplyAll(TreviewVO params);

	public void deleteTreview(TreviewVO params);

	public TreviewVO selectTreviewByKey(TreviewVO treview);

}