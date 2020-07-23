package com.icia.adaco.service.rest;

import java.io.*;
import java.time.*;
import java.time.format.*;
import java.util.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.lang.*;
import org.springframework.stereotype.*;
import org.springframework.web.multipart.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.dto.ArtDto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.exception.*;
import com.icia.adaco.util.*;

import lombok.NonNull;

@Service
public class ArtRestService {
	@Autowired
	private ArtDao artDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private ModelMapper modelMapper;
	@Autowired
	private ArtistDao artistDao;
	@Autowired
	private OptionDao optionDao;
	@Autowired
	private ReviewDao reviewDao;
	@Autowired
	private ArtCommentDao artCommemtDao;
	@Autowired
	private ArtCommentDao artCommentDao;
	@Value("d:/upload/artfile")
	private String artfileFolder;
	@Value("http://localhost:8081/artfile/")
	private String artfilePath;

	// 작품 업데이트
	public void updateArt(ArtDto.DtoForUpdate dto, MultipartFile artSajin) throws IllegalStateException, IOException {
		Art art = artDao.readByArt(dto.getArtno());
		dto.setArtistNo(art.getArtistno());
		Option option = optionDao.readByOption(dto.getOptno());
		Artist artist = artistDao.findByid(dto.getArtistNo());
		if(art==null)
			throw new ArtNotFoundException();
		if(artist.getUsername().equals(dto.getUsername())==false)
			throw new JobFailException("상품 수정 권한이 없습니다");
		art = modelMapper.map(dto, Art.class);
		option = modelMapper.map(dto,Option.class);
		if(artSajin!=null && !artSajin.isEmpty()) {
			if (artSajin.getContentType().toLowerCase().startsWith("image/") == true) {
				int lastIndexOfDot = artSajin.getOriginalFilename().lastIndexOf('.');
				String extension = artSajin.getOriginalFilename().substring(lastIndexOfDot + 1);
				File artfile = new File(artfileFolder, art.getArtName() + "." + extension);
				artSajin.transferTo(artfile);
				art.setMainImg(artfilePath + artfile.getName());
			} else {
				throw new JobFailException("파일 확장자를 확인해주세요");
			}
		} else {
			throw new JobFailException("등록된 사진이 없습니다");
		}
		option.setArtno(art.getArtno());
		ArtImg artImg = ArtImg.builder().artno(art.getArtno()).gyungro(art.getMainImg()).build();
		//작품 사진 변경하기
		artDao.updateArtImg(artImg);
		optionDao.updateByOption(option);
		artDao.updateByArt(art);
	}

	// 작품 상세보기 옵션 포함(작가용)
	public ArtDto.DtoForRead readArt(Integer artno, String username) {
		Art art = artDao.readByArt(artno);
		Option option = optionDao.readByArtno(artno);
		if(art==null)
			throw new ArtNotFoundException();
		ArtDto.DtoForRead dto = modelMapper.map(art, ArtDto.DtoForRead.class);
		if(option!=null)
			option.setArtno(art.getArtno());
			dto.setOptno(option.getOptno());
			dto.setOptionName(option.getOptionName());
			dto.setOptionValue(option.getOptionValue());
			dto.setOptionStock(option.getOptionStock());
			dto.setOptionPrice(option.getOptionPrice());
		String str = art.getArtDate().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일"));
		dto.setArtDate(str);
		return dto;
	}
	
