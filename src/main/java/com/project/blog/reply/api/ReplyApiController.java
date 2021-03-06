package com.project.blog.reply.api;

import com.project.blog.common.paging.Page;
import com.project.blog.reply.domain.Reply;
import com.project.blog.reply.service.ReplyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

import static org.springframework.http.HttpStatus.INTERNAL_SERVER_ERROR;
import static org.springframework.http.HttpStatus.OK;

@RequiredArgsConstructor
@Log4j2
@CrossOrigin
@RestController
@RequestMapping("/api/reply")
public class ReplyApiController {

    private final ReplyService replyService;

    //주소 원리: @RequestMapping 주소 + @GetMapping 주소
    //부메랑 실행 후 http://localhost:8183/api/reply/501/1 => boardNo 501 글의 1페이지로 이동
    //현재 댓글 sql boardNo는 게시글의 시리얼 넘버를 뜻하고, reply_no가 댓글 고유 번호를 뜻함.
    //RestApi 설계는 내 맘이다(?)


    //댓글 목록 조회 요청 처리//리턴은 무조건 리스포스 엔티티라고 생각하기
    @GetMapping("/{boardNo}/{page}")
    public ResponseEntity<Map<String, Object>> list(
            //경로를통해 변수를 이용하겠다 @PathVariable
            @PathVariable int boardNo   //501번 게시글이 들어갔음
            , @PathVariable("page") int pageNum) {  //3, 페이지를 읽어서 페이지넘에 넣는다.
        log.info("/api/reply/" + boardNo + "GET!");

        Page page = new Page(pageNum, 10);  //위의 요청페이지 넘이 여기 들어온다.
        Map<String, Object> replyList = replyService.getList(boardNo, page);

        return new ResponseEntity<>(replyList, OK);
    }


    //댓글 등록 처리 요청(주소입력값에 new 등등 쓸데없는 단어는 없이 숫자만 나오도록)
    //http://localhost:8183/api/reply
    //POST 방식 선택 후 {
    //            "replyNo": 11,
    //            "boardNo": 501,
    //            "replyText": "수정된 댓글",
    //            "replyWriter": "글쓴이1"
    //        } 입력하면 success
    @PostMapping("")
    //@RequestBody: 클라이언트에서 전달한 JSON 데이터를 자바객체로 변환해준다.
    public ResponseEntity<String> create(@RequestBody Reply reply) {
        log.info("/api/reply POST! - public create");

        //상항연산자를 통해 불린값 register 의 결과에 따라 반환이 다름
        return replyService.register(reply)
                ? new ResponseEntity<>("insertSuccess", OK)
                : new ResponseEntity<>("insertFail", INTERNAL_SERVER_ERROR);

        //테스트는 크롬 부메랑에서 POST 매핑으로 JSON 객체 입력으로 테스트
    }

    //댓글 수정 요청 처리(/reply/댓글번호)
    //@PathVariable: rno 를 읽어서 reply 에 넣어라
    @PutMapping("/{rno}")
    public ResponseEntity<String> modify(@PathVariable("rno") int replyNo, @RequestBody Reply reply) {

        //읽은 replyNo 를 원본댓글번호에 넣어준다.
        reply.setReplyNo(replyNo);
        log.info("/api/reply" + replyNo + "PUT - " + reply);

        //Http.Status.OK 같은거 static 데이터여서 상수선언하는거? 외부 데이터처럼 HttpStatus. 작성 말고 알트엔터 후 세번째 add all static~~ 사용하면 된다. 앞으로 클래스이름 안밝혀도 된다?
        //System.out.println() 도 앞에 있는 시스템을 적기 싫을 때 알트앤터 하면 모든 스테틱 메서드, 스테틱 필드를 system.을 생략하고 사용 가능
        //상수같은거 매번 뭐뭐 . 하기 싫으면 이렇게 하면 된다.
        return replyService.modify(reply)
                ? new ResponseEntity<>("modSuccess", OK)
                : new ResponseEntity<>("modFail", INTERNAL_SERVER_ERROR);
        //입력했던 댓글 replyNo를 신경써서 테스트해야함
    }

    //댓글 삭제 요청 처리
    //주의할 점은 GET,PUT 등 방식에 따라 다름 다 같은게 아님.
//    http://localhost:8183/api/reply/2 -> DELETE 하면 댓글번호 2번을 지운다.
    @DeleteMapping("/{rno}")
    public ResponseEntity<String> remove(@PathVariable("rno") int replyNo) {
        //제이슨을 보낼 건 없고 주소에 댓글번호 주소만 얹으면 된다.
        log.info("/api/reply/" + replyNo + "DELETE !!");

        return replyService.remove(replyNo)
                ? new ResponseEntity<>("delSuccess", OK)
                : new ResponseEntity<>("delFail", INTERNAL_SERVER_ERROR);
    }


}
