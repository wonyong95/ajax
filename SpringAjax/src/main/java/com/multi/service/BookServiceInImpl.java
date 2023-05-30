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
		
		return this.bMapper.getAllBook();
	}

	@Override
	public BookVO getBookInfo(String isbn) {
		
		return this.bMapper.getBookInfo(isbn);
	}

	@Override
	public int insertBook(BookVO book) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateBook(BookVO vo) {
		
		return bMapper.updateBook(vo);
	}

	@Override
	public int deleteBook(String isbn) {
		return bMapper.deleteBook(isbn);
	}

	@Override
	public List<BookVO> getPublishList() {
		return bMapper.getPublishList();
	}

	@Override
	public List<BookVO> getTitleList(String publish) {
		return bMapper.getTitleList(publish);
	}

	@Override
	public List<BookVO> getFindBook(String title) {
		return bMapper.getFindBook(title);
	}

	@Override
	public List<String> getAutoComplete(String keyword) {
		return bMapper.getAutoComplete(keyword);
	}
	
}