	// 작품 상세보기 옵션 포함(회원용)
	public ArtDto.DtoForRead readArtFromUser(Integer artno, @Nullable String username) {
		Art art = artDao.readByArtFromUser(artno);
		Option option = optionDao.readByArtno(artno);
		if (art == null)
			throw new ArtNotFoundException();
		ArtDto.DtoForRead dto = modelMapper.map(art, ArtDto.DtoForRead.class);

		if (option != null) {
			option.setArtno(art.getArtno());
			dto.setOptno(option.getOptno());	
			dto.setOptionName(option.getOptionName());
			dto.setOptionValue(option.getOptionValue());
			dto.setOptionStock(option.getOptionStock())	;
			dto.setOptionPrice(option.getOptionPrice());
		}
		if (username != null) {
			Boolean isFavorite = userDao.existsByFavorite(artno, username);
			dto.setIsFavorite(isFavorite);
			artDao.updateByArt(Art.builder().artno(artno).readCnt(1).build());
		}
		if (art.getArtCommentCnt() > 0 ) {
			List<ArtComment> commentList = artCommemtDao.listByCommentOfArt(artno);
			List<ArtCommentDto.DtoForList> dtoList = new ArrayList<ArtCommentDto.DtoForList>();
			for (ArtComment artcomment : commentList) {
				ArtCommentDto.DtoForList artDto = modelMapper.map(artcomment, ArtCommentDto.DtoForList.class);
				artDto.setWriteDateStr(artcomment.getWriteDate().format(DateTimeFormatter.ofPattern("yyyy년MM월dd일")));
				artDto.setCno(artcomment.getCno());
				dtoList.add(artDto);
			}
			dto.setArtComments(dtoList);
			
		}
		if (art.getReviewCnt() > 0) {
			System.out.println("getReviewCnt아트"+art);
			List<Review> reviewList = reviewDao.findAllReview(artno);
			List<ReviewDto.DtoForList> dtoList = new ArrayList<ReviewDto.DtoForList>();
			for (Review review : reviewList) {
				ReviewDto.DtoForList reviewDto = modelMapper.map(review, ReviewDto.DtoForList.class);
				reviewDto.setWriteDateStr(review.getWriteDate().format(DateTimeFormatter.ofPattern("yyyy년MM월dd일")));
				reviewDto.setRno(review.getRno());
				dtoList.add(reviewDto);
			}
			dto.setReviews(dtoList);
		}
		return dto;
	}
	
	// 작품 이미지 불러오기
	public List<ArtImg> readArtImage(@NonNull int artno) {
		return artDao.findAllArtImg(artno);
	}
		
	// 작품 이미지 찾기
	public String findArtfile(Integer artno) {
		Art art = artDao.readByArt(artno);
		return art.getArtImg();
	}

	// 작품 삭제
	public boolean deleteArt(Integer artno, String username) {
		Art art = artDao.readByArt(artno);
		int optno = optionDao.readByArtno(artno).getOptno();
		Option option = optionDao.readByOption(optno);
		Integer artistno = artistDao.findArtistnoByUsername(username);
		String artWriter = artistDao.findByid(artistno).getUsername();
		if(art==null)
			throw new ArtNotFoundException();
		if(username.equals(artWriter)==false)
			throw new IllegalJobException();
		option.setArtno(art.getArtno());
		optionDao.deleteByOption(optno);
		return artDao.deleteByArt(artno)==1;
	}
	
	
	//작품찾기-----
	public int findArt(List<ArtDto.DtoForList> artList, int artno) {
		for(int i=0; i<artList.size(); i++) {
			if(artList.get(i).getArtno()==artno)
				return i;
		}
		return -1;
	}
	
	// 회원아이디로 작품목록 불러오기-------
	public List<ArtDto.DtoForList> findAllArtByUsername(String username,int pageno, @Nullable String category,@Nullable int artistno) {
		ArtDto.DtoForList dto1 = new ArtDto.DtoForList();
		int countOfArt = artDao.countByArt();
		Page page = PagingUtil.getPage(pageno, countOfArt);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		List<Art> artList = artDao.listByArt(srn, ern, category,artistno);
		List<ArtDto.DtoForList> dtoList = new ArrayList<>();
		for(Art art1:artList) {
			ArtDto.DtoForList dto = modelMapper.map(art1,ArtDto.DtoForList.class);
			dtoList.add(dto);
		}
		return dtoList;
	}
	
	// 작품 삭제------
	public List<DtoForList> deleteArt(List<Integer> list, int pageno,String username, @Nullable String category) {
		Integer artistno = artistDao.findArtistnoByUsername(username);
		String artWriter = artistDao.findByid(artistno).getUsername();
		if(username.equals(artWriter)==false)
			throw new IllegalJobException();
		List<DtoForList> artList = findAllArtByUsername(username,pageno,category,artistno);
		List<Integer> deleteList = new ArrayList<Integer>();
		for(int i=0; i<list.size(); i++) {
			int idx = findArt(artList,list.get(i));
			deleteList.add(idx);
		}
		for(int i = deleteList.size()-1; i>=0; i--) {
			int idx = deleteList.get(i);
			artList.remove(idx);
			artDao.deleteByArt(list.get(i));
		}
		return artList;
		
	}

