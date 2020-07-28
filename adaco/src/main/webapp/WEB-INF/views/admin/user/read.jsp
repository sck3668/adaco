<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>공지사항</title>

  <!-- Custom fonts for this template-->
  <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="../css/sb-admin-2.min.css" rel="stylesheet">
  
   <!-- Custom styles for this page -->
  <link href="../vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
  
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<meta charset="UTF-8">
<title>회원 상세</title>
<script type="text/javascript">
function checkEnabled() {
	var enabled = ${user.enabled}
	if(enabled == true) 
		$("#block").attr("class", "btn btn-danger").text("계정 블락");
	else 
		$("#block").attr("class", "btn btn-primary").text("계정 활성화");
	
}
	$(function(){
		checkEnabled();
		$("#update").on("click", function(){
			var params = {
				_method : "put",
				username : $("#username").text(),
				authority: $("#authority").val(),
				enabled: $("#enabled").val(),
				_csrf: "${_csrf.token}"
			}
			if($("#category").val() != "선택") {
				$.ajax({
					url: "/adaco/admin/user_update",
					method: "post",
					data: params
				}).done(()=>alert("정보가 갱신되었습니다.")).fail((f)=>alert("정보를 변경하지 못하였습니다. 사유:" +f));
			}
		});
		
		$("#block").on("click", function(){
			if($("#enabled").val()=="false") 
				$("#enabled").val(true);
			else
				$("#enabled").val(false)
			
			var params = {
					_method : "put",
					username : $("#username").text(),
					enabled: $("#enabled").val(),
					_csrf: "${_csrf.token}"
				}
			 
				$.ajax({
					url: "/adaco/admin/user_update",
					method: "post",
					data: params
				}).done(()=>{
				   alert("정보가 갱신되었습니다.");
				   location.reload(true);
				}).fail((f)=>alert("정보를 변경하지 못하였습니다. 사유:" +f));
		});
		
		$("#logout").on("click", function(){
  			var param = {
  				_csrf : "${_csrf.token}"						
  			}
  			$.ajax({
  				url: "/adaco/user/logout",
  				method: "post",
  				data: param,
  				success: function(){
  					location.href = "/adaco";
  				}
  			});
  		});
		
	});
</script>
</head>
<body>
<!-- Page Wrapper -->
  <div id="wrapper">
  
	<jsp:include page="../../include/admin_sidebar.jsp" />
    
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

    <!-- Main Content -->
    <div id="content">
    
    <jsp:include page="../../include/admin_topbar.jsp" />	

              
        <!-- Begin Page Content -->
        <div class="container-fluid">
       	
       	<!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">유저 관리</h1>
          <p class="mb-4">권한을 수정하거나 블록 처리 할 수 있습니다.</p>
       	
       	    
       
        <div>
		<img id="show_profile" height="200px;" src="${user.profile }">
		</div>
		<table class="table table-hover" id="user">
		<tr>
			<td class="first">이름</td>
			<td><span id = "irum">${user.irum }</span>&nbsp;
			<td><img width="120px" id="profile"></td>
		</tr>
		<tr>
			<td class="first">아이디</td>
			<td colspan="2"><span id="username">${user.username }</span></td>
		</tr>
		<tr>
			<td class="first">생년월일</td>
			<td colspan="2"><span id="birthDate">${user.birthDateStr }</span></td>
		</tr>
		<tr>
			<td class="first">가입일</td>
			<td colspan="2"><span id="joinDate">${user.joinDateStr }</span></td>
		</tr>
		<tr>
			<td class="first">가입기간</td>
			<td colspan="2"><span id="days">${user.days }</span>일</td>
		</tr>
		<tr>
			<td class="first">이메일</td>
			<td colspan="2">
			<span id = "email">${user.email }</span>
			</td>
		</tr>
		<tr>
			<td class="first">연락처</td>
			<td colspan="2"><span id = "tel">${user.tel }</span></td>
		</tr>
	</table>
	<input type="hidden" id = "enabled" value="${user.enabled }">
	<div style=" width:130px; display: inline-block; margin-left: 5px; margin-top: 20px;">
		<select id = "authority" class = "custom-select">
			<c:forEach items="${authorityType}" var="at">
				<c:choose>
					<c:when test="${at == user.authority }">
						<option value = "${at}" selected="selected">${user.authority}</option> .
					</c:when>
					<c:otherwise>
						<option value = "${at }">${at}</option>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</select>
	</div>
	<button type="button" class="btn btn-success" id="update">변경하기</button>
	<button type="button" class="btn btn-danger" id = "block">회원 블락</button>
	<a href = "/adaco/message/write?recipientId=${user.username }" class = "btn btn-warning">쪽지 발송</a> 
    
        
    	</div>
    </div>
      
 	  <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; HandStory </span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
    
  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">로그아웃 하시면 관리자 계정에서 로그아웃 처리 된 후 <br>메인 페이지로 이동합니다. 로그아웃 하시겠습니까?</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
          <a class="btn btn-primary" href="#" id = "logout">로그아웃</a>
        </div>
      </div>
    </div>
  </div>
  
  <!-- Bootstrap core JavaScript-->
  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="../js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="../vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="../vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="../js/demo/datatables-demo.js"></script>
    
</body>
</html>