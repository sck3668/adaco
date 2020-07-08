package com.icia.adaco.service.rest;

import java.security.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.multipart.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.exception.*;

@Service
public class ShopRestService {
	@Autowired
	private ShopDao shopDao;
	@Autowired
	private ModelMapper modelMapper;
	@Value("d:/upload/profile")
	private String profileFolder;
	@Value("http://localhost:8081/profile/")
	private String profilePath;
	
	public void updateByShop(ShopDto.DtoForUpdate updateDto, MultipartFile sajin, Principal principal) {
		System.out.println("updateDto=======" + updateDto );
		System.out.println("사진 ============" + sajin);
		System.out.println("======prinf" + principal);
		
		Shop shop = shopDao.readByShop(updateDto.getShopno());
		if(shop == null) 
			throw new JobFailException("개설된 상점 없어요");
		if(shop.getArtistno().equals(principal.getName()) ==false)
			throw new JobFailException("작가만 수정가능");
		shop = modelMapper.map(updateDto, Shop.class);
		shopDao.updateByShop(shop);
		
		System.out.println("==================shop마지막" + shop);

	}

}
