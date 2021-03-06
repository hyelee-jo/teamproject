<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>여행후기 게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" href="${root }/resources/assets/css/reset.css">
<link rel="stylesheet" href="${root }/resources/assets/css/style.css">
<link rel="stylesheet" href="${root }/resources/assets/css/common.css">

<script src="${root}/resources/treview/assets/js/jquery.js"></script>

</head>


<body>
<!-- 파비콘 -->
<!-- 웹 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean" rel="stylesheet">
<u:navbar/>
 
    <section id="banner">
        <div class="banner_menu">
            <h2 class="ir_so">배너 영역</h2>
            <div class="container">
                <div class="row">
                    <div class="bm_left">
                        <ul>
                            <li class="total"><a href="#">전체메뉴</a></li>
                            <li class="line"><a href="#">필름 소사이어티</a></li>
                            <li><a href="#">클래식 소사이어티</a></li>
                        </ul>
                    </div>
                    <div class="bm_right">
                        <ul>
                            <li class="line"><a href="custom/faq.html">고객센터</a></li>
                            <li class="line"><a href="#">멤버쉽</a></li>
                            <li><a href="#">VIP</a></li>
                        </ul>
                        <ul>
                            <li class="white"><a href="#">상영시간표</a></li>
                            <li class="purple"><a href="#">빠른예매</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="slider">
           <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide ss1">
                        <div class="container">
                            <div class="row">
                                <h3>어벤져스 : 앤드게임</h3>
                                <p>역대 최단 기간 1000만 관객 돌파 기록 </p>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide ss2">
                        <div class="container">
                            <div class="row">
                                <h3>어벤져스 : 앤드게임</h3>
                                <p>역대 최단 기간 1000만 관객 돌파 기록 </p>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide ss3">
                        <div class="container">
                            <div class="row">
                                <h3>어벤져스 : 앤드게임</h3>
                                <p>역대 최단 기간 1000만 관객 돌파 기록 </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </div>
    </section>
    <!-- //banner -->
    
    
    <section id="movie">
        <div class="container">
            <div class="row">
                <h2 class="ir_so">영화 예매</h2>
                <div class="movie">
                    <div class="movie_title">
                        <ul class="clearfix">
                            <li class="active"><a href="#">박스오피스</a></li>
                            <li><a href="#">최신개봉작</a></li>
                            <li><a href="#">상영예정작</a></li>
                            <li><a href="#">큐레이션</a></li>
                        </ul>
                    </div>
                    <div class="movie_chart">
                        <div class="swiper-container2">
                           <div class="chart_cont1 swiper-wrapper">
                               <div class="swiper-slide">
                                   <div class="poster">
                                       <figure>
                                           <img src="assets/img/poster01.jpg" srcset="assets/img/poster01@2.jpg 2x" alt="침묵">
                                       </figure>
                                       <div class="rank"><strong>1</strong></div>
                                       <div class="mx">
                                           <span class="icon m ir_pm">MX</span>
                                           <span class="icon b ir_pm">Boutique</span>
                                       </div>
                                   </div>
                                   <div class="infor">
                                       <h3><span class="icon all ir_pm">전체관람가</span> <strong>침묵</strong></h3>
                                       <div class="infor_btn">
                                           <a href="#">상세정보</a>
                                           <a href="#">예매하기</a>
                                       </div>
                                   </div>
                               </div>
                               <div class="swiper-slide">
                                   <div class="poster">
                                       <figure>
                                           <img src="assets/img/poster02.jpg" srcset="assets/img/poster02@2.jpg 2x" alt="신세계">
                                       </figure>
                                       <div class="rank"><strong>2</strong></div>
                                       <div class="mx">
                                           <span class="icon m ir_pm">MX</span>
                                       </div>
                                   </div>
                                   <div class="infor">
                                       <h3><span class="icon a19 ir_pm">19세 이상 관람</span> <strong>신세계</strong></h3>
                                       <div class="infor_btn">
                                           <a href="#">상세정보</a>
                                           <a href="#">예매하기</a>
                                       </div>
                                   </div>
                               </div>
                               <div class="swiper-slide">
                                   <div class="poster">
                                       <figure>
                                           <img src="assets/img/poster03.jpg" srcset="assets/img/poster03@2.jpg 2x" alt="마스터">
                                       </figure>
                                       <div class="rank"><strong>3</strong></div>
                                       <div class="mx">
                                           <span class="icon m ir_pm">MX</span>
                                       </div>
                                   </div>
                                   <div class="infor">
                                       <h3><span class="icon a12 ir_pm">12세 이상 관람</span> <strong>마스터</strong></h3>
                                       <div class="infor_btn">
                                           <a href="#">상세정보</a>
                                           <a href="#">예매하기</a>
                                       </div>
                                   </div>
                               </div>
                               <div class="swiper-slide">
                                   <div class="poster">
                                       <figure>
                                           <img src="assets/img/poster04.jpg" srcset="assets/img/poster04@2.jpg 2x" alt="마약왕">
                                       </figure>
                                       <div class="rank"><strong>4</strong></div>
                                       <div class="mx">
                                           <span class="icon m ir_pm">MX</span>
                                       </div>
                                   </div>
                                   <div class="infor">
                                       <h3><span class="icon a15 ir_pm">15세 이상 관람</span> <strong>마약왕</strong></h3>
                                       <div class="infor_btn">
                                           <a href="#">상세정보</a>
                                           <a href="#">예매하기</a>
                                       </div>
                                   </div>
                               </div>
                               <div class="swiper-slide">
                                   <div class="poster">
                                       <figure>
                                           <img src="assets/img/poster05.jpg" srcset="assets/img/poster05@2.jpg 2x" alt="마약왕">
                                       </figure>
                                       <div class="rank"><strong>5</strong></div>
                                       <div class="mx">
                                           <span class="icon m ir_pm">MX</span>
                                       </div>
                                   </div>
                                   <div class="infor">
                                       <h3><span class="icon a15 ir_pm">15세 이상 관람</span> <strong>마약왕</strong></h3>
                                       <div class="infor_btn">
                                           <a href="#">상세정보</a>
                                           <a href="#">예매하기</a>
                                       </div>
                                   </div>
                               </div>
                               <div class="swiper-slide">
                                   <div class="poster">
                                       <figure>
                                           <img src="assets/img/poster06.jpg" srcset="assets/img/poster06@2.jpg 2x" alt="마약왕">
                                       </figure>
                                       <div class="rank"><strong>6</strong></div>
                                       <div class="mx">
                                           <span class="icon m ir_pm">MX</span>
                                       </div>
                                   </div>
                                   <div class="infor">
                                       <h3><span class="icon a15 ir_pm">15세 이상 관람</span> <strong>마약왕</strong></h3>
                                       <div class="infor_btn">
                                           <a href="#">상세정보</a>
                                           <a href="#">예매하기</a>
                                       </div>
                                   </div>
                               </div>
                               <div class="swiper-slide">
                                   <div class="poster">
                                       <figure>
                                           <img src="assets/img/poster07.jpg" srcset="assets/img/poster07@2.jpg 2x" alt="마약왕">
                                       </figure>
                                       <div class="rank"><strong>7</strong></div>
                                       <div class="mx">
                                           <span class="icon m ir_pm">MX</span>
                                       </div>
                                   </div>
                                   <div class="infor">
                                       <h3><span class="icon a15 ir_pm">15세 이상 관람</span> <strong>마약왕</strong></h3>
                                       <div class="infor_btn">
                                           <a href="#">상세정보</a>
                                           <a href="#">예매하기</a>
                                       </div>
                                   </div>
                               </div>
                               <div class="swiper-slide">
                                   <div class="poster">
                                       <figure>
                                           <img src="assets/img/poster08.jpg" srcset="assets/img/poster08@2.jpg 2x" alt="마약왕">
                                       </figure>
                                       <div class="rank"><strong>8</strong></div>
                                       <div class="mx">
                                           <span class="icon m ir_pm">MX</span>
                                       </div>
                                   </div>
                                   <div class="infor">
                                       <h3><span class="icon a15 ir_pm">15세 이상 관람</span> <strong>마약왕</strong></h3>
                                       <div class="infor_btn">
                                           <a href="#">상세정보</a>
                                           <a href="#">예매하기</a>
                                       </div>
                                   </div>
                               </div>
                           </div>
                        </div>
                        <!-- //chart_cont1-->
                        
                        <div class="swiper-container2">
                            <div class="chart_cont2 swiper-wrapper">
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="assets/img/poster07.jpg" srcset="assets/img/poster07@2.jpg 2x" alt="침묵">
                                        </figure>
                                        <div class="rank"><strong>1</strong></div>
                                        <div class="mx">
                                            <span class="icon m ir_pm">MX</span>
                                            <span class="icon b ir_pm">Boutique</span>
                                        </div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon all ir_pm">전체관람가</span> <strong>침묵</strong></h3>
                                        <div class="infor_btn">
                                            <a href="#">상세정보</a>
                                            <a href="#">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="assets/img/poster08.jpg" srcset="assets/img/poster08@2.jpg 2x" alt="신세계">
                                        </figure>
                                        <div class="rank"><strong>2</strong></div>
                                        <div class="mx">
                                            <span class="icon m ir_pm">MX</span>
                                        </div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">19세 이상 관람</span> <strong>신세계</strong></h3>
                                        <div class="infor_btn">
                                            <a href="#">상세정보</a>
                                            <a href="#">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="assets/img/poster07.jpg" srcset="assets/img/poster07@2.jpg 2x" alt="마스터">
                                        </figure>
                                        <div class="rank"><strong>3</strong></div>
                                        <div class="mx">
                                            <span class="icon m ir_pm">MX</span>
                                        </div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a12 ir_pm">12세 이상 관람</span> <strong>마스터</strong></h3>
                                        <div class="infor_btn">
                                            <a href="#">상세정보</a>
                                            <a href="#">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="assets/img/poster08.jpg" srcset="assets/img/poster08@2.jpg 2x" alt="마약왕">
                                        </figure>
                                        <div class="rank"><strong>4</strong></div>
                                        <div class="mx">
                                            <span class="icon m ir_pm">MX</span>
                                        </div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a15 ir_pm">15세 이상 관람</span> <strong>마약왕</strong></h3>
                                        <div class="infor_btn">
                                            <a href="#">상세정보</a>
                                            <a href="#">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="assets/img/poster08.jpg" srcset="assets/img/poster08@2.jpg 2x" alt="마약왕">
                                        </figure>
                                        <div class="rank"><strong>4</strong></div>
                                        <div class="mx">
                                            <span class="icon m ir_pm">MX</span>
                                        </div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a15 ir_pm">15세 이상 관람</span> <strong>마약왕</strong></h3>
                                        <div class="infor_btn">
                                            <a href="#">상세정보</a>
                                            <a href="#">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="assets/img/poster08.jpg" srcset="assets/img/poster08@2.jpg 2x" alt="마약왕">
                                        </figure>
                                        <div class="rank"><strong>4</strong></div>
                                        <div class="mx">
                                            <span class="icon m ir_pm">MX</span>
                                        </div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a15 ir_pm">15세 이상 관람</span> <strong>마약왕</strong></h3>
                                        <div class="infor_btn">
                                            <a href="#">상세정보</a>
                                            <a href="#">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- //chart_cont2-->
                        
                        <div class="swiper-container2">
                            <div class="chart_cont3 swiper-wrapper">
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="assets/img/poster09.jpg" srcset="assets/img/poster09@2.jpg 2x" alt="침묵">
                                        </figure>
                                        <div class="rank"><strong>1</strong></div>
                                        <div class="mx">
                                            <span class="icon m ir_pm">MX</span>
                                            <span class="icon b ir_pm">Boutique</span>
                                        </div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon all ir_pm">전체관람가</span> <strong>침묵</strong></h3>
                                        <div class="infor_btn">
                                            <a href="#">상세정보</a>
                                            <a href="#">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="assets/img/poster01.jpg" srcset="assets/img/poster01@2.jpg 2x" alt="신세계">
                                        </figure>
                                        <div class="rank"><strong>2</strong></div>
                                        <div class="mx">
                                            <span class="icon m ir_pm">MX</span>
                                        </div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a12 ir_pm">19세 이상 관람</span> <strong>신세계</strong></h3>
                                        <div class="infor_btn">
                                            <a href="#">상세정보</a>
                                            <a href="#">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="assets/img/poster02.jpg" srcset="assets/img/poster02@2.jpg 2x" alt="마스터">
                                        </figure>
                                        <div class="rank"><strong>3</strong></div>
                                        <div class="mx">
                                            <span class="icon m ir_pm">MX</span>
                                        </div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a12 ir_pm">12세 이상 관람</span> <strong>마스터</strong></h3>
                                        <div class="infor_btn">
                                            <a href="#">상세정보</a>
                                            <a href="#">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="assets/img/poster03.jpg" srcset="assets/img/poster03@2.jpg 2x" alt="마약왕">
                                        </figure>
                                        <div class="rank"><strong>4</strong></div>
                                        <div class="mx">
                                            <span class="icon m ir_pm">MX</span>
                                        </div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">15세 이상 관람</span> <strong>마약왕</strong></h3>
                                        <div class="infor_btn">
                                            <a href="#">상세정보</a>
                                            <a href="#">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="assets/img/poster03.jpg" srcset="assets/img/poster03@2.jpg 2x" alt="마약왕">
                                        </figure>
                                        <div class="rank"><strong>4</strong></div>
                                        <div class="mx">
                                            <span class="icon m ir_pm">MX</span>
                                        </div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">15세 이상 관람</span> <strong>마약왕</strong></h3>
                                        <div class="infor_btn">
                                            <a href="#">상세정보</a>
                                            <a href="#">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="assets/img/poster03.jpg" srcset="assets/img/poster03@2.jpg 2x" alt="마약왕">
                                        </figure>
                                        <div class="rank"><strong>4</strong></div>
                                        <div class="mx">
                                            <span class="icon m ir_pm">MX</span>
                                        </div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">15세 이상 관람</span> <strong>마약왕</strong></h3>
                                        <div class="infor_btn">
                                            <a href="#">상세정보</a>
                                            <a href="#">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- //chart_cont3-->
                        
                        <div class="swiper-container2">
                            <div class="chart_cont4 swiper-wrapper">
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="assets/img/poster04.jpg" srcset="assets/img/poster04@2.jpg 2x" alt="침묵">
                                        </figure>
                                        <div class="rank"><strong>1</strong></div>
                                        <div class="mx">
                                            <span class="icon m ir_pm">MX</span>
                                            <span class="icon b ir_pm">Boutique</span>
                                        </div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon all ir_pm">전체관람가</span> <strong>침묵</strong></h3>
                                        <div class="infor_btn">
                                            <a href="#">상세정보</a>
                                            <a href="#">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="assets/img/poster05.jpg" srcset="assets/img/poster05@2.jpg 2x" alt="신세계">
                                        </figure>
                                        <div class="rank"><strong>2</strong></div>
                                        <div class="mx">
                                            <span class="icon m ir_pm">MX</span>
                                        </div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">19세 이상 관람</span> <strong>신세계</strong></h3>
                                        <div class="infor_btn">
                                            <a href="#">상세정보</a>
                                            <a href="#">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="assets/img/poster06.jpg" srcset="assets/img/poster06@2.jpg 2x" alt="마스터">
                                        </figure>
                                        <div class="rank"><strong>3</strong></div>
                                        <div class="mx">
                                            <span class="icon m ir_pm">MX</span>
                                        </div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a12 ir_pm">12세 이상 관람</span> <strong>마스터</strong></h3>
                                        <div class="infor_btn">
                                            <a href="#">상세정보</a>
                                            <a href="#">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="assets/img/poster07.jpg" srcset="assets/img/poster07@2.jpg 2x" alt="마약왕">
                                        </figure>
                                        <div class="rank"><strong>4</strong></div>
                                        <div class="mx">
                                            <span class="icon m ir_pm">MX</span>
                                        </div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a12 ir_pm">15세 이상 관람</span> <strong>마약왕</strong></h3>
                                        <div class="infor_btn">
                                            <a href="#">상세정보</a>
                                            <a href="#">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="assets/img/poster07.jpg" srcset="assets/img/poster07@2.jpg 2x" alt="마약왕">
                                        </figure>
                                        <div class="rank"><strong>4</strong></div>
                                        <div class="mx">
                                            <span class="icon m ir_pm">MX</span>
                                        </div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a12 ir_pm">15세 이상 관람</span> <strong>마약왕</strong></h3>
                                        <div class="infor_btn">
                                            <a href="#">상세정보</a>
                                            <a href="#">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="assets/img/poster07.jpg" srcset="assets/img/poster07@2.jpg 2x" alt="마약왕">
                                        </figure>
                                        <div class="rank"><strong>4</strong></div>
                                        <div class="mx">
                                            <span class="icon m ir_pm">MX</span>
                                        </div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a12 ir_pm">15세 이상 관람</span> <strong>마약왕</strong></h3>
                                        <div class="infor_btn">
                                            <a href="#">상세정보</a>
                                            <a href="#">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- //chart_cont4-->
                    </div>
                </div>
            </div>
        </div>
    </section>  
    <!-- //movie -->
    

