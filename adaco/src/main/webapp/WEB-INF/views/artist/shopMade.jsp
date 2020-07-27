<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	#businessno1 {width:70px;}
	#businessno2 {width:50px;}
	#businessno3 {width:100px;}
</style>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("forwarding_extraAddress").value = extraAddr;

						} else {
							document.getElementById("forwarding_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('forwarding_postcode').value = data.zonecode;
						document.getElementById("forwarding_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("forwarding_detailAddress")
								.focus();
					}
				}).open();
	}
	
	function back_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("back_extraAddress").value = extraAddr;

						} else {
							document.getElementById("back_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('back_postcode').value = data.zonecode;
						document.getElementById("back_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("back_detailAddress")
								.focus();
					}
				}).open();
	}
	    
	//성공, 실패 코드 메시지 
	function printSuccessMsg(target,msg) {
		target.text(msg).css("color","green").css("font-size","0.75em");
	}
	function printErrorMsg(target, msg) {
		target.text(msg).css("color","red").css("font-size","0.75");
	}
	
	
	
	
	    //샵 개설 시 패턴 체크 하기
	    function loadImage() {
	    	var file = $("#sajin")[0].files[0];
	    	var maxSize = 1024*1024; // 기본값을 1MB로 줌
	    	if(file.size>maxSize) {
	    		Swal.fire({
	    			icon: 'error',
	    			title: "크기 오류",
	    			text: "파이크기는 1MB를 넘을 수 없습니다."
	    		});
	    		$("#sajin").val("");
	    		return false;
	    	}
	    	// 화면에 내가 올린 사진 보여주는 코드 작성
	    	var reader = new FileReader();
	    	reader.onload = function(e) {
	    		$("#show_profile").attr("src", e.target.result);
	    	}
	    	reader.readAsDataURL(file);
	    	return true;
	    }
	    
	    //이름 체크
	    function checkshopName() {
	    	$("#shopName_msg").text("");
	    	$irum = $("#shopName").val();
	    	const patt = /^[가-힝A-Za-z0-9 _]*[가-힣A-Za-z0-9][가-힣A-Za-z0-9 _]*$/;  
// 	    	/^[가-힣A-Za-z0-9]{2,10}$/;
	    	if($irum.length==0)
	    		return printErrorMsg($("#shopName_msg"),"상점의 이름은 필수 입니다.")
	    	if(patt.test($irum)==false)
	    		return printErrorMsg($("#shopName_msg"),"이름은 최소 2글자 최대 10자로 정해주세요.")
	    	return true;
	    }
	    
	    
	    //상점 소개
	    function checkShopIntro(){
	    	$("#shopIntro_msg").text("");
	    	$intro = $("#shopIntro").val();
	    	if($intro.length==0)
	    		return printErrorMsg($("#shopIntro_msg"),"상점에 대해 안알려주실려구요???")
	    	return true;
	    }
	    
	  //사업자 번호 체크
	    function checkBusinessno(){
	    	$("#businessno_msg").text("");
			const businessno1 = $("#businessno1").val();
			const businessno2 = $("#businessno2").val();
			const businessno3 = $("#businessno3").val();
	  		const businessno = businessno1 + businessno2 + businessno3
	  		//$('<input>').attr('type','hidden').attr('name','businessno').val(businessno).appendTo($("#joinForm"));
	 		const patt = /^[0-9]{10}$/;
	 		if(businessno.lengh==0)
	 			return printErrorMsg($("#businessno_msg"),"사업자 등록번호는 필수입니다.")
	 		if(patt.test(businessno)==false)
	 			return printErrorMsg($("#businessno_msg"),"사업자 번호는 숫자 10자 입니다.")
	 		return true;
	  }
	    //우편 주소 DB에 상세내용까지 작성
	   function addStartAddress() {
	    	$("#f_msg").text("");
	    	const startAddress1 = $("#forwarding_address").val();
	    	const startAddress2	= $("#forwarding_detailAddress").val();
	    	const startAddress3 = $("#forwarding_extraAddress").val();
	    	const forwarding = startAddress1 + startAddress2 + startAddress3
	    	//$('<input>').attr('type','hidden').attr('name','forwarding').val(forwarding).appendTo($("#joinForm"));
	    	if(forwarding.length==0)
	    		return printErrorMsg($("#f_msg"),"주소는 공백으로 할 수 없어요")
	    	return true;
	    }
	    
	    function addBackAddress() {
	    	const backAddress1 = $("#back_address").val();
	    	const backAddress2 = $("#back_detailAddress").val();
	    	const backAddress3 = $("#back_extraAddress").val();
	    	const back = backAddress1 + backAddress2 + backAddress3
	    	//$('<input>').attr('type','hidden').attr('name','back').val(back).appendTo($("#joinForm"));
	    	if(back.length==0)
	    		return printErrorMsg($("#b_msg"), "주소는 공백으로 할 수 없어요")
	    	return true;
	    }
	    
	  
	  //계좌번호 체크
	  function checkAccount(){
		  $("#account_msg").text("");
		  $account = $("#account").val();
		  const patt = /^[0-9]{13,16}$/;
		  if($account.length==0)
			  return printErrorMsg($("#account_msg"),"계좌번호는 필수로 입력입니다.")
		  if(patt. test($account)==false)
			  return printErrorMsg($("#account_msg"),"계좌번호는 숫자 13~16자 이하입니다.")
		 	return true;

		  
	  }
	    
	    //체크 실행 하기
	    $(function(){
	    	$("#sajin").on("change",loadImage);
	    	$("#shopName").on("blur", checkshopName);
	    	$("#shopIntro").on("blur", checkShopIntro);
	    	$("#businessno").on("blur", checkBusinessno);
	    	$("#account").on("blur",checkAccount);
	    	$("#forwarding_detailAddress").on("blur",addStartAddress);
	    	$("#forwarding_extraAddress").on("blur",addStartAddress);
	    	$("#back_detailAddress").on("blur", addBackAddress);
	    	$("#back_extraAddress").on("blur", addBackAddress);
	    	$("#join").on("click",function() {
	    		
	    		const startAddress1 = $("#forwarding_address").val();
		    	const startAddress2	= $("#forwarding_detailAddress").val();
		    	const startAddress3 = $("#forwarding_extraAddress").val();
		    	const forwarding = startAddress1 + startAddress2 + startAddress3
		    	$('<input>').attr('type','hidden').attr('name','forwarding').val(forwarding).appendTo($("#joinForm"));
		    	
		    	const backAddress1 = $("#back_address").val();
		    	const backAddress2 = $("#back_detailAddress").val();
		    	const backAddress3 = $("#back_extraAddress").val();
		    	const back = backAddress1 + backAddress2 + backAddress3
		    	$('<input>').attr('type','hidden').attr('name','back').val(back).appendTo($("#joinForm"));
		    	console.log($("#joinForm").serialize());
		    	
		    	const businessno1 = $("#businessno1").val();
				const businessno2 = $("#businessno2").val();
				const businessno3 = $("#businessno3").val();
		  		const businessno = businessno1 + businessno2 + businessno3
		  		$('<input>').attr('type','hidden').attr('name','businessno').val(businessno).appendTo($("#joinForm"));
		    	
		    	
		    	
		    	
	    		var formData = new FormData(document.getElementById("joinForm"));
	    		console.log(formData);
	    		for(var key of formData.keys())
	    			console.log(key);
	    		for(var value of formData.values())
	    			console.log(value);
	    		var r1 = checkshopName();
	    		var r2=  checkShopIntro();
	    		var r3=  checkBusinessno();
	    		var r4=  checkAccount();
	    		var r5=  addStartAddress();
	    		var r6 = addBackAddress();
	    		var result = r1 && r2 && r3 && r4 && r5 && r6;
// 	    		console.log(result)
	    		console.log(r1)
	    		console.log(r2)
	    		console.log(r3)
	    		console.log(r4)
	    		console.log(r5)
	    		console.log(r6)
	    		console.log($("#joinForm").serialize());
	    		if(result==true) {
	    			console.log("success============");
	    			$("#joinForm").submit();
	    		}else {
	    			console.log("fail==========");
	    		}
	    		});
	    });
