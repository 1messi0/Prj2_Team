package com.board.mapper;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.board.domain.BoardDTO;


@Repository("BoardMapper")
public interface BoardMapper {

	List<BoardDTO> getBoard();

	BoardDTO viewBoard(BoardDTO vo);

	void boardInsert(BoardDTO boardDTO);
	void boardUpdate(BoardDTO boardDTO);

}
