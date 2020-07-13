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

  <title>작가 관리</title>

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

<script type="text/javascript">
$(function(){
	$("#search").on("click", function(){
		var username = $("#username").val();
		location.href = "/adaco/admin/user_list?username="+username;	
	});
	$("#category").on("change", function(){
		var $category = $("#category").val();
		if($category == "유저")
			location.href = "/adaco/admin/user_list"
		if($category == "아티스트")
			location.href = "/adaco/admin/artist_list"
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
          <p class="mb-4">전체 회원/작가 회원을 구분지어 관리 할 수 있습니다.</p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">작가 관리</h6>
            </div>
				<div style=" width:130px; display: inline-block; margin-left: 20px; margin-top: 20px;">
					<select id = "category" class="custom-select">
							<option value="선택">선택</option>
							<option value="유저">모든 유저</option>
							<option value="아티스트">작가</option>
					</select>
				</div>
				<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
		            <div class="input-group" style="margin-top: 10px;">
		              <input type="text" class="form-control bg-light border-0 small" placeholder="유저 및 작가 아이디.." aria-label="Search" aria-describedby="basic-addon2" name = "username" id ="username">
		              <div class="input-group-append">
		                <button class="btn btn-primary" type="button" id = "search">
		                  <i class="fas fa-search fa-sm"></i>
		                </button>
		              </div>
		            </div>
		          </form>
            <div class="card-body">
              <div class="table-responsive">
              <div class= "col-sm-12 col-md-6">
              </div>
                <table class="table table-bordered" id="question_list" width="100%" cellspacing="0">
                <colgroup>
					<col width="10%">
					<col width="20%">
					<col width="10%">
					<col width="40%">
					<col width="20%">
				</colgroup>
			<thead>
			<tr style="text-align: center;">
				<th>작가번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>가입일</th>
			</tr>
		</thead>
		<tbody id = "list">
		<c:forEach items = "${artistPage.adminArtist}" var = "artist">
			<tr style="text-align: center;">
				<td>${artist.artistno}</td>
				<td><a href="/adaco/admin/user_read?username=${artist.username}">${artist.username}</a></td>
				<td>${artist.irum }</td>
				<td>${artist.email}</td>
				<td>${artist.joinDateStr}</td>
			</tr>	
		</c:forEach>
		</tbody>
       </table>
		<ul class="pagination" style="text-align: center; margin: 0 auto; width: 0px; text-align: center;">
			<c:if test="${artistPage.prev==true}">
				<li class="page-item" style="width: 60px;"><a style = "width: 60px;" class = "page-link" href="/adaco/admin/artist_list?pageno=${artistPage.startPage-1}">이전</a></li>
			</c:if>
			<c:forEach begin="${artistPage.startPage}" end="${artistPage.endPage}" var="i">
				<c:choose>
					<c:when test="${artistPage.pageno eq i }">
						<li class="page-item active">
							<a class = "page-link" href="/adaco/admin/artist_list?pageno=${i}">${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class = "page-item"><a class = "page-link" href="/adaco/admin/artist_list?username=&pageno=${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
				
			</c:forEach>
			<c:if test="${artistPage.next==true}">
				<li class = "page-item" style="width: 60px;"><a style = "width: 60px;" class = "page-link" href="/adaco/admin/artist_list?username=${artistPage.endPage+1}">다음</a></li>
			</c:if>
		</ul>
	  </div>
   </div>
  </div>
  
 </div>
      <!-- /.container-fluid -->
</div>
      <!-- End of Main Content -->
    
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