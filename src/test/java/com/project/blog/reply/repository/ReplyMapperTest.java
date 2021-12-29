package com.project.blog.reply.repository;

import com.project.blog.common.paging.Page;
import com.project.blog.reply.domain.Reply;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ReplyMapperTest {

    @Autowired
    ReplyMapper replyMapper;

    @Test
    @DisplayName("특정 글번호 게시글에 댓글 3개 삽입.")
    void insertTest() {
        for (int i = 1; i < 4; i++) {
            Reply reply = new Reply();
            reply.setBoardNo(501);
            reply.setReplyText("테스트" + i);
            reply.setReplyWriter("글쓴이" + i);

            replyMapper.save(reply);
        }
    }

    @Test
    @DisplayName("특정 게시물을 수정할 수 있어야 한다.")
    void updateTest() {
//        Reply reply = replyMapper.read(1);
//        reply.setReplyText("수정된 댓글");
//
//        replyMapper.update(reply);
//
//        assertEquals(reply.getReplyText(), replyMapper.read(1).getReplyText());
    }

    @Test
    @DisplayName("특정 게시물의 댓글 리스트를 불러올 수 있어야 한다.")
    void getListTest() {
        List<Reply> list = replyMapper.getList(501, new Page(1, 10));
        System.out.println("==========================");
        for (Reply reply : list) {
            System.out.println(reply);
        }
        assertEquals(3, list.size());
    }

    @Test
    @DisplayName("특정 게시물을 삭제할 수 있어야 한다.")
    @Transactional
    @Rollback //삭제 후 테스트가 끝나면 롤백이 된다.
    void deleteTest() {
        replyMapper.delete(1);
        replyMapper.delete(2);

//        501번 게시글의 댓글 갯수가 1개가 남았다는 뜻
        assertTrue(replyMapper.getList(501, new Page(1, 10)).size() == 1);

    }


}