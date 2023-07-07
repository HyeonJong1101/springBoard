package aisw.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import aisw.web.board.BoardDAO;
import aisw.web.board.BoardVO;

@Controller
public class BoardController {
    private final BoardDAO boardDAO;

    @Autowired
    public BoardController(BoardDAO boardDAO) {
        this.boardDAO = boardDAO;
    }

    @GetMapping("/index")
    public String getBoardList(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo, Model model) {
        List<BoardVO> boardList = boardDAO.search(pageNo);
        model.addAttribute("boardList", boardList);
        return "index"; // 리턴하는 값은 실제 JSP 파일명이어야 합니다.
    }
    
    @GetMapping("/index/{no}")
    public String notice(@PathVariable("no") Integer no, Model model)  {
    	
    	model.addAttribute("currentPage", no);
    	List<BoardVO> boardList = boardDAO.search(1);
        model.addAttribute("boardList", boardList);
        return "notice"; // 리턴하는 값은 실제 JSP 파일명이어야 합니다.
    }
    
}
