<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Front page</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
        integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

    <%@ include file="../include/header.jsp" %>

</head>

<body>

    <%@ include file="../include/login.jsp" %>

    <div class="wrapper">

        <%@ include file="../include/static-category.jsp" %>


        <div class="container">
            <div class="row">
                <div class="offset-md-2 col-md-4">
                    <div class="card" style="width:200%; margin: 0 50%;">
                        <div class="card-header text-white" style="background: #343A40;">
                            <h2 class="card float-left">
                                회원 가입</h2>
                        </div>

                        <div class="card-body">


                            <form action="/member/sign-up" name="signup" id="signUpForm" method="post"
                                style="margin-bottom: 0;">

                                <input type="hidden" name="auth" value="COMMON">

                                <table style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
                                    <tr>
                                        <td style="text-align: left">
                                            <p><strong>아이디를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;
                                                <span id="idChk"></span></p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="account" id="user_id"
                                                class="form-control tooltipstered" maxlength="14" required="required"
                                                aria-required="true"
                                                style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
                                                placeholder="숫자와 영어로 4-14자">
                                        </td>

                                    </tr>

                                    <tr>
                                        <td style="text-align: left">
                                            <p><strong>비밀번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="pwChk"></span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><input type="password" size="17" maxlength="20" id="password"
                                                name="password" class="form-control tooltipstered" maxlength="20"
                                                required="required" aria-required="true"
                                                style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
                                                placeholder="영문과 특수문자를 포함한 최소 8자"></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left">
                                            <p><strong>비밀번호를 재확인해주세요.</strong>&nbsp;&nbsp;&nbsp;<span
                                                    id="pwChk2"></span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><input type="password" size="17" maxlength="20" id="password_check"
                                                name="pw_check" class="form-control tooltipstered" maxlength="20"
                                                required="required" aria-required="true"
                                                style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
                                                placeholder="비밀번호가 일치해야합니다."></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: left">
                                            <p><strong>이름을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="nameChk"></span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="name" id="user_name"
                                                class="form-control tooltipstered" maxlength="6" required="required"
                                                aria-required="true"
                                                style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
                                                placeholder="한글로 최대 6자"></td>
                                    </tr>


                                    <tr>
                                        <td style="text-align: left">
                                            <p><strong>이메일을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span
                                                    id="emailChk"></span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><input type="email" name="email" id="user_email"
                                                class="form-control tooltipstered" required="required"
                                                aria-required="true"
                                                style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
                                                placeholder="ex) abc@mvc.com"></td>
                                    </tr>

                                    <tr>
                                        <td style="width: 100%; text-align: center; colspan: 2;">
                                            <input type="button" value="회원가입" class="btn form-control tooltipstered"
                                                id="signup-btn"
                                                style="background: gray; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">
                                        </td>
                                    </tr>

                                </table>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@ include file="../include/footer.jsp" %>
    </div>

    <script>
        $(function () {
            //입력값 검증 정규표현식
            const getIdCheck = RegExp(/^[a-zA-Z0-9]{4,14}$/);
            const getPwCheck = RegExp(
                /([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
            const getName = RegExp(/^[가-힣]+$/);
            const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);

            //========== 회원가입 입력값 검증 =============//

            //입력을 정확히 했는지 판단하는 변수들
            let chk1 = false,
                chk2 = false,
                chk3 = false,
                chk4 = false,
                chk5 = false;

            //ID검증
            const $idInput = $('#user_id');
            $idInput.on('keyup', e => {
                //아이디를 입력하지 않았거나 공백만 쓰고 넘어간 경우
                if ($idInput.val().trim() === '') {
                    $idInput.css('background', '#ffe1e6');
                    $('#idChk').html('<b style="color:red; font-size:14px;">[아이디는 필수 정보입니다!]</b>');
                    chk1 = false;
                    //아이디를 정규표현식 패턴대로 입력하지 않을 경우
                    //test메서드는 정규표현식을 검증하여 값이 일치하면 true,
                    //일치하지 않으면 false를 리턴
                } else if (!getIdCheck.test($idInput.val())) {
                    $idInput.css('background', '#ffe1e6');
                    $('#idChk').html(
                    '<b style="color:red; font-size:14px;">[영문, 숫자 4~14자로 작성하세요.]</b>');
                    chk1 = false;
                } else {

                    //아이디 중복확인 비동기 요청
                    fetch('/check?type=account&keyword=' + $idInput.val())
                        .then(res => res.text())
                        .then(flag => {
                            console.log(flag);
                            if (flag === 'true') {
                                //중복된!
                                $idInput.css('background', '#ffe1e6');
                                $('#idChk').html(
                                    '<b style="color:red; font-size:14px;">[아이디가 중복되었습니다.]</b>');
                                chk1 = false;
                            } else {
                                //중복안됨!
                                $idInput.css('background', '#dae5e963');
                                $('#idChk').html(
                                    '<b style="color:green; font-size:14px;">[사용 가능한 아이디 입니다.]</b>');
                                chk1 = true;
                            }
                        });
                    /*setTimeout(() => {
                        fetch('/check?type=account&keyword=' + $idInput.val())
                        .then(res => res.text())
                        .then(flag => {
                            console.log(flag);
                        })
                    }, 3000);*/



                }
            });


            //패스워드 입력값 검증.
            $('#password').on('keyup', function () {
                //비밀번호 공백 확인
                if ($("#password").val().trim() === "") {
                    $('#password').css("background-color", "#ffe1e6");
                    $('#pwChk').html('<b style="font-size:14px;color:red;">[패스워드는 필수 정보입니다.]</b>');
                    chk2 = false;
                }
                //비밀번호 유효성검사
                else if (!getPwCheck.test($("#password").val()) || $("#password").val().length < 8) {
                    $('#password').css("background-color", "#ffe1e6");
                    $('#pwChk').html('<b style="font-size:14px;color:red;">[특수문자 포함 8자이상]</b>');
                    chk2 = false;
                } else {
                    $('#password').css("background-color", "#dae5e963");
                    $('#pwChk').html('<b style="font-size:14px;color:green;">[패스워드가 확인되었습니다.]]</b>');
                    chk2 = true;
                }

            });

            //패스워드 확인란 입력값 검증.
            $('#password_check').on('keyup', function () {
                //비밀번호 확인란 공백 확인
                if ($("#password_check").val().trim() === "") {
                    $('#password_check').css("background-color", "#ffe1e6");
                    $('#pwChk2').html('<b style="font-size:14px;color:red;">[패스워드확인은 필수정보입니다.]</b>');
                    chk3 = false;
                }
                //비밀번호 확인란 유효성검사
                else if ($("#password").val() !== $("#password_check").val()) {
                    $('#password_check').css("background-color", "#ffe1e6");
                    $('#pwChk2').html('<b style="font-size:14px;color:red;">[동일한 패스워드를 입력해 주세요.]]</b>');
                    chk3 = false;
                } else {
                    $('#password_check').css("background-color", "#dae5e963");
                    $('#pwChk2').html('<b style="font-size:14px;color:green;">[패스워드가 확인되었습니다.]</b>');
                    chk3 = true;
                }

            });

            //이름 입력값 검증.
            $('#user_name').on('keyup', function () {
                //이름값 공백 확인
                if ($("#user_name").val().trim() === "") {
                    $('#user_name').css("background-color", "#ffe1e6");
                    $('#nameChk').html('<b style="font-size:14px;color:red;">[이름은 필수 정보입니다.]</b>');
                    chk4 = false;
                }
                //이름값 유효성검사
                else if (!getName.test($("#user_name").val())) {
                    $('#user_name').css("background-color", "#ffe1e6");
                    $('#nameChk').html('<b style="font-size:14px;color:red;">[이름은 한글로 입력해 주십시오.]</b>');
                    chk4 = false;
                } else {
                    $('#user_name').css("background-color", "#dae5e963");
                    $('#nameChk').html('<b style="font-size:14px;color:green;">[확인이 완료되었습니다.]</b>');
                    chk4 = true;
                }

            });

            //이메일 입력값 검증.
            const $emailInput = $('#user_email');
            $emailInput.on('keyup', function () {
                //이메일값 공백 확인
                if ($emailInput.val().trim() === "") {
                    $emailInput.css("background-color", "#ffe1e6");
                    $('#emailChk').html('<b style="font-size:14px;color:red;">[이메일은 필수 정보입니다.]</b>');
                    chk5 = false;
                }
                //이메일값 유효성검사
                else if (!getMail.test($emailInput.val())) {
                    $emailInput.css("background-color", "#ffe1e6");
                    $('#emailChk').html('<b style="font-size:14px;color:red;">[올바르지 않은 이메일 형식입니다.]</b>');
                    chk5 = false;
                } else {

                    //이메일 중복확인 비동기 통신
                    fetch('/check?type=email&keyword=' + $emailInput.val())
                        .then(res => res.text())
                        .then(flag => {
                            //console.log(flag);
                            if (flag === 'true') {
                                $emailInput.css('background', '#ffe1e6');
                                $('#emailChk').html(
                                    '<b style="font-size:14px; color:red;">[이메일이 중복되었습니다.]</b>');
                                chk5 = false;
                            } else {
                                $emailInput.css('background', '#dae5e963');
                                $('#emailChk').html(
                                    '<b style="font-size:14px; color:green;">[사용가능한 이메일입니다.]</b>'
                                    );
                                chk5 = true;
                            }
                        });
                }

            });


            //회원가입 버튼 클릭 이벤트
            $('#signup-btn').on('click', e => {

                if (chk1 && chk2 && chk3 && chk4 && chk5) {
                    //form Node
                    $('#signUpForm').submit(); //수동 submit
                } else {
                    alert('입력값을 확인하세요!');
                }
            });

        }); //JQUERY END
    </script>

</body>

</html>