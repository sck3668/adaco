package com.icia.adaco.service.mvc;
import java.io.*;

import javax.inject.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.multipart.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.exception.*;

@Service
public class ShopService {

	@Inject
	private ModelMapper modelMapper;
	@Autowired
	private ShopDao shopDao;
	@Value("d:/upload/profile")
	private String profileFolder;
	@Value("http://localhost:8081/profile/")
	private String profilePath;
	@Autowired
	private ArtistDao artistDao;
	
	public void shopMade(ShopDto.DtoForMade dtoMade, MultipartFile sajin, String username) throws IllegalStateException, IOException {
		dtoMade.setArtistno(artistDao.findArtistnoByUsername(username));
		Shop shop = modelMapper.map(dtoMade, Shop.class);
			if(sajin.getContentType().toLowerCase().startsWith("image/")) {
				int lastIndexOfDot = sajin.getOriginalFilename().lastIndexOf(".");
				String extension = sajin.getOriginalFilename().substring(lastIndexOfDot + 1);
				File shopFile = new File(profileFolder, shop.getShopName() +"." +extension);
				sajin.transferTo(shopFile);
				shop.setImage(profilePath + shopFile.getName());
			} else  {
				throw new JobFailException("사진을 등록하세요");
			}
		
		shopDao.writeByShop(shop);
	}
	
	
	
	public void delete(int shopNo) {
		shopDao.deleteByShop(shopNo);
	}
	
	
	
	
}
