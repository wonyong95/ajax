package com.multi.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.multi.domain.BookVO;
import com.multi.mapper.BookMapper;

@Service("bookService")
public class BookServiceInImpl implements BookService {
	
	@Inject
	private BookMapper bMapper;
	
	@Override
	public List<BookVO> getAllBook() {
		// TODO Auto-generated method stub
		return this.bMapper.getAllBook();
	}

	@Override
	public BookVO getBookInfo(String isbn) {
		// TODO Auto-generated method stub
		return this.bMapper.getBookInfo(isbn);
	}

	@Override
	public int insertBook(BookVO book) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateBook(BookVO book) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBook(String isbn) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
