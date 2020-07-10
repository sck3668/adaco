package com.icia.adaco.service.rest;

import java.io.*;

import javax.validation.constraints.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.multipart.*;

import com.icia.adaco.dao.*;
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
	

	public void updateByShop(String username, MultipartFile sajin, DtoForUpdate updateDto) throws IllegalStateException, IOException {
//		System.out.println("업데이트=======" + updateDto );
//		System.out.println("업데이트 사진 ============" + sajin);
		int artistno = artistDao.findArtistnoByUsername(username);
		Shop shop = shopDao.readByShop(updateDto.getShopno());
		shop = modelMapper.map(updateDto, Shop.class);
		System.out.println(modelMapper.map(updateDto, Shop.class)+"이게 위에꺼");
		shop.setArtistno(artistno);
		System.out.println(shop.getArtistno()+"ggggggssqwe");
//		if(shop == null)
//			 throw new JobFailException("넌 상점 없음");
		if(shop.getArtistno()!=artistno) 
			throw new JobFailException("작가만 수정");
		
		/*ffff
		 * System.out.println(artistno+"ggggggggggqweqw");
		 * System.out.println(shop.getArtistno()+"ggggggssqwe");
		 */
		shopDao.updateByShop(shop);
		System.out.println(shopDao.updateByShop(shop)+"ggggg");
		
	}
	public void update(String username, MultipartFile sajin,DtoForUpdate updateDto) throws IllegalStateException, IOException {
	Shop findShop = shopDao.readByShop(updateDto.getShopno());
	Shop shop = modelMapper.map(updateDto, Shop.class);
		if(sajin!=null && !sajin.isEmpty()) {
			if(sajin.getContentType().toLowerCase().startsWith("image/")==true) {
				int lastIndexOfDot =  sajin.getOriginalFilename().lastIndexOf('.');
				String extension = sajin.getOriginalFilename().substring(lastIndexOfDot+1);
				File file = new File(profileFolder, findShop.getShopName() + "." + extension);
				sajin.transferTo(file);
				shop.setImage(profilePath + file.getName());
			}
		}
		shopDao.updateByShop(shop);
	}
}