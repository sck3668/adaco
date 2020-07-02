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

@Service
public class ShopService {

	@Inject
	private ModelMapper modelMapper;
	@Autowired
	private ShopDao shopDao;
	@Value("${profileFolder}")
	private String profileFolder;
	@Value("${profilePath}")
	private String profilePath;
	
	
	public void shopMade(Shop shop) {
		shopDao.writeByShop(shop);
	}
	
	
//	public int shopMade(ShopDto.DtoForMade dtoMade, MultipartFile sajin) throws IllegalStateException, IOException {
//		Shop shop = modelMapper.map(dtoMade, Shop.class);
//		if (sajin != null && sajin.isEmpty() == false) {
//			if(sajin.getContentType().toLowerCase().startsWith("image/")) {
//				int lastIndexOfDot = sajin.getOriginalFilename().lastIndexOf(".");
//				String extension = sajin.getOriginalFilename().substring(lastIndexOfDot + 1);
//				File shopFile = new File(profileFolder, shop.getShopName() +"." +extension);
//				sajin.transferTo(shopFile);
//				shop.setImage(profilePath + shopFile.getName());
//			}
//		}
//		shopDao.writeByShop(shop);
//		return shop.getShopno();
//	}
	
//	public Shop readByShop(int shopno) {
//		return shopDao.readByShop(shopno);
//	}
//	
//	public int updateByShop(Shop shop) {
//		return shopDao.updateByShop(shop);
//	}
//	
//	public int deleteByArt(int shopno) {
//		return shopDao.deleteByArt(shopno);
//	}
//	
}