<u:footer/>
<script>
        //배너 이미지 슬라이드
        var swiper = new Swiper('.swiper-container',{
            pagination: {
                el: '.swiper-pagination',
            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            autoplay: {
                delay: 5000,
            },
        });
        
        //영화차트 이미지 슬라이드
        var swiper = new Swiper('.swiper-container2',{
            slidesPerView: 4,
            spaceBetween: 24,
//            mousewheel: {
//                invert: true,
//            },
            keyboard: {
                enabled: true,
                onlyInViewport: false,
            },
            autoplay: {
                delay: 6000,
            },
            breakpoints: {
                600: {
                    slidesPerView: 1.4,
                    spaceBetween: 24
                },
                768: {
                    slidesPerView: 2,
                    spaceBetween: 24
                },
                960: {
                    slidesPerView: 3,
                    spaceBetween: 24
                }
            }
        });
        
        //영화차트 탭 메뉴
        var movBtn = $(".movie_title > ul > li");    
        var movCont = $(".movie_chart > div");  

        movCont.hide().eq(0).show();

        movBtn.click(function(e){
            e.preventDefault();
            var target = $(this);         
            var index = target.index();  
            movBtn.removeClass("active");   
            target.addClass("active");    
            movCont.css("display","none");
            movCont.eq(index).css("display","block");
        });
        
        //공지사항 탭 메뉴
        var tabMenu = $(".notice");

        //컨텐츠 내용을 숨겨주세요!
        tabMenu.find("ul > li > ul").hide();
        tabMenu.find("li.active > ul").show();

        function tabList(e){
            e.preventDefault();       //#의 기능을 차단
            var target = $(this);
            target.next().show().parent("li").addClass("active").siblings("li").removeClass("active").find("ul").hide();
            //버튼을 클릭하면 ~ div를 보여주고
            //부모의 li 태그에 클래스 추가하고
            //형제의 li 태그에 클래스 제거하고
            //제거한 자식의 div 태그를 숨겨줌 
        }

        tabMenu.find("ul > li > a").click(tabList).focus(tabList);
        
    </script>
</body>
</html>
