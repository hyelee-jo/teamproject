package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class TreviewVO {

	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updateDate;
	private int replyCnt;

	private String key;
	private String type;

	private Integer reviewno;
	private String reviewtitle;
	private String reviewcontent;
	private String reviewcontentshort;
	private Date reviewdate;
	private String reviewdatestr;
	private String id;
	private Integer cnt_reply;
	private String img_path;
	private String img_key;
	private String img_name;

	private Integer replyno;
	private String replier;
	private String reply;
	private Date created_dt;
	private String created_dt_str;

	private Integer orderno;
	private Date orderdate;
	private String orderdatestr;
	private Integer quantity;

	private Integer productno;
	private String productname;
	private Integer productprice;
	private String schedule;
	private String schedulestr;
	private String city;
	private String country;

	private Integer page;
	private Integer rows;
	private Integer page_rows;
	private Integer rnum;
	private Integer cnt_total;
	private Integer cnt_page;
	private Integer start_page;

	private String message;
	private String redirect;

}