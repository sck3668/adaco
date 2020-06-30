$(function() {
	var wsocket;
	function webSocketConnect() {
		// 로그인했고 웹 소켓 연결이 되지 않았다면...연결
		if(wsocket==undefined) {
			wsocket = new WebSocket("ws://localhost:8081/adaco/web/socket");
			console.log(wsocket);
			wsocket.onmessage = function(evt) {
				var data = evt.data.split(":");
				toastr.success(data[1], data[0]);
			}
		}
	}
	webSocketConnect();	
});

