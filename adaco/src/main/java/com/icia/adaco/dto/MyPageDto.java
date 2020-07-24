package com.icia.adaco.dto;

import java.util.*;

import com.icia.adaco.entity.*;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain=true)
@Builder
	public class MyPageDto {
		private List<Favorite> favorite;
		private List<Review> review;
		private int point;
	}
