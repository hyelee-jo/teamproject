package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.TreviewVO;

public interface TreviewMapper {

	public List<TreviewVO> selectTreviewList(TreviewVO params);

	public void updateTreview(TreviewVO params);

	public int selectMaxKey();

	public void insertTreview(TreviewVO params);

	public List<TreviewVO> selectOrderList();

	public TreviewVO selectTreview(TreviewVO params);

	public List<TreviewVO> selectTreviewReplyList(TreviewVO params);

	public void insertTreviewReply(TreviewVO params);

	public void deleteTreviewReply(TreviewVO params);

	public void deleteTreviewReplyAll(TreviewVO params);

	public void deleteTreview(TreviewVO params);

	public TreviewVO selectTreviewByKey(TreviewVO treview);

	public void updateTreviewReply(TreviewVO params);

}