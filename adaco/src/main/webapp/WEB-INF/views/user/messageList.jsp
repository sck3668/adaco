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
			<ul>
				<li><a href="/adaco/user/read" style="color: black;">����������</a></li>
				<li><a href="/adaco/order/list"style="color: black;">�ֹ�����</a></li>
				<li><a href="/adaco/user/reviewList" style="color: black;">�����亸��</a></li>
				<li><a href="/adaco/user/favoriteList" style="color: black;">���ã����</a></li>
				<li><a href="/adaco/user/pointList" style="color: black;">����Ʈ�� </a>
				<li><a href="/adaco/user/messageList" style="color: black;">�޼�����</a>
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