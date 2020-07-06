<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>HandStory- Admin</title>

  <!-- Custom fonts for this template-->
  <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	
  <!-- Custom styles for this template-->
  <link href="../css/sb-admin-2.min.css" rel="stylesheet">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script type="text/javascript">
  	var $countByQuestion = ${index.countByQuestion };
  	var $countByNoAnswerQuestion= ${index.countByNoAnswerQuestion};
  	var $countByUser = ${index.countByUser};
  	var $countByArtist = ${index.countByArtist};
  	$(function(){
  		var $countByAnswer = $countByQuestion - $countByNoAnswerQuestion;
  		var nanuge = $countByAnswer/$countByQuestion;
  		var per = Math.round(nanuge*100);
  		$("#noanswer_per").text(per+"%");
  		$("#noanswer_per_id").css({
  			width: per+"%",
  		})
  	})
  </script>
</head>

<body id="page-top">
  <!-- Page Wrapper -->
  <div id="wrapper">

	<jsp:include page = "../include/admin_sidebar.jsp" />
    
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

    <!-- Main Content -->
    <div id="content">
    
 	<jsp:include page = "../include/admin_topbar.jsp" />
      
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- 페이지 상단 표시 -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">게시글 및 유저관리</h1>
          </div>

          <!-- Content Row -->
          <div class="row">

            <!-- 1:1문의 관련 -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">1:1문의</div>
                      <div class="card border-0 bg-light text-center hov-p">
              				<h5 class="text-dark font-weight-bold m-2" style="height: 72px;">
              						<span id = "question_cnt" style="padding-top: 10px; display: inline-block;">
              						${index.countByQuestion }
              						</span>
			              				<a class="nav-link" href="/adaco/admin/question_list" id = "question_list">
			              					전체 문의
		              					</a>
              				</h5>
              		        <div class="card border-0 bg-light text-center hov-p">
              				<hr>
              				<h5 class="text-dark font-weight-bold m-2" style="height: 72px;">
              					<span id = "noanswer_cnt">${index.countByNoAnswerQuestion}</span>
              					<a class="nav-link" href="/adaco/admin/question_list?searchType=답변대기">
	              					미답변 문의
              				</a></h5>
              				</div>
              			</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- 신고글 관리 -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-danger shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">신고글 관리</div>
                      <div class="card border-0 bg-light text-center hov-p" style="height: 210px; padding: 75px;">
              				<h5 class="text-dark font-weight-bold m-2">
	              				<a class="nav-link" href="/adaco/admin/report_list" style="color: #e74a3b;">
	              					신고글 관리
	              				</a>
              				</h5>
              			</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- 유저관리 -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1">회원 관리</div>
                      <div class="card border-0 bg-light text-center hov-p">
              				<h5 class="text-dark font-weight-bold m-2" style="height: 72px;">
	              				<span id = "question_cnt" style="padding-top: 10px; display: inline-block;">
              						${index.countByUser}
              					</span>
	              				<a class="nav-link" href="/adaco/admin/user_list" style="color: #36b9cc;">
	              					전체 회원
	              				</a>
              				</h5>
              		        <div class="card border-0 bg-light text-center hov-p">
              				<hr>
              				<h5 class="text-dark font-weight-bold m-2" style="height: 72px;">
              				<span id = "question_cnt">
              						${index.countByArtist}
              					</span>
              					<a class="nav-link" href="/adaco/admin/artist_list" style="color: #36b9cc;">
              					작가 회원
              				</a></h5>
              				</div>
              			</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- 안내 페이지 -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">고객 안내</div>
                      <div class="card border-0 bg-light text-center hov-p">
              				<h5 class="text-dark font-weight-bold m-2">
	              				<a class="nav-link" href="/adaco/admin/notice_list" style="height: 72px; padding: 35px; color: #f6c23e;">
	              					공지사항
	              				</a>
              				</h5>
              		        <div class="card border-0 bg-light text-center hov-p">
              				<hr>
              				<h5 class="text-dark font-weight-bold m-2"><a class="nav-link" href="FAQ" style="height: 72px; padding: 15px; color: #f6c23e;">
              					FAQ
              				</a></h5>
              				</div>
              			</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>


          <!-- Content Row -->
          <div class="row">

            <!-- Content Column -->
            <div class="col-lg-6 mb-4">

              <!-- 통계 처리 -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">문의 및 신고글 처리</h6>
                </div>
                <div class="card-body">
                  <h4 class="small font-weight-bold">답변 처리율<span class="float-right" id="noanswer_per"></span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar bg-info" role="progressbar" id = "noanswer_per_id" style="width: 20%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                  <h4 class="small font-weight-bold">의욕<span class="float-right">10%</span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar bg-danger" role="progressbar" style="width: 10%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div>
              </div>

              <!-- 색상표 -->
              <div class="row">
                <div class="col-lg-6 mb-4">
                  <div class="card bg-primary text-white shadow">
                    <div class="card-body">
                      Primary
                      <div class="text-white-50 small">#4e73df</div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 mb-4">
                  <div class="card bg-success text-white shadow">
                    <div class="card-body">
                      Success
                      <div class="text-white-50 small">#1cc88a</div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 mb-4">
                  <div class="card bg-info text-white shadow">
                    <div class="card-body">
                      Info
                      <div class="text-white-50 small">#36b9cc</div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 mb-4">
                  <div class="card bg-warning text-white shadow">
                    <div class="card-body">
                      Warning
                      <div class="text-white-50 small">#f6c23e</div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 mb-4">
                  <div class="card bg-danger text-white shadow">
                    <div class="card-body">
                      Danger
                      <div class="text-white-50 small">#e74a3b</div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 mb-4">
                  <div class="card bg-secondary text-white shadow">
                    <div class="card-body">
                      Secondary
                      <div class="text-white-50 small">#858796</div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 mb-4">
                  <div class="card bg-light text-black shadow">
                    <div class="card-body">
                      Light
                      <div class="text-black-50 small">#f8f9fc</div>
                    </div>
                  </div>
              </div>
              <div class="col-lg-6 mb-4">
                <div class="card bg-dark text-white shadow">
                  <div class="card-body">
                      Dark
                      <div class="text-white-50 small">#5a5c69</div>
                  </div>
                </div>
              </div>
            </div>

            </div>

            <div class="col-lg-6 mb-4">

              <!-- 일러스트 참고 -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Illustrations</h6>
                </div>
                <div class="card-body">
                  <div class="text-center">
                    <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;" src="../image/undraw_posting_photo.svg" alt="">
                  </div>
                  <p>본 페이지는 BootStrap4 SB Admin2 템플릿 및 <a target="_blank" rel="nofollow" href="https://undraw.co/">unDraw</a>, svg 일러스트레이션 사이트 Undraw를 참고하여 작성하였습니다. </p>
                  <a target="_blank" rel="nofollow" href="https://undraw.co/">Browse Illustrations on unDraw &rarr;</a>
                </div>
              </div>

              <!-- Approach -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">핸드스토리 소개</h6>
                </div>
                <div class="card-body">
                  <p>핸드스토리는 작가가 만든 작품을 판매하는 핸드메이드 쇼핑몰입니다.</p>
                  <p class="mb-0">일반 소비자와 구매자 사이를 넘어서 작가와 소비자가 소통하는 쇼핑몰이다.</p>
                </div>
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
  <script src="../vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="../js/demo/chart-area-demo.js"></script>
  <script src="../js/demo/chart-pie-demo.js"></script>

</body>

</html>