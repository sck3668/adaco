package com.icia.adaco.service.mvc;

import java.util.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.util.*;

@Service
public class ArtService {
	@Autowired
	private ArtDao artdao;
	@Autowired
	private ModelMapper modelMapper;
	
	// 작품 등록
	
	public int write(ArtDto.DtoForWrite dto) {
		Art art = modelMapper.map(dto, Art.class);
		
		artdao.writeByArt(art);
		
		return art.getArtno();
	}
	
	// 작품 리스트
	public Page list(int pageno) {
		int countOfArt = artdao.countByArt();
		Page page = PagingUtil.getPage(pageno, countOfArt);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		List<Art> artList = artdao.listByArt(srn, ern);
		List<ArtDto.DtoForList> dtoList = new ArrayList<ArtDto.DtoForList>();
		for(Art art:artList) {
			ArtDto.DtoForList dto = modelMapper.map(art,ArtDto.DtoForList.class);
			dtoList.add(dto);
		}
		page.setArtList(dtoList);
		return page;
		
	}
	
	
}