</script>
</head>
<body>
	<article class="container">
		<div class="page-header">
			<div class="col-md-6 col-md-offset-3">
				<h3>당신의 상점을 개설해주세요</h3>
			</div>
		</div>
		<div class="col-sm-6 col-md-offset-3">
			<form action="/adaco/artist/shopMade" method="post"  id="joinForm" enctype="multipart/form-data">
				 <img id="show_profile" height="240px">
                    <input type="hidden" name="_csrf" value="${_csrf.token }">
                   <!-- 상점 사진 -->
                    <div class="form-group">
						<label for="sajin">상점사진</label>
						<input id="sajin" type="file" name="sajin" class="form-control"  accept=".jpg,.jpeg,.png,.gif,.bmp">
					</div>
					<!-- 상점 이름 -->
					<div class="form-group">
						<label for="shopName">상점이름을 입력해주세요</label>
						 <input type="text" class="form-control" id="shopName" name="shopName"
							placeholder="당신의 상점 이름">
						<span id="shopName_msg"></span>
					</div>
					<!-- 상점 소개 -->
					<div class="form-grop">
					<label for="shopIntro">상점 소개</label> 
						<textarea rows="10" cols="41" id="shopIntro" name="shopIntro" placeholder="당신의 상점에 대해 소개해주세요"
						class="form-control"></textarea>
					<span id="shopIntro_msg"></span>
					</div>
					<!-- 사업자 번호 입력 -->
					<div class="form-group">
					<label for="businessno">사업자 번호 입력</label><br>
					<input type="text" id="businessno1" maxlength="3">&nbsp-&nbsp
					<input type="text" id="businessno2" maxlength="2">&nbsp-&nbsp
					<input type="text" id="businessno3" maxlength="5">
					<button type="button" id=businessno class="btn btn-outline-primary">확인</button>
					<span id="businessno_msg"></span>
					</div>
