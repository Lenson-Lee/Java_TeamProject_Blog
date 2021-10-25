<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My Blog</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700,900" rel="stylesheet">
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/style.css">
    <link rel="stylesheet" href="/responsive.css">
    <!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"> -->

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

        .footer-icon p {
            z-index: 100;
        }



    </style>
</head>

<body>

    <div class="wrapper">
        
        <header class="header">
            <div class="container">
                <div class="row">
                    <div class="col-md-2">
                        <div class="logo">
                            <h2><a href="/">My Blog</a></h2>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="menu">
                            <ul>
                                <li class=${flag == null ? 'active' : ''}><a href="/">홈</a></li>
                                <li class=${flag == 'movie' ? 'active' : ''}><a href="/board/movie-list">영화</a></li>
                                <li class=${flag == 'res' ? 'active' : ''}><a href="/board/restaurant-list">맛집</a></li>
                                <li class=${flag == 'day' ? 'active' : ''}><a href="/board/daily-list">일상</a></li>
                                <li><a href="/board/guest-book">전체</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <!-- 메인 사진 -->
        <section class="bg-text-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="bg-text">
                            <h3>My Blog</h3>
                            <p>My blog is a blog that provides various reviews and information on the theme of movies, restaurants, and daily life. Let me ask of your attention.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <%@ include file="include/footer.jsp" %>

    </div>

    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/active.js"></script>
</body>

</html>