	// 작품 리뷰 작성하기
	public List<ArtDto.DtoForReviewList> writeReviewOfArt(Review review,MultipartFile sajin,Integer artno,String username) throws IllegalStateException, IOException {
		review.setWriteDate(LocalDateTime.now());
		String reviewStr = review.getContent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		review.setContent(reviewStr);
		review.setStar(star.onePoint).setUsername(username).setArtno(artno);
		  if(sajin!=null && sajin.isEmpty()==false) {
		  if(sajin.getContentType().toLowerCase().startsWith("image/")==true) { 
	  int lastindexOfDot = sajin.getOriginalFilename().lastIndexOf('.');
	  String extension = sajin.getOriginalFilename().substring(lastindexOfDot+1); 
	  File artfile = new File(artfileFolder,review.getUsername()+"."+extension);
	  sajin.transferTo(artfile);
	  review.setImage(artfilePath+artfile.getName());
	  			  }
		  } 		
			 reviewDao.writeByReviewOfArt(review);  
		List<Review> reviewList = reviewDao.findAllReview(artno);
		artDao.updateByArt(Art.builder().artno(review.getArtno()).reviewCnt(1).build());
		List<ArtDto.DtoForReviewList> dtoList = new ArrayList<ArtDto.DtoForReviewList>();
		for(Review review1:reviewList) {
			ArtDto.DtoForReviewList dto = modelMapper.map(review1,ArtDto.DtoForReviewList.class);
			dto.setWriteDateStr(review1.getWriteDate().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일")));
			dto.setRno(review1.getRno());
			dtoList.add(dto);
			System.out.println("dto11=="+dto);
		}
		return dtoList;
	};

//리뷰 삭제하기
	public List<ArtDto.DtoForReviewList> deleteReviewOfArt(Integer rno, Integer artno, String username) {
		Review review = reviewDao.readByReviewOfArt(rno);
		if(username.equals(review.getUsername())==false)
			throw new JobFailException("리뷰를 삭제할 수 없습니다");
		reviewDao.deleteByReviewOfArt(rno);
		List<Review> reviewList = reviewDao.findAllReview(artno);
		List<ArtDto.DtoForReviewList> dtoList = new ArrayList<ArtDto.DtoForReviewList>();
		for(Review review1:reviewList) {
			ArtDto.DtoForReviewList dto = modelMapper.map(review1,ArtDto.DtoForReviewList.class);
			dto.setWriteDateStr(review1.getWriteDate().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일")));
			dto.setRno(review1.getRno());
			dtoList.add(dto);
		}
		return dtoList;
		
	}
					
	// 작품 댓글 작성하기
	public List<ArtCommentDto.DtoForList> writeCommentOfArt(ArtComment artcomment) {
		artcomment.setWriteDate(LocalDateTime.now());
		String commentStr = artcomment.getContent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		artcomment.setContent(commentStr);
		 artCommemtDao.writeByCommentOfArt(artcomment);  
		artDao.updateByArt(Art.builder().artno(artcomment.getArtno()).artCommentCnt(1).build());
		List<ArtComment> commentList = artCommentDao.listByCommentOfArt(artcomment.getArtno());
		List<ArtCommentDto.DtoForList> dtoList = new ArrayList<ArtCommentDto.DtoForList>();
		for(ArtComment artComments:commentList) {
			ArtCommentDto.DtoForList dto = modelMapper.map(artComments,ArtCommentDto.DtoForList.class);
			dto.setWriteDateStr(artcomment.getWriteDate().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일")));
			dto.setCno(artcomment.getCno());
			dtoList.add(dto);
		}
		return dtoList;
	}

	// 작품 댓글 삭제하기
	public List<ArtCommentDto.DtoForList> deleteCommentOfArt(Integer cno, Integer artno, String username) {
		ArtComment artcomment = artCommemtDao.readByCommentOfArt(cno);
		if (username.equals(artcomment.getUsername()) == false)
			throw new JobFailException("댓글을 삭제할 수 없습니다");
		artCommemtDao.deleteByCommentOfArt(cno);
		System.out.println(cno + "씨엔오");
		List<ArtComment> commentList = artCommentDao.listByCommentOfArt(artno);
		List<ArtCommentDto.DtoForList> dtoList = new ArrayList<ArtCommentDto.DtoForList>();
		for(ArtComment artComment:commentList) {
			ArtCommentDto.DtoForList dto = modelMapper.map(artComment,ArtCommentDto.DtoForList.class);
			dto.setWriteDateStr(artComment.getWriteDate().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일")));
			dto.setCno(artComment.getCno());
			dtoList.add(dto);
		}
		return dtoList;
	}
}
