package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.board.domain.BoardDTO;
import com.board.mapper.BoardMapper;

@Controller
public class IndexController {
	
    
    @Autowired
	private  BoardMapper   boardMapper;
    private  BoardDTO      boardDTO;
    
	// 새글 쓰기
	@RequestMapping("/WriteForm")
	public  ModelAndView   writeForm() {
		ModelAndView  mv  = new ModelAndView();
		mv.addObject("boardDTO", boardDTO);
		mv.setViewName("board/write");		
		return mv;
	}
	
	// 새글 등록 또는 수정
	@RequestMapping("/Write")
	public  ModelAndView  write(@ModelAttribute("boardDTO") BoardDTO newBoardDTO) {
		
       if (boardDTO == null) {
            boardDTO = newBoardDTO;
            boardMapper.boardInsert(boardDTO);
        } else {
            // 정보 수정 로직 수행
            boardDTO.setAnnouncement(newBoardDTO.getAnnouncement());
            boardDTO.setRepnumber(newBoardDTO.getRepnumber());
            boardDTO.setDayoff(newBoardDTO.getDayoff());
            boardDTO.setBreaktime(newBoardDTO.getBreaktime());
            boardMapper.boardUpdate(boardDTO);
        }
		// 저장후 이동할 페이지
		ModelAndView  mv = new ModelAndView();
		mv.setViewName("redirect:/Write" );
		return mv;
		
	}
    
    
	// 단체 예약 리스트
	@RequestMapping("/List")
	public  ModelAndView  list() {
		List<BoardDTO>  boardList = boardMapper.getBoard();		
		System.out.println(boardList);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("brdList", boardList);
		mv.setViewName("board/list");
		return mv;
	}
	
	// 상세보기
	@RequestMapping("/View")
	public  ModelAndView   view(BoardDTO vo) {
		vo.setCompanyname("test_company");
		BoardDTO boardDto =  boardMapper.viewBoard( vo ); 
		System.out.println( boardDto );
		
		ModelAndView  mv  =  new ModelAndView();
		mv.addObject("vo", boardDto);
		mv.setViewName("/board/view");
		return mv;
	}
	
	// 새글 쓰기
	@RequestMapping("/Order")
	public  ModelAndView   order() {
		ModelAndView  mv  = new ModelAndView();
		mv.setViewName("order/order");		
		return mv;
	}



}