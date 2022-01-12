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

    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/active.js"></script>

    <!-- 위지윅 에디터 ckeditor.com/ textarea 태그에서 활성화 가능해진다. -->
    <!-- 버전 문제같은데 5가 안되어서 4 썼습니다. -->
    <script src="https://cdn.ckeditor.com/4.17.1/standard/ckeditor.js"></script>
</head>

<body>
    <div class="wrapper">

        <%@ include file="../include/static-category.jsp" %>

        <section class="write">

            <h1>게시글 등록</h1>

            <div class="inputmenu">

                <form action="/board/write" method="post" enctype="multipart/form-data">

                    카테고리: <input type="radio" name="categoryNo" value="1" checked="checked">영화
                    <input type="radio" name="categoryNo" value="2"> 맛집
                    <input type="radio" name="categoryNo" value="3"> 일상 <br>

                    <input id="title" type="text" class="input" name="boardTitle" placeholder="제목을 입력하세요."><br>
                    <br>

                    <!-- 텍스트 에디터 -->
                    <textarea id="textArea-edit" class="input" name="boardContent">
                    </textarea>
                    <!-- <textarea id="textArea-edit" rows="60" class="input" cols="40" name="boardContent"></textarea> -->
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
                    <div class="uploaded-list"></div>


                    <input class="btn btn-outline-danger" type="submit" value="등록">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#abc">
                        모달 테스트
                    </button>

                    <button type="submit">등록</button>

                </form>

            </div>

            <!-- herf는 카테고리별로 이동하게 만들어야함! -->
            <a id="boardlist" href="movie-list" style="text-decoration: none;">글 목록보기</a>

            <!-- Modal -->
            <div class="modal fade" id="abc" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                            <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            ...
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <%@ include file="../include/footer.jsp" %>


    </div>


    <script>
        /* 위지윅 적용 */
        /* 에디터 활성화 name 적기 */
        CKEDITOR.replace('boardContent');


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
    </script>
</body>

</html>