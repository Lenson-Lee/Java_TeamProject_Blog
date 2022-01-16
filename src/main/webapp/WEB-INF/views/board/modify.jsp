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

    <link rel="stylesheet" href="/css/modify.css?ver=1">

    <!-- 위지윅 -->
    <script src="https://cdn.ckeditor.com/4.17.1/standard/ckeditor.js"></script>
    <%@ include file="../include/header.jsp" %>

</head>

<body>
    <%@ include file="../include/login.jsp" %>

    <div class="wrapper">
        <%@ include file="../include/static-category.jsp" %>

        <section class="write">

            <h1>게시물 수정</h1>

            <div class="inputmenu">

                <form action="/board/modify" method="POST" enctype="multipart/form-data">
                    <input type="hidden" class="input" name="categoryNo" value="${article.categoryNo}">
                    <input type="hidden" class="input" name="serialNo" value="${article.serialNo}">
                    <input id="title" type="text" class="input" name="boardTitle" placeholder="제목을 입력하세요."
                        value="${article.boardTitle}"><br>
                    <br>

                    <!-- 첨부파일영역 -->
                    <div class="row">
                        <div class="attach-file-list"></div>
                    </div>

                    <!-- 텍스트 에디터 -->
                    <textarea id="textArea-edit" class="input" name="boardContent">${article.boardContent}
                    </textarea>
                    <br>

                    <!-- ########## 파일 업로드 ########## -->
                    <!-- 비동기 통신을 통한 실시간 파일 업로드 -->
                    <div class="fileDrop">
                        <span>파일을 드래그 하세요</span>
                    </div>

                    <div class="uploadDiv">
                        <input type="file" name="files" id="ajax-file" style="display: none;">
                    </div>

                    <!-- 업로드된 파일의 썸네일을 보여줄 영역 -->
                    <div class="uploaded-list">

                    </div>


                    <button type="submit" id="modify-btn" class="btn btn-default">수정</button>

                    <c:set var="categoryNo" value="${article.categoryNo}" />

                    <c:choose>
                        <c:when test="${categoryNo eq '1'}">
                            <a id="modify-btn" class="btn btn-default" href="/board/movie-list"
                                style="text-decoration: none;">글 목록보기</a>
                        </c:when>
                        <c:when test="${categoryNo eq '2'}">
                            <a id="modify-btn" class="btn btn-default" href="/board/restaurant-list"
                                style="text-decoration: none;">글 목록보기</a>
                        </c:when>
                        <c:when test="${categoryNo eq '3'}">
                            <a id="modify-btn" class="btn btn-default" href="/board/daily-list"
                                style="text-decoration: none;">글 목록보기</a>
                        </c:when>
                    </c:choose>
                </form>

            </div>

        </section>

        <%@ include file="../include/footer.jsp" %>

    </div>
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/active.js"></script>
    <script>
        /* 위지윅 적용 */
        /* 에디터 활성화 name 적기 */
        CKEDITOR.replace('boardContent');
    </script>

    <!-- ######################### -->
    <!-- 첨부파일 관련 스크립트 -->
    <!-- ######################### -->
    <script>
        // 쓰기 기능
        // 첨부파일 드래그 이벤트
        $(function () { //start jQuery

            //drag & drop 이벤트
            const $dropBox = $('.fileDrop');

            //드래그 진입 이벤트
            $dropBox.on('dragover dragenter', e => {
                e.preventDefault();
                $dropBox.css('border-color', 'red')
                    .css('background', 'lightgray');
            });
            //드래그 탈출 이벤트
            $dropBox.on('dragleave', e => {
                e.preventDefault();
                $dropBox.css('border-color', 'gray')
                    .css('background', 'transparent');
            });

            //드롭 이벤트
            $dropBox.on('drop', e => {
                e.preventDefault();
                alert('파일이 추가되었습니다.!');

                //1.드롭된 파일의 데이터를 읽기
                const fileDatas = e.originalEvent.dataTransfer.files;
                console.log('fileDatas: ', fileDatas);

                //2. 읽은 파일 데이터 input태그에 저장
                const $fileInput = $('#ajax-file');
                $fileInput.prop('files', fileDatas);

                //3. 담은 데이터를 서버로 전송
                // - 비동기로 파일을 보내려면 FormData객체가 필요함!
                const formData = new FormData();
                //console.log('input: ', $fileInput);

                const sendFileList = $fileInput[0].files;
                //서버로 전송할 파일들을 formData에 담아 비동기 요청
                for (let file of sendFileList) {
                    formData.append('files', file);
                }

                //4. 업로드 비동기 요청
                const reqInfo = {
                    method: 'POST',
                    body: formData
                };
                fetch('/upload-ajax', reqInfo)
                    .then(res => res.json())
                    .then(pathList => {
                        console.log(pathList);
                        showFileData(pathList);
                    });
            });

            //드롭한 파일의 형식에 따라 태그를 만들어주는 함수
            function showFileData(pathList) {
                //경로: \2021\06\08\dfjskfdjskf_dfjskfdj_dog.gif
                for (let path of pathList) {
                    //이미지인지 아닌지에 따라 구분하여 처리
                    checkExtType(path);
                }
            }

            //확장자 판별 후 태그 생성 처리 함수
            function checkExtType(path) {
                //원본 파일명 추출
                let originFileName = path.substring(path.indexOf("_") + 1);

                const $div = document.createElement('div');
                $div.classList.add('thumbnail-box');

                const $delBtn = document.createElement('a');
                $delBtn.classList.add('del-btn');
                $delBtn.setAttribute('href', path);
                $delBtn.textContent = 'X';

                //게시글 첨부파일 등록을 위한 input:hidden 추가
                const $input = document.createElement('input');
                $input.setAttribute('type', 'hidden');
                $input.setAttribute('name', 'filePathList');
                $input.setAttribute('value', path);

                $div.appendChild($input);

                //이미지인지 확장자 체크
                if (isImageFile(originFileName)) {
                    //이미지인 경우
                    originFileName = originFileName.substring(originFileName.indexOf("_") + 1);

                    const $img = document.createElement('img');
                    $img.setAttribute('src', '/loadFile?fileName=' + path);
                    $img.setAttribute('alt', originFileName);

                    $div.appendChild($img);
                    $div.appendChild($delBtn);


                } else {
                    //이미지가 아닌 경우: 다운로드 링크 생성
                    const $link = document.createElement('a');
                    $link.setAttribute('href', '/loadFile?fileName=' + path);

                    $link.innerHTML = '<img src="/img/file_icon.jpg" alt="파일아이콘"> <span class="file-name">' +
                        originFileName + '</span>';

                    $div.appendChild($link);
                    $div.appendChild($delBtn);
                }
                $('.uploaded-list').append($div);
            }

            //정규표현식으로 이미지파일 여부 확인하는 함수
            function isImageFile(originFileName) {
                const pattern = /jpg$|gif$|png$/i;
                return originFileName.match(pattern);
            }


            //파일 삭제 비동기 요청 클릭 이벤트
            $('.uploaded-list').on('click', '.del-btn', e => {

                e.preventDefault();
                console.log(e.target.getAttribute('href'));

                const path = e.target.getAttribute('href');

                const $uploadedList = document.querySelector('.uploaded-list');

                const $thumbBox = e.target.parentNode;
                $uploadedList.removeChild($thumbBox);

                fetch('/deleteFile?fileName=' + path, {
                        method: 'DELETE'
                    })
                    .then(res => res.text())
                    .then(msg => {
                        if (msg === 'fileDeleteSuccess') {

                        } else {
                            alert('파일 삭제 실패!');
                        }
                    });
            });
        }); //end jQuery

        
        // 읽기 기능
        $(function () {
            const serialNo = '${article.serialNo}';
            const $attachDiv = $('.attach-file-list');

            //첨부파일 경로 목록 요청
            fetch('/board/file/' + serialNo)
                .then(res => res.json())
                .then(filePathList => {
                    console.log("첨부파일 경로 목록 요청", serialNo, filePathList);
                    showFileData(filePathList)
                });

            //드롭한 파일의 형식에 따라 태그(?)를 만들어주는 함수
            function showFileData(pathList) {
                //경로: \2021\06\08\dfjskfdjskf_dfjskfdj_dog.gif
                console.log(pathList);
                for (let path of pathList) {
                    //이미지인지 아닌지에 따라 구분하여 처리
                    console.log("파일 형식에 따라 태그를 만들어", pathList);
                    checkExtType(path);
                }
            }

            //확장자 판별 후 태그 생성 처리 함수
            function checkExtType(path) {
                //원본 파일명 추출
                let originFileName = path.substring(path.indexOf("_") + 1);

                console.log('원본 파일명: ', originFileName);
                const $div = document.createElement('div');
                $div.classList.add('thumbnail-box');


                //이미지인지 확장자 체크
                if (isImageFile(originFileName)) {
                    //이미지인 경우
                    originFileName = originFileName.substring(originFileName.indexOf("_") + 1);

                    const $img = document.createElement('img');
                    $img.setAttribute('src', '/loadFile?fileName=' + path);
                    $img.setAttribute('alt', originFileName);

                    $div.appendChild($img);


                } else {
                    //이미지가 아닌 경우: 다운로드 링크 생성
                    const $link = document.createElement('a');
                    $link.setAttribute('href', '/loadFile?fileName=' + path);

                    $link.innerHTML =
                        '<img src="/img/file_icon.jpg" alt="파일아이콘" class="img-file"> <span class="file-name">' +
                        originFileName + '</span>';

                    $div.appendChild($link);
                }
                $attachDiv.append($div);
            }

            //정규표현식으로 이미지파일 여부 확인하는 함수
            function isImageFile(originFileName) {
                const pattern = /jpg$|gif$|png$/i;
                return originFileName.match(pattern);
            }

        }); //end jquery
    </script>
</body>

</html>