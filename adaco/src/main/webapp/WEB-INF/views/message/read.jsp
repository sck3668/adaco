<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	#section {
	width: 850px;
	padding: 5px;
	float: right;
	min-height: 600px;
	}

</style>
<script>
$(function() {
	$("#btnSend").on("click", function() {
		location.href = "/adaco/message/listSender";
	});
	$("#btnReceive").on("click", function() {
		location.href = "/adaco/message/listReceiver";
	});	
	
	 //모든 서브 메뉴 감추기
    $(".sub").css({display:"none"}); 
    //$(".sub").hide(); //위코드와 동일 

    $(".title").click(function(){
        //일단 서브메뉴 다 가립니다.
        $(".sub").css({display:"none"});
        
        //열린 서브메뉴에 대해서만 가립니다.
        $(".sub").each(function(){
            console.log($(this).css("display"));
            if($(this).css("display")=="block") {
                //$(".sub").css({display:"none"});
                //$(this).hide();
                $(this).slideUp("fast");
            }
        });

        //현재 요소의 다음 요소를 보이게 합니다.
        //$(this).next("ul").css({display:"block"});
        //$(this).next("ul").show();
        $(this).next("ul").slideDown("fast");


    })
})
</script>
</head>
<body>
<section id="section">
<h3>쪽지 자세히 보기</h3>
	 <table>
		<tr><td>${msg.writeDate}에 ${msg.sendId }님이 ${msg.recipientId }님에게 보낸 메모</td></tr>
		<tr><td>${msg.title }</td></tr> 
		<tr><td>${msg.content }</td></tr>
	</table><br>
	<button id="btnSend" class="btn btn-success">보낸쪽지함으로</button>
	<button id="btnReceive" class="btn btn-warning">받은쪽지함으로</button>
	</section>
</body>
</html>