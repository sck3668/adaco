package com.icia.adaco.service.mvc;

import java.io.*;
import java.util.*;

import javax.validation.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.multipart.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.exception.*;
import com.icia.adaco.util.*;

@Service
public class ArtService {
	@Autowired
	private ArtDao artdao;
	@Autowired
	private OptionDao optionDao;
	@Autowired
	private ModelMapper modelMapper;
	@Value("${artfileFolder}")
	private String artfileFolder;
	@Value("${artfilePath}")
	private String artfilePath;

	
	// 작품 등록
	public void write(ArtDto.DtoForWrite dto, MultipartFile artSajin) throws IllegalStateException, IOException {
		Art art = modelMapper.map(dto, Art.class);	
		Option option = modelMapper.map(dto, Option.class);
		if(artSajin!=null && artSajin.isEmpty()==false) {
			if(artSajin.getContentType().toLowerCase().startsWith("image/")==true) {
				int lastIndexOfDot = artSajin.getOriginalFilename().lastIndexOf('.');
				String extension = artSajin.getOriginalFilename().substring(lastIndexOfDot+1);
				File artfile = new File(artfileFolder, art.getArtName()+"."+ extension);
				
				artSajin.transferTo(artfile);
				art.setMainImg(artfilePath+ artfile.getName());
				
			} else {
				throw new JobFailException("파일 확장자를 확인해주세요.");
			}
			
		} else {
			throw new JobFailException("작품 사진을 등록해주세요");
		}
		option.setArtno(art.getArtno());
		optionDao.writeByOption(option);
		artdao.writeByArt(art);
		
		
		
		
	}
	
	// 작품 리스트 (작가용)
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


