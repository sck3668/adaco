package com.icia.adaco.service.mvc;

import java.time.format.*;
import java.util.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.util.*;

@Service
public class AdminBoardService {
	@Autowired
	AdminBoardDao dao;
	@Autowired
	ModelMapper modelMapper;

	public Page list(int pageno) {
		int countOfBoard = dao.countByReport();
		Page page = PagingUtil.getPage(pageno, countOfBoard);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		List<ArtComment> reportList = dao.findAllByReport(srn, ern);
		List<AdminBoardDto.DtoForList> dtoList = new ArrayList<AdminBoardDto.DtoForList>();
		for(ArtComment comment:reportList) {
			AdminBoardDto.DtoForList dto = modelMapper.map(comment, AdminBoardDto.DtoForList.class);
			dto.setWriteDateStr(comment.getWriteDate().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일")));
			dtoList.add(dto);
		}
		page.setAdminReportList(dtoList);
		return page;
	}

}
