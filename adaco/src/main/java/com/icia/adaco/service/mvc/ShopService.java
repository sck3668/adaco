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
	@Autowired
	private ArtDao artDao;
	
	public void shopMade(ShopDto.DtoForMade dtoMade, MultipartFile sajin, String username) throws IllegalStateException, IOException {
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
			int artistno = artistDao.findArtistnoByUsername(username);
			shop.setArtistno(artistno);
			shopDao.writeByShop(shop);
	}
	 
	public ShopDto.DtoForRead shopRead(int shopno){
		Shop shop = shopDao.readByShop(shopno);
		System.out.println("shop=="+shop);
		ShopDto.DtoForRead shopReadDto = modelMapper.map(shop,ShopDto.DtoForRead.class);
		shopReadDto.setImg(artDao.findAllArtImgByShopno(shopno));
		shopReadDto.setArtno(artDao.findAllArtnoByShopno(shopno));
		return shopReadDto;
		}
	 
	public void delete(int shopNo) {
		shopDao.deleteByShop(shopNo);
	}
 
	public int shopCheck(String username) {
		int artistno = artistDao.findArtistnoByUsername(username);
		if(shopDao.readShopnoByArtistno(artistno)==null) {
			return 0;
		}
		return 1;
	}
}
