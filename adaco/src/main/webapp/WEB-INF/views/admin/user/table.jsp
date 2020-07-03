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

  <title>SB Admin 2 - Dashboard</title>

  <!-- Custom fonts for this template-->
  <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="../css/sb-admin-2.min.css" rel="stylesheet">
  
   <!-- Custom styles for this page -->
  <link href="../vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
  
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  
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
          <h1 class="h3 mb-2 text-gray-800">문의 관리</h1>
          <p class="mb-4">답변 완료/미답변을 구분지어 관리 할 수 있습니다.</p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">유저 관리</h6>
            </div>
				<div style="display: inline-block; margin-left: 20px; margin-top: 20px;">
					<select class="category">
							<option value="선택">선택</option>
							<option value="답변대기">미답변 문의</option>
							<option value="답변완료">답변 완료문의</option>
							<option value="">전체</option>
					</select>
				</div>
	          	   <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
		            <div class="input-group">
		              <input type="text" class="form-control bg-light border-0 small" placeholder="유저 및 작가 이름.." aria-label="Search" aria-describedby="basic-addon2" name = "writer" id ="writer">
		              <div class="input-group-append">
		                <button class="btn btn-primary" type="button">
		                  <i class="fas fa-search fa-sm"></i>
		                </button>
		              </div>
		            </div>
		          </form>
            <div class="card-body">
              <div class="table-responsive">
              <div class= "col-sm-12 col-md-6">
              </div>
                <table class="table table-hover" id="report_list" width="100%" cellspacing="0">
                <colgroup>
					<col width="5%">
					<col width="10%">
					<col width="30%">
					<col width="10%">
					<col width="5%">
					<col width="3%">
				</colgroup>
                <caption><strong>삭제할 항목을 체크하여 삭제해주세요.</strong></caption>
			<thead>
			<tr>
				<th>댓글 번호</th>
				<th>유저명</th>
				<th>내용</th>
				<th>작성일</th>
				<th>신고수</th>
				<th><i class="fa fa-scissors" aria-hidden="true">처리</i></th>
			</tr>
		</thead>
		<tbody id = "list">
		<c:forEach items = "${reportPage.adminReportList}" var = "report">
			<tr>
				<td>${report.cno }</td>
				<td>${report.username }</td>
				<td>${report.content }</td>
				<td>${report.writeDateStr }</td>
				<td>${report.reportCnt }</td>
				<td><input type="checkbox" class="cno" value="${report.cno}"></td>
			</tr>
		</c:forEach>
		</tbody>
       </table>
		<ul class="pagination" style="text-align: center; margin: 0 auto; width: 0px; text-align: center;">
			<c:if test="${reportPage.prev==true}">
				<li class = "page-item"><a class="page-link" href="/adaco/admin/report_list?pageno=${reportPage.startPage-1}">이전</a></li>
			</c:if>
			<c:forEach begin="${reportPage.startPage}" end="${reportPage.endPage}" var="i">
				<c:choose>
					<c:when test="${reportPage.pageno eq i }">
						<li class="page-item active">
							<a class = "page-link" href="/adaco/admin/report_list?pageno=${i}">${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class = "page-item"><a class = "page-link" href="/adaco/admin/report_list?pageno=${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
				
			</c:forEach>
			<c:if test="${reportPage.next==true}">
				<li class = "page-item"><a class="page-link" href="/adaco/admin/report_list?pageno=${reportPage.endPage+1}">다음</a></li>
			</c:if>
		</ul>
       <button id = "delete" class = "btn btn-danger">삭제</button>
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
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
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