<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
	#aside {
		width:110px;
		height:500px;
		background-color: gray;
		float: left;
	}
	#profile {
		width:200px;
		height:200px;
	}
	#section {
	width: 850px;
	padding: 5px;
	float: right;
	min-height: 600px;
	}
	#my {
		width:750px;
		padding: 0px;
		height:80px;
		background-color: gray;
		margin: 0px;
	}
	
	.list {
		margin-top:0px;
		padding-top:0px;
		display:inline-block;
		width:240px;
		height:50px;
		border: 1px solid red;
	}
</style>
<body>

<div>
<aside id="asideMain">
	<div id="aside">
		<div id="profile">
		</div>
		<div>
			<ul class="list-group" id="navi">
					<li class="list-group-item list-group-item-action"><a href="/adaco/user/read" style="color: black; text-decoration: none;">�� ���� ����</a></li>
					<li class="list-group-item list-group-item-action"><a href="/adaco/user/questionList" style="color: black; text-decoration: none;">���ǳ���</a></li>
					<li class="list-group-item list-group-item-action"><a href="/adaco/user/orderList" style="color: black; text-decoration: none;">�ֹ�����</a></li>
					<li class="list-group-item list-group-item-action"><a href="/adaco/user/reviewList" style="color: black; text-decoration: none;">�� ���� ����</a></li>
					<li class="list-group-item list-group-item-action"><a href="/adaco/user/favoriteList" style="color: black; text-decoration: none;">���ã�� ���</a></li>
					<li class="list-group-item list-group-item-action"><a href="/adaco/user/pointList" style="color: black; text-decoration: none;">����Ʈ��</a></li>
					<li class="list-group-item list-group-item-action" id="group">
						<div class="title">
							<a style="color: black; text-decoration: none;">
							�޽�����
							</a>
						</div>
						<ul class="sub"> 
							<li>
								<a href="/adaco/message/listSender" style="color: black; text-decoration: none;" >
									<i class="fas fa-angle-right" style="opacity: 0.5;"></i> ���� ������</a>
							</li>
							<li>
								<a href="/adaco/message/listReceiver" style="color: black; text-decoration: none;" >
									<i class="fas fa-angle-right" style="opacity: 0.5;"></i> ���� ������</a>
							</li>
						</ul>
					</li>
				</ul>
		</div>
	</div>
	</aside>
	<section id="section">
		 <div>
   <h1>�޼�����</h1>
      <table class="table table-hover">
         <thead>
         <tr>
            <th>��ȣ</th><th></th><th></th><th></th>
            
         </tr>
         </thead>
         <tbody>
      		<tr> 
                  <td></td>
                  <td></td>
                  <td></td>               
                  <td></td>
                  <td></td>
           </tr>
         </tbody>
      </table>
      <br><br><br><br><br><br><br><br><br><br><br>
   </div>		
	</section>
	
	</div>
	
</body>
</html>