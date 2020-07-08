<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	
	 function addStartAddress() {
	    	$("#f_msg").text("");
//	    	const startAddress1 = $("#forwarding_address").val();
//	    	const startAddress2	= $("#forwarding_detailAddress").val();
//	    	const startAddress3 = $("#forwarding_extraAddress").val();
//	    	const forwarding = startAddress1 + startAddress2 + startAddress3
	    	//$('<input>').attr('type','hidden').attr('name','forwarding').val(forwarding).appendTo($("#joinForm"));
	    	if(forwarding.length==0)
	    		return printErrorMsg($("#f_msg"),"주소는 공백으로 할 수 없어요")
	    	return true;
	    }
	    
	    function addBackAddress() {
	    	//$('<input>').attr('type','hidden').attr('name','back').val(back).appendTo($("#joinForm"));
	    	if(back.length==0)
	    		return printErrorMsg($("#b_msg"), "주소는 공백으로 할 수 없어요")
	    	return true;
	    }
	
	    $(function(){
	    	$("#forwarding_detailAddress").on("blur",addStartAddress);
	    	$("#forwarding_extraAddress").on("blur",addStartAddress);
	    	$("#back_detailAddress").on("blur", addBackAddress);
	    	$("#back_extraAddress").on("blur", addBackAddress);
	  
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
	    });
	</script>
</head>
</head>
<body>
<form> 
<div>
<h4>상점수정하기</h4>
	<section id="section">
		<div>
			<img id ="show_profile" height="200px;"src="${shop.image }">
		</div>
		<div>
			<input type="file" name="image" id="image">
		</div>
		<table class="table table-hover" id="user">
			<tr>
				<td class="first">이름:</td>
				<td><input id="shopName" name="shopName" value="${shop.shopName }" type="text" ></td>
				
			</tr>	
			<tr>
				<td class="first1">소개:</td>
				<td><input id="shopIntro" name="shopIntro" value="${shop.shopIntro }" type="text"></td>
			</tr>
			<tr>
				<td class="first1">사업자번호:</td>
				<td><span id="birthDate">${shop.businessno }</span></td>
			</tr>
			<tr>
				<td class="first1">계좌번호:</td>
				<td><input id="account" name="account" value="${shop.account }" type="text"></td>
			</tr>

			
		</table>	
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
				
		<button type="button" class="btn btn-info" id="update">변경하자</button>
	</section>
	</div>
</form>
</body>
</html>