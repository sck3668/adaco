package com.icia.adaco.service.rest;

import java.security.*;

import javax.print.attribute.standard.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.multipart.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.dto.ShopDto.*;
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
	@Autowired
	private ArtistDao artistDao;
	
//	PUBLIC VOID UPDATEBYSHOP(SHOPDTO.DTOFORUPDATE UPDATEDTO, MULTIPARTFILE SAJIN, PRINCIPAL PRINCIPAL) {
//		SYSTEM.OUT.PRINTLN("UPDATEDTO=======" + UPDATEDTO );
//		SYSTEM.OUT.PRINTLN("사진 ============" + SAJIN);
//		SYSTEM.OUT.PRINTLN("======PRINF" + PRINCIPAL);
//		
//		SHOP SHOP = SHOPDAO.READBYSHOP(UPDATEDTO.GETSHOPNO());
//		IF(SHOP == NULL) 
//			THROW NEW JOBFAILEXCEPTION("개설된 상점 없어요");
//		IF(SHOP.GETARTISTNO().EQUALS(PRINCIPAL.GETNAME()) ==FALSE)
//			THROW NEW JOBFAILEXCEPTION("작가만 수정가능");
//		SHOP = MODELMAPPER.MAP(UPDATEDTO, SHOP.CLASS);
//		SHOPDAO.UPDATEBYSHOP(SHOP);
//		
//		SYSTEM.OUT.PRINTLN("==================SHOP마지막" + SHOP);
//
//	}

	public void updateByShop(String username, MultipartFile sajin, DtoForUpdate updateDto) {
		System.out.println("업데이트=======" + updateDto );
		System.out.println("업데이트 사진 ============" + sajin);
		int artistno = artistDao.findArtistnoByUsername(username);
		Shop shop = shopDao.readByShop(updateDto.getShopno());
		if( shop == null)
			 throw new JobFailException("넌 상점 없음");
		if(shop.getArtistno().equals(username)==false)
			throw new JobFailException("작가만 수정");
		shop = modelMapper.map(updateDto, Shop.class);
		shopDao.updateByShop(shop);
		
	}

}
