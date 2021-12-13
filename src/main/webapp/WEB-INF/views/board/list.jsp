<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Front page</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
        integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

    <%@ include file="../include/header.jsp" %>



    <style>
        .writing a {
            display: inline-block;
            /* background: #40c4ff; */
            background: #87c9ff;

            width: 95px;
            height: 95px;
            line-height: normal;
            color: #fff;
            text-decoration: none;
            border-radius: 50px;
            text-align: center;
            position: fixed;
            right: 5%;
            bottom: 10%;
            z-index: 1000;
        }

        .writing a i {
            font-size: 30px;
            line-height: 95px;
        }

        .writing a:hover {
            background: #66baff;
        }
    </style>

</head>

<body>
    <div class="wrapper">

        <%@ include file="../include/static-category.jsp" %>

        <section class="blog-post-area">
            <div class="container">
                <div class="row">
                    <div class="blog-post-area-style">
                        <!-- <div class="col-md-12">
                            <div class="single-post-big">
                                <div class="big-image"> -->


                        <!-- #################################### 대표 사진 조건문 코드  ####################################### -->

                        <!-- <c:set var="menu" value="${flag}" />
                                    <c:choose>
                                        <c:when test="${menu == 'movie'}">
                                            <img src="../../img/movie-bg-img.jpg" alt="이미지" id="big-img" />
                                        </c:when>

                                        <c:when test="${menu == 'res'}">
                                            <img src="../../img/res-bg-img.jpg" alt="이미지" id="big-img" />
                                        </c:when>

                                        <c:when test="${menu == 'day'}">
                                            <img src="../../img/day-bg-img.jpg" alt="이미지" id="big-img" />
                                        </c:when>

                                    </c:choose>

                                </div> -->

                        <!-- #################################### 대표글 코드  ####################################### -->

                        <!-- <div class="big-text">
                                    <c:choose>

                                        <c:when test="${menu == 'movie'}">
                                            <h3><a href="#">영화 카테고리</a></h3>
                                            <p>
                                                영화 리뷰 공간
                                            </p>
                                            <p>
                                                50년 인생 통틀어 가장 인상깊었던 인생영화 소개해드립니다.
                                            </p>
                                        </c:when>


                                        <c:when test="${menu == 'res'}">
                                            <h3><a href="#">맛집 카테고리</a></h3>
                                            <p>
                                                50년 인생 통틀어 가장 맛있었던 인생맛집 소개해드립니다.
                                            </p>
                                            
                                        </c:when>


                                        <c:when test="${menu == 'day'}">
                                            <h3><a href="#">일상 카테고리</a></h3>
                                            <p>
                                                50년 인생 통틀어 가장 인상깊었던 제 일화 소개해드립니다.
                                            </p>
                                            
                                        </c:when>
                                    </c:choose>

                                    <h4><span class="author">Posted By:
                                            <span class="author-name">홍길동</span></span>
                                    </h4>
                                </div>
                            </div> -->
                        <!-- </div> -->


                        <!-- #################################### 최신글 코드  ####################################### -->
                        <div class="single-post">
                            <h3>
                                <span class="main-title">최신글</span>
                            </h3>
                        </div>

                        <div class="col-md-3">
                            <div class="single-post">
                                <img src="../../img/post-image3.jpg" alt="">
                                <h3><a
                                        href="single?serialNo=${article[0].serialNo}&categoryNo=${article[0].categoryNo}">${article[0].boardTitle}</a>
                                </h3>

                                <!-- 게시글 내용 -->
                                <!-- <p>${article[0].boardContent}</p> -->
                                <h4>
                                    <span>
                                        <fmt:formatDate value="${article[0].boardDate}"
                                            pattern="yyyy-MM-dd a hh:mm:ss" /> <br>
                                        <p>조회수: ${article[0].boardViewCnt}</p>
                                    </span>
                                </h4>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="single-post">
                                <img src="../../img/post-image3.jpg" alt="">
                                <h3><a
                                        href="single?serialNo=${article[1].serialNo}&categoryNo=${article[1].categoryNo}">${article[1].boardTitle}</a>
                                </h3>
                                <!-- 게시글 내용 -->
                                <!-- <p>${article[1].boardContent}</p> -->
                                <h4>
                                    <span>
                                        <fmt:formatDate value="${article[1].boardDate}"
                                            pattern="yyyy-MM-dd a hh:mm:ss" /> <br>
                                        <p>조회수: ${article[1].boardViewCnt}</p>
                                    </span>
                                </h4>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="single-post">
                                <img src="../../img/post-image4.jpg" alt="">
                                <h3><a
                                        href="single?serialNo=${article[2].serialNo}&categoryNo=${article[2].categoryNo}">${article[2].boardTitle}</a>
                                </h3>
                                <!-- 게시글 내용 -->
                                <!-- <p>${article[2].boardContent}</p> -->
                                <h4>
                                    <span>
                                        <fmt:formatDate value="${article[2].boardDate}"
                                            pattern="yyyy-MM-dd a hh:mm:ss" /> <br>
                                        <p>조회수: ${article[2].boardViewCnt}</p>
                                    </span>
                                </h4>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="single-post">
                                <img src="../../img/post-image5.jpg" alt="">
                                <h3><a
                                        href="single?serialNo=${article[3].serialNo}&categoryNo=${article[3].categoryNo}">${article[3].boardTitle}</a>
                                </h3>
                                <!-- 게시글 내용 -->
                                <!-- <p>${article[3].boardContent}</p> -->
                                <h4>
                                    <span>
                                        <fmt:formatDate value="${article[3].boardDate}"
                                            pattern="yyyy-MM-dd a hh:mm:ss" /> <br>
                                        <p>조회수: ${article[3].boardViewCnt}</p>
                                    </span>
                                </h4>
                            </div>
                        </div>



                        <!-- #################################### 인기글 코드  ####################################### -->

                        <div class="single-post">
                            <h3>
                                <span class="main-title">인기글</span>
                            </h3>
                        </div>

                        <div class="col-md-3">
                            <div class="single-post">
                                <img src="../../img/post-image2.jpg" alt="">
                                <h3><a
                                        href="single?serialNo=${bestArticles[0].serialNo}&categoryNo=${bestArticles[0].categoryNo}">${bestArticles[0].boardTitle}</a>
                                </h3>
                                <!-- 게시글 내용 -->
                                <!-- <p>${bestArticles[0].boardContent}</p> -->
                                <h4>
                                    <span>
                                        <fmt:formatDate value="${bestArticles[0].boardDate}"
                                            pattern="yyyy-MM-dd a hh:mm:ss" /> <br>
                                        <p>조회수: ${bestArticles[0].boardViewCnt}</p>
                                    </span>
                                </h4>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="single-post">
                                <img src="../../img/post-image2.jpg" alt="">
                                <h3><a
                                        href="single?serialNo=${bestArticles[1].serialNo}&categoryNo=${bestArticles[1].categoryNo}">${bestArticles[1].boardTitle}</a>
                                </h3>
                                <!-- 게시글 내용 -->
                                <!-- <p>${bestArticles[1].boardContent}</p> -->
                                <h4>
                                    <span>
                                        <fmt:formatDate value="${bestArticles[1].boardDate}"
                                            pattern="yyyy-MM-dd a hh:mm:ss" /> <br>
                                        <p>조회수: ${bestArticles[1].boardViewCnt}</p>
                                    </span>
                                </h4>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="single-post">
                                <img src="../../img/post-image2.jpg" alt="">
                                <h3><a
                                        href="single?serialNo=${bestArticles[2].serialNo}&categoryNo=${bestArticles[2].categoryNo}">${bestArticles[2].boardTitle}</a>
                                </h3>
                                <!-- 게시글 내용 -->
                                <!-- <p>${bestArticles[2].boardContent}</p> -->
                                <h4>
                                    <span>
                                        <fmt:formatDate value="${bestArticles[2].boardDate}"
                                            pattern="yyyy-MM-dd a hh:mm:ss" /> <br>
                                        <p>조회수: ${bestArticles[2].boardViewCnt}</p>
                                    </span>
                                </h4>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="single-post">
                                <img src="../../img/post-image2.jpg" alt="">
                                <h3><a
                                        href="single?serialNo=${bestArticles[3].serialNo}&categoryNo=${bestArticles[3].categoryNo}">${bestArticles[3].boardTitle}</a>
                                </h3>
                                <!-- 게시글 내용 -->
                                <!-- <p>${bestArticles[3].boardContent}</p> -->
                                <h4>
                                    <span>
                                        <fmt:formatDate value="${bestArticles[3].boardDate}"
                                            pattern="yyyy-MM-dd a hh:mm:ss" /> <br>
                                        <p>조회수: ${bestArticles[3].boardViewCnt}</p>
                                    </span>
                                </h4>
                            </div>
                        </div>


                        <!-- ############## 카테고리별 전체 게시글(페이징 들어가는 부분) ############## -->

                        <div class="single-post">
                            <h3>
                                <span class="main-title">전체글</span>
                            </h3>
                        </div>

                        <div class="list-container">
                            <!-- <div class="amount">
                                <a
                                    href="/board/list?amount=10&type=${maker.page.type}&keyword=${maker.page.keyword}">10</a>
                                <a
                                    href="/board/list?amount=20&type=${maker.page.type}&keyword=${maker.page.keyword}">20</a>
                                <a
                                    href="/board/list?amount=30&type=${maker.page.type}&keyword=${maker.page.keyword}">30</a>
                            </div> -->

                            <table border="1" id="list-table" class="table table-sm" width="100%">

                                <tr>
                                    <th>boardNo</th>
                                    <th>seiralNo</th>
                                    <th>신규글 여부</th>
                                    <th width="50%">제목</th>
                                    <th>작성시간</th>
                                    <th>조회수</th>
                                    <th>비고</th>
                                </tr>

                                <!-- 컨트롤러의 article 리스트(?)를 변수 a에 대입 -->
                                <!-- 오류원인: items가 ${articles}가 아닌 ${article}로 되어야
                                    하고, var가 article 이면 변수명이 겹쳐서 500 오류가 된다. -->
                                <c:forEach var="a" items="${article}">
                                    <tr class="table-hover">
                                        <td>${a.boardNo}</td>
                                        <td>${a.serialNo}</td>
                                        <td>${a.newFlag}</td>
                                        <td>
                                            <a
                                                href="/board/single?serialNo=${a.serialNo}&categoryNo=${a.categoryNo}">${a.boardTitle}</a>

                                            <!-- 신규, 인기 뱃지 -->
                                            <c:choose>
                                                <c:when test="${a.newFlag}">
                                                    <span class="badge rounded-pill bg-primary">new</span>
                                                </c:when>
                                                <c:when test="${a.boardViewCnt >= 20}">
                                                    <span class="badge bg-info text-dark">hit</span>
                                                </c:when>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <fmt:formatDate value="${a.boardDate}" pattern="yyyy-MM-dd a hh:mm:ss" />
                                        </td>
                                        <td>${a.boardViewCnt}</td>
                                        <td>
                                            <a data-serial-no=${a.serialNo}
                                                class="badge rounded-pill bg-secondary del-btn" href="#">삭제</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="pegination">
                <!--
                <ul>
                    <li><i class="fa fa-angle-left" aria-hidden="true"></i></li>
                    <li class="active">1</li>
                    <li>2</li>
                    <li>3</li>
                    <li><i class="fa fa-angle-right" aria-hidden="true"></i></li>
                </ul>
