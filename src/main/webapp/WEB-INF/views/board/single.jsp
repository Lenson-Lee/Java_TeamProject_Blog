<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Single page</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700,900" rel="stylesheet">
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="responsive.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
        integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">


    <%@ include file="../include/header.jsp" %>

    <style>
        .table {
            margin: 20px 80px;
            width: 100%;
            height: 100%;
            border-bottom: 1px solid rgb(73, 73, 73);
        }

        .title-box {
            width: 100%;
            border-bottom: 1px solid rgb(73, 73, 73);
        }

        .title {
            font-size: 40px;
            color: rgba(14, 14, 14, 0.699);
        }

        .date {
            font-size: 15px;
            color: rgba(122, 120, 120, 0.699);
        }

        .dateCnt {
            margin-left: -40px;
        }

        .viewCount {
            margin-left: 15px;
            font-size: 15px;
            color: rgba(122, 120, 120, 0.699);
        }

        .content {
            width: 100%;
            height: auto;
            overflow: auto;
            min-height: 7rem;
            background: #fff;
            text-align: center;
            font-size: 15px;
            resize: none;
            padding: 1em;
            padding-bottom: 0.2em;
            white-space: pre-wrap;
        }

        #btns {
            margin-left: 75px;
            margin-bottom: 80px;
        }

        #back-btn,
        #modify-btn,
        #del-btn {
            font-size: 17px;
            margin-right: 20px;
            color: rgba(15, 15, 15, 0.699);
        }

        #back-btn:hover,
        #modify-btn:hover,
        #del-btn:hover {
            color: rgba(26, 110, 189, 0.699);
        }
    </style>

</head>

<body>
    <div class="wrapper">
        
        <%@ include file="../include/static-category.jsp" %>

        <section class="single-blog-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="border-top">
                            <div class="col-md-8">
                                <div class="blog-area">
                                    <div class="blog-area-part">
                                        <div class="container">
                                            <div class="row">
                                                <div class="offset-md-1 col-md-10">

                                                    <div class="table">
                                                        <!-- <h1>${article.serialNo}번 게시물 내용</h1> -->
                                                        <div class="title-box">
                                                            <h1 class="title">${article.boardTitle}</h1><br>
                                                            <ul class="dateCnt">
                                                                <h15 class="date">
                                                                    <fmt:formatDate value="${article.boardDate}"
                                                                        pattern="yyyy-MM-dd a hh:mm:ss" />
                                                                </h15>
                                                                <h15 class="viewCount">조회수 ${article.boardViewCnt}</h15>
                                                            </ul>
                                                        </div>


                                                        <p>
                                                            <pre class="content">${article.boardContent}</pre>
                                                        </p>

                                                    </div>

                                                    <!-- history.back 함수 사용 -->
                                                    <!-- 무조건 지금 보는 페이지의 이전페이지로만 이동 가능합니다! -->

                                                    <div id="btns">
                                                        <c:set var="categoryNo" value="${article.categoryNo}" />

                                                        <c:choose>
                                                            <c:when test="${categoryNo eq '1'}">
                                                                <a id="back-btn" href="/board/movie-list"
                                                                    style="text-decoration: none;">이전 목록</a>&nbsp;
                                                            </c:when>
                                                            <c:when test="${categoryNo eq '2'}">
                                                                <a id="back-btn" href="/board/restaurant-list"
                                                                    style="text-decoration: none;">이전 목록</a>&nbsp;
                                                            </c:when>
                                                            <c:when test="${categoryNo eq '3'}">
                                                                <a id="back-btn" href="/board/daily-list"
                                                                    style="text-decoration: none;">이전 목록</a>&nbsp;
                                                            </c:when>
                                                        </c:choose>


                                                        <a id="modify-btn"
                                                            href="/board/modify?serialNo=${article.serialNo}&categoryNo=${article.categoryNo}"
                                                            style="text-decoration: none;">글
                                                            수정하기</a>
                                                        <a data-serial-no="${article.serialNo}" id="del-btn" href="#"
                                                            style="text-decoration: none;">삭제</a>
                                                    </div>

                                                </div>

                                            </div>


                                            <footer class="footer">
                                                <div class="container">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="footer-bg">
                                                                <div class="row">
                                                                    <div class="col-md-9">
                                                                        <div class="footer-menu">
                                                                            <ul>
                                                                                <li class="active"><a href="#">Home</a>
                                                                                </li>
                                                                                <li><a href="#">lifestyle</a></li>
                                                                                <li><a href="#">Food</a></li>
                                                                                <li><a href="#">Nature</a></li>
                                                                                <li><a href="#">photography</a></li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <div class="footer-icon">
                                                                            <p><a href="#"><i class="fa fa-facebook"
                                                                                        aria-hidden="true"></i></a><a
                                                                                    href="#"><i class="fa fa-twitter"
                                                                                        aria-hidden="true"></i></a><a
                                                                                    href="#"><i class="fa fa-linkedin"
                                                                                        aria-hidden="true"></i></a><a
                                                                                    href="#"><i class="fa fa-dribbble"
                                                                                        aria-hidden="true"></i></a></p>
                                                                        </div>
                                                                    </div>
                                                                </div> .
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>



                                            </footer>
                                        </div>
                                        <script src="js/jquery-3.1.1.min.js"></script>
                                        <script src="js/bootstrap.min.js"></script>
                                        <script src="js/owl.carousel.min.js"></script>
                                        <script src="js/isotope.pkgd.js"></script>
                                        <script src="js/active.js"></script>

                                        <script>
                                            //삭제 버튼 클릭 이벤트
                                            const btn = document.getElementById('del-btn');
                                            btn.addEventListener('click', D => {
                                                D.preventDefault(); //a태그 링크이동기능 중지
                                                console.log('삭제버튼 클릭됨!');
                                                const serialNo = D.target.dataset.serialNo;
                                                console.log(serialNo);
                                                location.href = '/board/delete?serialNo=' + serialNo;
                                            });

                                            //텍스트 길이에 맞게 높이 설정
                                            function resize(obj) {
                                                obj.style.height = "1px";
                                                obj.style.height = (12 + obj.scrollHeight) + "px";
                                            }
                                            
                                        </script>


</body>

</html>