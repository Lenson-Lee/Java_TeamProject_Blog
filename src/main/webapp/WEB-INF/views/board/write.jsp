<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Front page</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700,900" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="responsive.css">
    <link rel="stylesheet" href="/css/write.css?ver=1">

    <%@ include file="../include/header.jsp" %>

    <style>

    </style>
</head>

<body>
    <div class="wrapper">

        <%@ include file="../include/static-category.jsp" %>

        <section class="write">

            <h1>BLOG 게시글 등록</h1>

            <div class="inputmenu">

                <form action="/board/write" method="post">
                    카테고리: <input type="radio" name="categoryNo" value="1" checked="checked">영화
                    <input type="radio" name="categoryNo" value="2"> 맛집
                    <input type="radio" name="categoryNo" value="3"> 일상 <br>

                    <input id="title" type="text" class="input" name="boardTitle" placeholder="제목을 입력하세요."><br>
                    <br>
                    <textarea id="textArea" rows="60" class="input" cols="40" name="boardContent"
                        placeholder="내용을 입력하세요."></textarea><br>

                        

                    <button type="submit">등록</button>
                    

                </form>

            </div>

            <!-- herf는 카테고리별로 이동하게 만들어야함! -->
            <a id="boardlist" href="movie-list" style="text-decoration: none;">글 목록보기</a>

        </section>

        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="footer-bg">
                            <div class="row">
                                <div class="col-md-9">
                                    <div class="footer-menu">
                                        <ul>
                                            <li class="active"><a href="#">Home</a></li>
                                            <li><a href="#">lifestyle</a></li>
                                            <li><a href="#">Food</a></li>
                                            <li><a href="#">Nature</a></li>
                                            <li><a href="#">photography</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="footer-icon">
                                        <p><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a><a
                                                href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a><a
                                                href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a><a
                                                href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a></p>
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
    <script src="js/active.js"></script>
</body>

</html>