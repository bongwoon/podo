package com.ch.podo.film.model.service;

import java.util.ArrayList;
import com.ch.podo.film.model.vo.Film;
import com.ch.podo.film.model.vo.Genre;

public interface FilmService {
	
	// 1. 영화 키워드 검색 서비스
	ArrayList<Film> selectKeywordFilmList(String keyword);
	
	// 2. 전체 장르 목록 불러오기 서비스
	ArrayList<Genre> selectAllGenreList();

	// 2. 영화 필터 검색 서비스
	ArrayList<Film> selectFilterFilmList(Film film);

}