<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录</title>
<script src="../js/global.js"></script>
<style>
  .input-val {
  width: 200px;
  height: 32px;
  border: 1px solid #ddd;
  box-sizing: border-box;
  }
  #canvas {
  vertical-align: middle;
  box-sizing: border-box;
  border: 1px solid #ddd;
  cursor: pointer;
  }
  .btn {
  display: block;
  margin-top: 20px;
  height: 32px;
  width: 100px;
  font-size: 16px;
  color: #fff;
  background-color: #457adb;
  border: none;
  border-radius: 50px;
  }
 </style>


<script type="text/javascript">
	var username,userpsw,str;
	function submitForm() {
		
		if ($("#check").is(":checked")) {
            var obj = {};
            obj.name = $("#uname").val();
            obj.pass = $("#pwd").val();
            var str = JSON.stringify(obj);
            setCookie("init", str, 7);
        }
		
		var flg = $("#loginForm").form("validate");
		var LoginName = $("#uname").val();
		var Password = $("#pwd").val();
		if (flg) {
			$.post("/CrmDB/Home/userLogin", {
				LoginName : LoginName,
				Password : Password,
			}, function(res) {
				if (res==1) {
					$.messager.alert("提示", "该用户名不存在");
					
				} else if(res==2) {
					$.messager.alert("提示", "该用户是锁定用户，如需解锁请联系管理员");
					
				} else if(res==3){
					$.messager.alert("提示", "密码错误次数大于3次，该用户已被锁定，如需解锁请联系管理员");
				} else if(res==4){
					$.messager.alert("提示", "密码错误,请重新输入");
					
				} else{
					$.messager.alert("提示", "正在登录······");
					window.location.href = "/CrmDB/Home/index";
				}
			}, "json");
		}
	}
	function clearForm() {
		$("#loginForm").window("clear");
	}
	
	
	//设置cookie
	function setCookie(_name, val, expires) {
	    var d = new Date();
	    d.setDate(d.getDate() + expires);
	    document.cookie = _name + "=" + val + ";path=/;expires=" + d.toGMTString();
	}
	 
	//获取cookie
	function getCookie(_name) {
	    var cookie = document.cookie;
	    var arr = cookie.split("; ");
	    for (var i = 0; i < arr.length; i++) {
	        var newArr = arr[i].split("=");
	        if (newArr[0] == _name) {
	            return newArr[1];
	        }
	    }
	    return "";
	}
	 /*
	    如何将json对象转换为字符串
	        JSON.stringify(对象);
	        返回值是一个字符串
	    如何将字符串转换为json对象
	        JSON.parse(字符串)
	        返回值是对象
	 */
	 if (getCookie("init")) {
	        var cookie = JSON.parse(getCookie("init"));
	        username = cookie.name;
	        userpsw = cookie.pass;
	 }
	
	function yanzhengma(){
		 var show_num = [];
		  draw(show_num);
		  $("#canvas").on('click',function(){
		   draw(show_num);
		  })
		  $("#btnn").on('click',function(){
		   var val = $("#yan").val().toLowerCase();
		   var num = show_num.join("");
		   if(val==''){
		    alert('请输入验证码！');
		   }else if(val == num){
		    submitForm();
		    $("#yan").val('');
		    // draw(show_num);
		   }else{
		    alert('验证码错误！请重新输入！');
		    $("#yan").val('');
		    // draw(show_num);
		   }
		  })
	}
	$(function(){
		yanzhengma();
		if(username!=null){
			
			$.messager.show({
				title:'',
				timeout:5000,
				showType:'slide',
				msg:'<font size=\"2\" color=\"#666666\" ><strong>是否登陆上次保存账号？'
					+ '<br clear=left>'
					+ '<br><span  style=\"padding-left:60px\"></span><input type=\"button\" value=\"登陆\" onClick=\"showlogin()\">'
					+ '<span  style=\"padding-left:20px\"></span><input type=\"button\" value=\"清除记录\" onClick=\"closeshow()\">'
				});
			$('#uwin').panel('open');
		}
	})
	function showlogin() {
		$('#uwin').panel('close');
		$("#frm").form("load", {
			name : username,
			psw : userpsw
		});
		login(username, userpsw);
	}

	function closeshow() {
		$('#uwin').panel('open');
		$.messager.show({
			title : '消息提示',
			timeout : 5000,
			showType : 'slide',
			msg : '已清空上次登陆记录'
		});
		setCookie("init","",0);
	}

		 //生成并渲染出验证码图形
		 function draw(show_num) {
		  var canvas_width=$('#canvas').width();
		  var canvas_height=$('#canvas').height();
		  var canvas = document.getElementById("canvas");//获取到canvas的对象，演员
		  var context = canvas.getContext("2d");//获取到canvas画图的环境，演员表演的舞台
		  canvas.width = canvas_width;
		  canvas.height = canvas_height;
		  var sCode = "a,b,c,d,e,f,g,h,i,j,k,m,n,p,q,r,s,t,u,v,w,x,y,z,A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0";
		  var aCode = sCode.split(",");
		  var aLength = aCode.length;//获取到数组的长度
		  for (var i = 0; i < 4; i++) { //这里的for循环可以控制验证码位数（如果想显示6位数，4改成6即可）
		   var j = Math.floor(Math.random() * aLength);//获取到随机的索引值
		   // var deg = Math.random() * 30 * Math.PI / 180;//产生0~30之间的随机弧度
		   var deg = Math.random() - 0.5; //产生一个随机弧度
		   var txt = aCode[j];//得到随机的一个内容
		   show_num[i] = txt.toLowerCase();
		   var x = 10 + i * 20;//文字在canvas上的x坐标
		   var y = 20 + Math.random() * 8;//文字在canvas上的y坐标
		   context.font = "bold 23px 微软雅黑";
		   context.translate(x, y);
		   context.rotate(deg);
		   context.fillStyle = randomColor();
		   context.fillText(txt, 0, 0);
		   context.rotate(-deg);
		   context.translate(-x, -y);
		  }
		  for (var i = 0; i <= 5; i++) { //验证码上显示线条
		   context.strokeStyle = randomColor();
		   context.beginPath();
		   context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
		   context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
		   context.stroke();
		  }
		  for (var i = 0; i <= 30; i++) { //验证码上显示小点
		   context.strokeStyle = randomColor();
		   context.beginPath();
		   var x = Math.random() * canvas_width;
		   var y = Math.random() * canvas_height;
		   context.moveTo(x, y);
		   context.lineTo(x + 1, y + 1);
		   context.stroke();
		  }
		 }
		 //得到随机的颜色值
		 function randomColor() {
		  var r = Math.floor(Math.random() * 256);
		  var g = Math.floor(Math.random() * 256);
		  var b = Math.floor(Math.random() * 256);
		  return "rgb(" + r + "," + g + "," + b + ")";
		 }

		 