<!-- 					계좌번호 입력 -->
					<div class="form-group">
					<label for="account">계좌번호</label> 
					<input type="text" class="form-control" id="account" name="account"
						placeholder="('-')없이 번호만 입력해주세요)">
					<span id="account_msg"></span>
					</div>
					
					
					<div class="form-group" id="forwarding_ss">
					<input type="text" id="forwarding_postcode" placeholder="출고지" class="form-control" style="width: 40%; display: inline;" readonly="readonly"> 
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-default"><br>
					<div>
					<input type="text" id="forwarding_address" placeholder="도로명 주소"
						class="form-control" readonly="readonly"><br>
					<input type="text" id="forwarding_detailAddress" placeholder="상세주소" 
						class="form-control"><br> 
					<input type="text" id="forwarding_extraAddress" placeholder="참고항목 ex)서창동,만수동" class="form-control" ><br>
					<span id="f_msg"></span>
					</div>
				</div>
				<!-- 반품지 해야할것 -->
				<div class="form-group" id="back_ss">
					<input type="text" id="back_postcode" placeholder="반품지"
						class="form-control" style="width: 40%; display: inline;"
						readonly="readonly"> <input type="button"
						onclick="back_execDaumPostcode()" value="우편번호 찾기"
						class="btn btn-default"><br>
				<div>
					<input type="text" id="back_address" placeholder="도로명 주소" class="form-control" readonly="readonly"><br>
					<input type="text" id="back_detailAddress" placeholder="상세주소" class="form-control"><br> 
					<input type="text"id="back_extraAddress" placeholder="참고항목 ex)서창동,만수동" class="form-control"><br>
					<span id="b_msg"></span>
				</div>
				</div>
				
				<div class="form-group text-center">
					<button type="button" id="join" class="btn btn-primary">
					개설하기<i class="fa fa-check spaceLeft"></i>
					</button>
					<button type="submit" class="btn btn-warning">
					취소하기<i class="fa fa-times spaceLeft"></i>
					</button>
				</div>
			</form>
		</div>
	</article>
</body>
</html>