-->

                <div class="nav-links">
                    <!-- 1번만 span인 이유가 있나요? a로 바꾸었는데 문제있으면 확인해봐야할거같아요 -->
                    <a class="page-numbers current">1</a>
                    <a class="page-numbers" href="#">2</a>
                    <a class="page-numbers" href="#">3</a>
                    <a class="page-numbers" href="#">4</a>
                    <a class="page-numbers" href="#">5</a>
                    <a class="page-numbers" href="#">6</a>
                    <a class="page-numbers" href="#">7</a>
                    <a class="page-numbers" href="#">8</a>
                    <a class="page-numbers" href="#"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
                </div>
            </div>
        </section>

        <%@ include file="../include/footer.jsp" %>

    </div>
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/active.js"></script>
    <script>
        //삭제 버튼 클릭 이벤트
        //삭제 버튼에 바로 달면 첫째줄만 된다. 수많은 삭제여서 버블링, 부모 태그에 써야함
        const delBtn = document.querySelector('del-btn');
        const table = document.querySelector('table');

        table.addEventListener('click', e => {

            if (!e.target.matches('a.del-btn')) {
                console.log('a태그의 del-btn이 아닙니다');
                return;
            }

            e.preventDefault(); //a 태그의 링크가 클릭이벤트보다 우선시되어서 막아야 컨펌기능이 실행된다.
            //console.log('삭제버튼 클릭됨!');

            //article.boardNo 변수는 forEach 함수에서 쓰는 태그라 함수가 끝나면서 사라져 사용이 불가능. => dataset 사용
            const serialNo = e.target.dataset.serialNo;

            console.log(serialNo);

            if (confirm('정말로 삭제하겠습니까?')) {
                location.href = '/board/delete?serialNo=' + serialNo;
            }
        });
    </script>
</body>

</html>