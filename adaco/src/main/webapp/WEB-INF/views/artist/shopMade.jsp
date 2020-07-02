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
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
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
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
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
			<form action="memberjoinpro.do" method="post" role="form"
				id="usercheck" name="member">
				<div class="form-group">
				<div class="form-group">
					<label for="mem_name">상점이름을 입력해주세요</label> <input type="text"
						class="form-control" id="mem_name" name="mem_name"
						placeholder="당신의 상점 이름">
					<div class="eheck_font" id="name_check"></div>
				</div>
					<label for="id">상점을소개해주세요</label> <input type="text" class="form-control"
						id="mem_id" name="상점을 간단히 소개해주세요" placeholder="ID">
					<div class="eheck_font" id="id_check"></div>
				</div>
				<div class="form-group">
					<label for="pw">사업자 번호 입력</label> <input type="password"
						class="form-control" id="mem_pw" name="mem_pw"
						placeholder="사업자 번호">
					<div class="eheck_font" id="pw_check"></div>
				</div>
				<div class="form-group">
					<label for="mem_name">계좌번호</label> <input type="text"
						class="form-control" id="mem_name" name="mem_name"
						placeholder="('-'없이 번호만 입력해주세요)">
					<div class="eheck_font" id="name_check"></div>
				</div>
				
<div>
<input type="text" id="sample6_postcode" placeholder="출고지 우편번호" class="form-control" style="width: 40%; display: inline;">
</div>
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" id="sample6_address" placeholder="도로명 주소"><br>
<input type="text" id="sample6_detailAddress" placeholder="상세주소">
<input type="text" id="sample6_extraAddress" placeholder="참고항목 ex)서창동,만수동">
				
				

				
				
				<div class="form-group">
					<!--출고지<br> --><input class="form-control" style="width: 40%; display: inline;"
						placeholder="출고지" name="mem_oaddress" id="mem_oaddress"
						type="text" readonly="readonly">
					<button type="button" class="btn btn-default"
						onclick="execPostCode();">
						<i class="fa fa-search"></i> 우편번호 찾기
					</button>
				</div>
				
				
				
				
				
				
				<div class="form-group">
					<input class="form-control" style="top: 5px;" placeholder="도로명 주소"
						name="mem_address" id="mem_address" type="text"
						readonly="readonly" />
				</div>
				<div class="form-group">
					<input class="form-control" placeholder="상세주소"
						name="mem_detailaddress" id="mem_detailaddress" type="text" />
				</div>
				
				
				
				
				
				
				
				
				<div class="form-group text-center">
					<button type="submit" class="btn btn-primary">개설하기</button>
					<button type="submit" class="btn btn-primary" href="/adaco/artist/artistPage">취소하기</button>
				</div>
			</form>
		</div>
	</article>
</body>
</html>
