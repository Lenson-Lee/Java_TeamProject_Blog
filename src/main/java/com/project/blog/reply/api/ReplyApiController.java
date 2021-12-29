package com.project.blog.reply.api;

import com.project.blog.common.paging.Page;
import com.project.blog.reply.service.ReplyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

import static org.springframework.http.HttpStatus.OK;

@RequiredArgsConstructor
@Log4j2
@CrossOrigin
@RestController
@RequestMapping("/api/v1/reply")
public class ReplyApiController {

    private final ReplyService replyService;

    //댓글 목록 조회 요청 처리//리턴은 무조건 리스포스 엔티티라고 생각하기
    //RestApi 설계(이건 내 맘이다? /v1/reply/320/3 320글 목록의 3페이지?
    @GetMapping("/{boardNo}/{page}")
    public ResponseEntity<Map<String, Object>> list(
            //경로를통해 변수를 이용하겠다 @PathVariable
            @PathVariable int boardNo   //320
            , @PathVariable("page") int pageNum) {  //3, 페이지를 읽어서 페이지넘에 넣는다.
        log.info("/api/v1/reply/" + boardNo + "GET!");

        Page page = new Page(pageNum, 10);  //위의 요청페이지 넘이 여기 들어온다.
        Map<String, Object> replyList = replyService.getList(boardNo, page);

        return new ResponseEntity<>(replyList, OK);
    }

}
