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

  <title>카테고리 관리</title>

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
	$("#delete").on("click", function(){
		var param = {
			_method: "delete",
			_csrf : "${_csrf.token}",
			category : $("#category").val()		
		}
		$.ajax({
			url: "/adaco/admin/category_delete",
			method: "post",
			data: param
		}).done(()=>{
			alert("삭제처리 되었습니다.");
			location.reload(true);
			}).fail(()=>alert("실패"));
	});
	
	$("#write").on("click", function(){
		var param = {
			_csrf : "${_csrf.token}",
			category : $("#category_name").val()
		}
		$.ajax({
			url: "/adaco/admin/category_write",
			method: "post",
			data: param
		}).done(()=>alert("카테고리가 추가되었습니다.")).fail(()=>alert("실패"));		
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
})
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
          <h1 class="h3 mb-2 text-gray-800">카테고리 관리</h1>
          <p class="mb-4">카테고리를 추가하거나 삭제할 수 있습니다.</p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">카테고리 내역</h6>
            </div>
            <div class="card-body">
            
            <div style=" width:200px; display: inline-block; margin-left: 5px; margin-top: 20px;">
			<select id = "category" class = "custom-select">
				<c:forEach items="${categoryList}" var="category">
							<option value = "${category.category }">${category.category}</option>
				</c:forEach>
			</select>
			</div>
				<button id = "delete" class = "btn btn-danger btn-icon-split">
		       		<span class="icon text-white-50">
		       			<i class = "fas fa-trash"></i>
		       		</span>
		       		<span class ="text">삭제</span>
		       </button>
			<div>
				<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" style="margin-left: 0rem!important;">
		            <div class="input-group" style="margin-top: 10px;">
		              <input type="text" class="form-control bg-light border-0 small" placeholder="추가할 카테고리 명.." aria-label="Search" aria-describedby="basic-addon2" name = "category_name" id ="category_name">
		              <div class="input-group-append">
		              </div>
		            </div>
		          </form>
				<button type = "button" id = "write" class = "btn btn-primary btn-icon-split">
		       		<span class="icon text-white-50">
		       			<i class = "fas fa-arrow-right">
		       			</i>
		       		</span>
		       		<span class ="text">추가</span>
		 		</button>
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