</script>
</head>

<body>
	<div style="margin: auto auto; width: 600px; height: 400px;">
		<div style="margin: 200px 0;"></div>
		<div class="easyui-panel" title="欢迎登录" id="uwin"
			style="width: 500px; height: 250px; text-align: center;">
			<div style="padding: 10px 60px 20px 60px">
				<form id="loginForm" method="post">
					<table cellpadding="5">
						<tr>
							
							<td>登录名:</td>
							<td><input class="easyui-textbox" type="text" name="uname"
								id="uname" data-options="required:true"></input></td>
						</tr>
						<tr>
							<td>密码:</td>
							<td><input class="easyui-textbox" type="password" id="pwd"
								name="pwd" data-options="required:true"></input></td>
						</tr>
						<tr>
							<td>验证码:</td>
							<td>
								<input type="text" value="" id="yan" placeholder="请输入验证码（不区分大小写）" class="easyui-textbox">
							</td>
							<td>
								<canvas id="canvas" width="100" height="30"></canvas>
							</td>
						</tr>
					</table>
				</form>
				<div style="text-align: left; padding: 5px">
					
					<label for=""><input type="checkbox" id="check">7天免登陆</label>
					<a href="javascript:void(0)" class="easyui-linkbutton"
						id="btnn" type="button"
						data-options="iconCls:'icon-ok'">登陆系统</a> <a
						href="javascript:void(0)" class="easyui-linkbutton"
						onclick="clearForm()" data-options="iconCls:'icon-cancel'">清除输入</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
