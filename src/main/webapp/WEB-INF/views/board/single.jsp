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

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
        integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

    <%@ include file="../include/header.jsp" %>

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

                                                    <div class="single-table">
                                                        <!-- <h1>${article.serialNo}번 게시물 내용</h1> -->
                                                        <div class="single-title-box">
                                                            <h1 class="single-title">${article.boardTitle}</h1><br>
                                                            <ul class="single-dateCnt">
                                                                <h15 class="single-date">
                                                                    <fmt:formatDate value="${article.boardDate}"
                                                                        pattern="yyyy-MM-dd a hh:mm:ss" />
                                                                </h15>
                                                                <h15 class="single-viewCount">조회수
                                                                    ${article.boardViewCnt}</h15>
                                                            </ul>
                                                        </div>

                                                        <p>
                                                            <pre class="single-content">${article.boardContent}</pre>
                                                        </p>

                                                    </div>

                                                    <!-- history.back 함수 사용 -->
                                                    <!-- 무조건 지금 보는 페이지의 이전페이지로만 이동 가능합니다! -->

                                                    <div id="btns">
                                                        <c:set var="categoryNo" value="${article.categoryNo}" />

                                                        <c:choose>
                                                            <c:when test="${categoryNo eq '1'}">
                                                                <a id="back-btn" class='btn btn-default'
                                                                    href="/board/movie-list"
                                                                    style="text-decoration: none;">이전 목록</a>&nbsp;
                                                            </c:when>
                                                            <c:when test="${categoryNo eq '2'}">
                                                                <a id="back-btn" class="btn btn-default"
                                                                    href="/board/restaurant-list"
                                                                    style="text-decoration: none;">이전 목록</a>&nbsp;
                                                            </c:when>
                                                            <c:when test="${categoryNo eq '3'}">
                                                                <a id="back-btn" class="btn btn-default"
                                                                    href="/board/daily-list"
                                                                    style="text-decoration: none;">이전 목록</a>&nbsp;
                                                            </c:when>
                                                        </c:choose>

                                                        <div class="mod-del">
                                                            <a id="modify-btn" class="btn btn-default"
                                                                href="/board/modify?serialNo=${article.serialNo}&categoryNo=${article.categoryNo}"
                                                                style="text-decoration: none;">글
                                                                수정하기</a>
                                                            <a data-serial-no="${article.serialNo}"
                                                                data-category-no="${article.categoryNo}" id="del-btn"
                                                                class="btn btn-danger" href=""
                                                                style="text-decoration: none;">삭제</a>
                                                        </div>

                                                    </div>

                                                </div>

                                            </div>


                                            <!-- ###################################################################### -->
                                            <!-- ############################## 댓글 영역 ############################## -->
                                            <!-- ###################################################################### -->

                                            <div id="replies" class="row single-table">
                                                <div class="offset-md-1 col-md-10">
                                                    <!-- 댓글 쓰기 영역 -->
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col-md-9">
                                                                    <div class="form-group">
                                                                        <label for="newReplyText" hidden>댓글 내용</label>
                                                                        <textarea rows="3" id="newReplyText"
                                                                            name="replyText" class="form-control"
                                                                            placeholder="댓글을 입력해주세요."></textarea>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-3">
                                                                    <div class="form-group">
                                                                        <label for="newReplyWriter" hidden>댓글
                                                                            작성자</label>
                                                                        <input id="newReplyWriter" name="replyWriter"
                                                                            type="text" class="form-control"
                                                                            placeholder="작성자 이름"
                                                                            style="margin-bottom: 6px;">

                                                                        <button id="replyAddBtn" type="button"
                                                                            class="btn btn-dark form-control">등록</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div> <!-- end reply write -->

                                                    <!-- ############################## 댓글 내용 영역 ############################## -->
                                                    <div class="card">
                                                        <!-- 댓글 내용 헤더 -->
                                                        <div class="card-header text-white m-0"
                                                            style="background: #343A40;">
                                                            <div class="float-left">댓글 (<span id="replyCnt">0</span>)
                                                            </div>
                                                        </div>

                                                        <!-- 댓글 내용 바디 -->
                                                        <div id="replyCollapse" class="card">
                                                            <div id="replyData">
                                                                <!-- JS로 댓글 정보 DIV삽입 - 437번줄 -->
                                                            </div>

                                                            <!-- 댓글 페이징 영역 -->
                                                            <ul class="pagination justify-content-center">
                                                                <!-- JS로 댓글 페이징 DIV삽입 -->
                                                            </ul>
                                                        </div>
                                                    </div> <!-- end reply content -->
                                                </div>
                                            </div> <!-- end replies row -->
                                        </div> <!-- end content container -->


                                        <!-- 댓글 수정 모달 id에 집중 댓글태그부분에 수정코드에 아이디 들어있는거 확인 가능.. href = '#replyModify : 아이디로 연결-->
                                        <!-- 하얀 수정버튼 클릭: 수정하기 창 오픈 + 원래 글 내용을 창에 띄우고 data-replyid의 값과 함께 modal replyId에 넣어야한다. -->

                                        <!-- 1. 수정창 진입 이벤트, 2. 수정창 완료 이벤트 -->
                                        <div class="modal fade bd-example-modal-lg" id="replyModifyModal">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">

                                                    <!-- Modal Header -->
                                                    <div class="modal-header"
                                                        style="background: #343A40; color: white;">
                                                        <h4 class="modal-title">댓글 수정하기</h4>
                                                        <button type="button" class="close text-white"
                                                            data-bs-dismiss="modal">X</button>
                                                    </div>

                                                    <!-- Modal body -->
                                                    <!-- 수정 클릭시 input의 type에 value가 들어가야 하고 수정된 내용이 들어가야한다.. -->
                                                    <div class="modal-body">
                                                        <div class="form-group">
                                                            <input id="modReplyId" type="hidden">
                                                            <label for="modReplyText" hidden>댓글내용</label>
                                                            <textarea id="modReplyText" class="form-control"
                                                                placeholder="수정할 댓글 내용을 입력하세요." rows="3"></textarea>
                                                        </div>
                                                    </div>

                                                    <!-- Modal footer -->
                                                    <div class="modal-footer">
                                                        <button id="replyModBtn" type="button"
                                                            class="btn btn-dark">수정</button>
                                                        <button id="modal-close" type="button" class="btn btn-danger"
                                                            data-bs-dismiss="modal">닫기</button>
                                                    </div>


                                                </div>
                                            </div>
                                        </div>
                                        <!-- end replyModifyModal -->

                                        <%@ include file="../include/footer.jsp" %>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
    </section>

    <!-- 제이쿼리는 include.header.jsp에 넣어두었습니다.
    <script src="js/jquery-3.1.1.min.js"></script> -->

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
            const categoryNo = D.target.dataset.categoryNo;
            console.log(serialNo);
            console.log(categoryNo);

            location.href = '/board/delete?serialNo=' + serialNo +
                '&categoryNo=' + categoryNo;
        });

        //텍스트 길이에 맞게 높이 설정
        function resize(obj) {
            obj.style.height = "1px";
            obj.style.height = (12 + obj.scrollHeight) + "px";
        }
    </script>


    <!-- ######################### -->
    <!-- 댓글 관련 스크립트 J Query -->
    <!-- ######################### -->

    <script>
        //댓글 처리 js 
        //start jqery
        $(function () {

            // 원본 글 번호(서버에서 날아온다. : n번 게시물 내용, 숫자로 받고싶으면 +\$ { }\처럼 앞에 + 붙이기,여기서는 ㄴㄴ)
            // jsp에서는 주석 속 달러 중괄호도 읽어버려서 오류 생기니까 위에처럼 표시하기ㅜㅜ
            const boardNo = '${article.serialNo}';


            //날짜 포맷 변환 함수
            function formatDate(datetime) {
                //문자열 날짜 데이터를 날짜객체로 변환
                const dateObj = new Date(datetime);
                console.log("날짜 객체");
                console.log(dateObj);
                //날짜객체를 통해 각 날짜 정보 얻기
                let year = dateObj.getFullYear();

                //## 주의할 점: 1월이 0으로 설정되어 있어서 1을 더해야 한다.
                let month = dateObj.getMonth() + 1;
                let day = dateObj.getDate();
                let hour = dateObj.getHours();
                let minute = dateObj.getMinutes();

                //오전, 오후 시간체크
                let ampm = '';
                if (hour < 12 && hour >= 6) {
                    ampm = '오전';
                } else if (hour >= 12 && hour < 21) {
                    ampm = '오후';
                    if (hour !== 12) {
                        hour -= 12;
                    }
                } else if (hour >= 21 && hour <= 24) {
                    ampm = '밤';
                    hour -= 12;
                } else {
                    ampm = '새벽';
                }

                //숫자가 1자리일 경우 2자리로 변환
                (month < 10) ? month = '0' + month: month;
                (day < 10) ? day = '0' + day: day;
                (hour < 10) ? hour = '0' + hour: hour;
                (minute < 10) ? minute = '0' + minute: minute;

                return year + "-" + month + "-" + day + " " + ampm + " " + hour + ":" + minute;

            }

            //댓글 페이지 태그 생성 배치함수
            //a링크는 동기요청이라 쓰면 안된다.
            function makePageDOM(pageInfo) {
                let tag = "";

                const begin = pageInfo.beginPage;
                const end = pageInfo.endPage;

                tag += "<div class='nav-links'>"

                //이전 버튼 만들기
                if (pageInfo.prev) {
                    tag += "<li class='page-item page-numbers'><a class='page-link page-active' href='" + (
                            begin - 1) +
                        "'>prev</a></li>";
                }

                //페이지 번호 리스트 만들기
                for (let i = begin; i <= end; i++) {
                    const active = (pageInfo.page.pageNum === i) ? 'p-active' : '';
                    tag += "<li class='page-item page-numbers " + active +
                        "'><a class='page-link page-custom' href='" + i +
                        "'>" +
                        i + "</a></li>";
                }

                //다음 버튼 만들기
                if (pageInfo.next) {
                    tag += "<li class='page-item page-numbers'><a class='page-link page-active' href='" + (end +
                            1) +
                        "'>next</a></li>";
                }

                tag += "</div>"

                //태그 삽입하기
                $(".pagination").html(tag);
            }



            //댓글 태그 생성, 배치 함수
            // for문 속에 reply.replyNo는 나중에 수정할 떄를 생각해서 미리 넣어둔 것
            //주루룩 긴 거 리액트로 하면 편해서 요즘엔 리액트 잘 쓴다.
            function makeReplyListDOM(replyMap) {
                let tag = '';

                // 페이지 제작을 여기서 할거라 페이지 정보를 알아야 해서 여기서 나눈다.
                for (let reply of replyMap.replyList) {
                    tag += "<div id='replyContent' class='card-body' data-replyId='" + reply.replyNo + "'>" +
                        "    <div class='row user-block'>" +
                        "       <span class='col-md-3'>" +
                        "         <b>" + reply.replyWriter + "</b>" +
                        "       </span>" +
                        "       <span class='offset-md-6 col-md-3 text-right card-content formdata'><b>" +
                        formatDate(reply
                            .replyDate) +
                        "</b></span>" +
                        "    </div><br>" +
                        "    <div class='row'>" +
                        "       <div class='col-md-6'>" + reply.replyText + "</div>" +
                        "       <div class='text-right card-content'>" +
                        "         <a id='replyModBtn' class='btn badge bg-secondary' data-bs-toggle='modal' data-bs-target='#replyModifyModal'>수정</a>&nbsp;" +
                        "         <a id='replyDelBtn' class='btn badge bg-secondary' href='#'>삭제</a>" +
                        "       </div>" +
                        "    </div>" +
                        " </div>";
                }

                //만든 태그를 댓글목록 안에 배치(제이쿼리)
                //제이쿼리는 훨씬 편하다 주석: 바닐라코드, 하단: 제이쿼리
                //document.querySelector('#replyData').innerHTML = tag;
                $('#replyData').html(tag);

                //댓글 수 배치
                $('#replyCnt').text(replyMap.maker.totalCount);

                //페이지 태그 배치
                makePageDOM(replyMap.maker);

            }


            // 댓글 목록 비동기 요청 처리 함수
            function getReplyList(pageNum) {
                //서버 내부 jsp여서 http 작성 안해도 된다. vscode 라이브는 바깥에서(5500번 포트) 접속이어서 주소가 그랬음.
                fetch('/api/reply/' + boardNo + '/' + pageNum)
                    .then(res => res.json())
                    .then(replyMap => {
                        console.log(replyMap);
                        //맵에는 페이지메이커랑 리플라이리스트가 있어서 오류가 뜬다. 리플라이리스트만 빼서 줘야함.
                        //근데 DOM에서 정보를 알아야 해서 DOM에서 쪼갬 컨트롤누르고 들어가보면 더 알 수 있음~
                        makeReplyListDOM(replyMap);
                    }); //아직까지 제이쿼리 쓴거 없다.
            }

            //페이지 진입시 댓글목록 불러오기
            getReplyList(1);


            //페이지 버튼 클릭 이벤트 ul에 걸거임
            $('.pagination').on('click', 'li a', e => {
                e.preventDefault(); //태그 고유기능 중지
                getReplyList(e.target.getAttribute('href')); //데이터에 심어져있어서?? 근데 텍스트컨텐츠에 심는건 한글이라 안된다. 
            })


            //========================================================================================

            //댓글 등록 처리 addEventListener = on()
            $('#replyAddBtn').on('click', e => {

                const reqInfo = {

                    method: 'POST', //요청 방식
                    headers: { //요청 헤더 내용
                        'content-type': 'application/json'
                    },
                    //서버로 전송할 데이터 JSON
                    body: JSON.stringify({
                        boardNo: boardNo,
                        replyText: $('#newReplyText').val(),
                        replyWriter: $('#newReplyWriter').val()
                    })
                };
                fetch('/api/reply', reqInfo) //이 url로 reqInfo가 나간다
                    .then(res => res.text())
                    .then(msg => {
                        if (msg === 'insertSuccess') {
                            getReplyList(1);
                            //비동기여서 값을 비워주어야 입력창에 텍스트가 사라진다 : val(속에 따옴표로 공백표현)
                            $('#newReplyText').val('');
                            $('#newReplyWriter').val('');
                        } else {
                            alert('댓글 등록에 실패했습니다.');
                        }
                    });
            });

            // ================================= 댓글 수정 이벤트 ====================================

            //댓글 수정 창 진입 이벤트
            const $modal = $('#replyModifyModal');

            //버블링 중요. 모든 댓글에 수정이 가능하게 걸려야 해서 감싸는 부모 div id=replyData에 걸어야한다.
            //if(not e. target matches)? 와 같은게 #replyModBtn넣은거?
            $('#replyData').on('click', '#replyModBtn', e => {
                console.log('수정 창 버튼 클릭');

                //기존 댓글 내용을 가져오기(부모노드로 올라가서 위에 형제 필요)
                const originText = e.target.parentNode.previousElementSibling.textContent;
                console.log('기존 텍스트' + originText);

                //해당 댓글번호 가져오기
                const replyNo = e.target.parentNode.parentNode.parentNode.dataset.replyid;
                console.log('댓글 번호' + replyNo);
                //댓글내용 모달에 넣어놓기
                $('#modReplyText').val(originText);
                //input hidden에 댓글번호 넣어놓기
                $('#modReplyId').val(replyNo);
            });


            //댓글 수정 완료 이벤트
            $('#replyModBtn').on('click', e => {
                console.log('완료버튼클릭!');

                //자바 보면 {/rno}인걸 확인 가능, 변수 rno 설정해서 값 주기
                //콘솔 보면 id가 modReplyId인 input의 value를 빼야한다.
                const rno = $('#modReplyId').val();

                const reqInfo = {
                    method: 'PUT',
                    headers: {
                        //modify에서 @Requestbody해야해서
                        'content-type': 'application/json'
                    },
                    body: JSON.stringify({
                        //객체안에는 수정에 필요한 정보를 담는다
                        replyNo: rno,
                        replyText: $('#modReplyText').val()
                    })
                }
                //요청
                fetch('/api/reply/' + rno, reqInfo)

                    .then(res => res.text()) //그러면 요청텍스트가 온다
                    .then(msg => { //그러면 성공메시지/실패메시지 나온다

                        if (msg === 'modSuccess') {

                            //부트스트랩함수, 모달 숨김 <-> show: 모달열림
                            $modal.modal('hide');
                            //목록조회 다시해서 수정된거로 가져오기
                            $('#modal-close').click();
                            getReplyList(1);

                        } else {
                            alert('댓글 수정 실패!');
                        }
                    });
            });


            //댓글 삭제 비동기 요청 이벤트
            //수많은 삭제 버튼에 달려면 버블링 해야해서 전부 감싸는 div.replyData에 버블링(Del버튼을 누를때만으로 조건 추가)
            //서버에서 삭제할 때 삭제할 댓글 번호를 주어야 해서(DlelteMapping(rno)) replyNo가 필요하다.
            $("#replyData").on("click", "#replyDelBtn", e => {
                const replyId = e.target.parentNode.parentNode.parentNode.dataset.replyid;
                //console.log("삭제 버튼 클릭! : " + replyId);
                if (!confirm("진짜로 삭제할거니??")) { //!confirm으로 False가 나오면 true발동
                    return;
                }
                const reqInfo = {
                    method: 'DELETE' //작성안하면 Get요청으로 된다.
                };
                fetch('/api/reply/' + replyId, reqInfo)
                    .then(res => res.text())
                    .then(msg => {
                        if (msg === 'delSuccess') {
                            getReplyList(1);
                        } else {
                            alert("댓글 삭제에 실패했습니다.");
                        }
                    })
            });

        });
    </script>
</body>

</html>