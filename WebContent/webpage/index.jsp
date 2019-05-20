<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title></title>
	<script src="../js/global.js"></script>
	<canvas id="christmasCanvas" style="top: 0px; left: 0px; z-index: 5000; position: fixed; pointer-events: none;" ></canvas>
    <script>
	 function snow() {
			var b = document.getElementById("christmasCanvas");
			var a = b.getContext("2d");//getContext() 方法返回一个用于在画布上绘图的环境。2d二维绘图
			var d = window.innerWidth;//获取屏幕的宽
			var c = window.innerHeight;
			b.width = d;
			b.height = c;
			for(var e = [], b = 0;b < 70;b++) {
				e.push({
					x:Math.random() * d, //random() 方法可返回介于 0 ~ 1 之间的一个随机数
					zy:Math.random() * c, 
					r:Math.random() * 4 + 1,
					d:Math.random() * 70
				});
			}
			var h = 0;
			window.intervral4Christmas = setInterval(
			function() {
				a.clearRect(0, 0, d, c);
				a.fillStyle = "rgba(160, 32, 240, 1)";
				a.shadowBlur = 5;
				a.shadowColor = "rgba(120, 165, 154, 0.1)";
				a.beginPath();
				for(var b = 0;b < 70;b++) {
				 var f = e[b];
				 a.moveTo(f.x, f.y);
				 a.arc(f.x, f.y, f.r, 0, Math.PI * 2, !0)
				}
				a.fill();
				h += 0.01;
				for(b = 0;b < 70;b++) {
					if(f = e[b], f.y += Math.cos(h + f.d) + 1 + f.r / 2, f.x += Math.sin(h) * 2, f.x > d + 5 || f.x < -5 || f.y > c) {
						e[b] = b % 3 > 0 ? {x:Math.random() * d, 
						y:-10, 
						r:f.r, d:f.d} : Math.sin(h) > 0 ? {x:-5, y:Math.random() * c, 
						r:f.r, d:f.d} : {x:d + 5, y:Math.random() * c, 
						r:f.r, d:f.d}
					};
				};
			}, 70);
		}
		
        $(function(){
        	snow();
        	$("#menuTree").tree({
        		url:'/CrmDB/Home/sysRolesModules',
        		method:'post',
        		animate:true,
        		onSelect:function(node){
        			var flag = $("#tt").tabs('exists', node.text);
                    var isLeaf = $('#menuTree').tree('isLeaf',node.target); //是否是叶子节点
                    if (isLeaf) {//只有叶子节点才会在选项卡中创建选项页（每个选项页对应1个功能） 
                        if(!flag) {
                            $('#tt').tabs('add', { //在选项卡中，创建1个选项页
                                title: node.text,   //选项卡中，选项页的标题（在同一个选项卡中，选项页需要保持一致）。
                                closable: true,
                                content: "<iframe width=100% height=580 src='/CrmDB/webpage/"+node.path+"'/>"    //此处做了调整，推荐使用iframe的方式实现
                           });
                        } else {
                            $("#tt").tabs('select', node.text); //直接选中title对应的选项卡
                        }
                    }
                }
        	})
        })
        
   		function tuichu(){
        	
        	window.location.href="/CrmDB/Home/tuichu";
        	
        }
        
        function qiandaoInfo(){
        	$('#qinadaoLog').window('open'); 
        }
        function usersInfo(){
        	$('#updateLog').window('open'); 
        }
        function quxiaoInfo(){
        	$('#updateLog').window('close'); 
        }
        function updatesPsw(){
        	$('#updatePswLog').window('open'); 
        }
        function quxiaoPsw(){
        	$('#updatePswLog').window('close'); 
        }
        function reloadsPsw(){
        	$('#reloadPswLog').window('open'); 
        }
        function reloadclosePsw(){
        	$('#reloadPswLog').window('close');
        }
        
        
        function updateInfo(){
        	
        	$.post("/CrmDB/Home/updateInfo",{
        		Id:$("#loginid").val(),
        		LoginName:$("#LoginName").val(),
        		ProtectEMail:$("#ProtectEMail").val(),
        		ProtectMtel:$("#ProtectMtel").val(),
        	},function(res){
        		if(res>0){
        			$.messager.alert("提示","修改成功!!")
        		}else {
        			$.messager.alert("提示","修改失败!!")
        		}
        		$('#updateLog').window('close');
        	},"json")
        }
        
        function updatePsw(){
        	
        	var yuanPsw = $("#yuanPsw").val();
        	var xinPsw = $("#xinPsw").val();
        	var xinPsw2 = $("#xinPsw2").val();
        	if(xinPsw!=xinPsw2){
        		$.messager.alert("提示","两次密码输入不一致")
        	}else {
        		$.post("/CrmDB/Home/updatePsw",{
        			yuanPsw:yuanPsw,
        			xinPsw:xinPsw
            	},function(res){
            		if(res<0){
            			$.messager.alert("提示","修改失败");
            		}else if(res==1){
            			$.messager.alert("提示","修改成功,请重新登录");
            			window.location.href="/CrmDB/Home/tuichu";
            		}else {
            			$.messager.alert("提示","原密码错误");
            		}
            	},"json")
        	}
        	
        }
        
        function reloadPsw(){
        	var metelPsw = $("#metelPsw").val();
        	var emailPsw = $("#emailPsw").val();
        	if(metelPsw==''&&emailPsw==''){
        		$.messager.alert("提示","请至少输入一项密保验证");
        	}else {
        		$.messager.confirm("提示","你确定重置密码吗？（默认密码为ysd123）",function(r){
        			if(r){
        				$.post("/CrmDB/Home/reloadPsw",{
                			metelPsw:metelPsw,
                			emailPsw:emailPsw
                		},function(res){
                			if(res<0){
                				$.messager.alert("提示","重置密码失败");
                			}else if(res==4){
                				$.messager.alert("提示","密保手机号不正确");
                			}else if(res==5){
                				$.messager.alert("提示","密保邮箱不正确");
                			}else if(res==6){
                				$.messager.alert("提示","密保手机号和密保邮箱都不正确");
                			}else {
                				$.messager.alert("提示","重置密码成功");
                				window.location.href="/CrmDB/Home/tuichu";
                			}
                		},"json")
        			}
        		})
        			
        	}
        	
        }
        
        /* 签到 */
        function pin() {
		var btn = document.getElementById("qd");
		$.post("/CrmDB/addUserCheck",{checkState:"已签到"},function(res){
				if(res>0){
					$.messager.alert("提示","签到成功");
					//数据库拿出
					btn.innerHTML = "已签到";
				}else{
					$.messager.alert("提示","签到成功");
				}
			},"json")
		
	}
	function piny() {
		$.messager.alert("提示","今日已签到");
	}
	function pout(){
		var btn = document.getElementById("qc");
		$.post("/CrmDB/updateUserCheck",{isCancel:"已签出"},function(res){
			if(res>0){
				btn.innerHTML = "已签出";
				$.messager.alert("提示","签出成功");
				
			}else{
				$.messager.confirm("提示","今日还未签到，无法签出",function(r){
					if(r){
						$.messager.confirm("提示","是否签到",function(a){
							if(a){
								 pin();
							}
						})
						
					}
				})
			}
		},"json");
		
	}
	function pouty(){
		$.messager.alert("提示","今日已签出");
	}
	</script>
	</head>

	<body class="easyui-layout" style="text-align: center;">
		<%HttpSession s= request.getSession();%>
		欢迎
		<a href="javascript:void(0)" id="mb" class="easyui-menubutton" data-options="menu:'#mm',iconCls:'icon-man'">${loginUser.loginName}</a>
		登录!!! 
		<div id="mm" style="width:150px;">   
		<div class="class-linkbutton" onclick="qiandaoInfo()" data-options="iconCls:'icon-mini-edit'">签到签出</div> 
		    <div class="class-linkbutton" onclick="usersInfo()" data-options="iconCls:'icon-undo'">修改信息</div>   
		    <div class="class-linkbutton" onclick="updatesPsw()" data-options="iconCls:'icon-redo'">修改密码</div> 
		    <div class="class-linkbutton" onclick="reloadsPsw()" data-options="iconCls:'icon-reload'">重置密码</div>  
		</div>  
		<a href="javascript:void(0)" style="text-decoration: none" onclick="tuichu()" >[安全退出]</a>
	<div style="margin:20px 0;"></div>
    <div class="easyui-layout" style="width:100%;height:700px;">
        <div data-options="region:'north'" style="height:50px"><h2>云时代欢迎您！</h2></div>
        <div data-options="region:'south',split:true" style="height:50px;"></div>
        <!--<div data-options="region:'east',split:true" title="East" style="width:100px;"></div>-->
        <div data-options="region:'west',split:true" title="导航应用" style="width:150px;">
           <div id="menuTree" ><!--这个地方显示树状结构-->
            
           </div>
        </div>
        <div id="centerTabs" data-options="region:'center',iconCls:'icon-ok'" >
            <div id="tt" class="easyui-tabs"> <!--这个地方采用tabs控件进行布局-->
            
            </div>
        </div>
    </div>
    <!-- 修改用户信息 -->
    <div id="updateLog" class="easyui-dialog" title="修改信息" 
        data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">   
    	  <form id="updateFrm" class="easyui-form">
    	  		<table cellpadding="5">
    	  			<tr style="display: none">
    	  				<td><label for="name">ID:</label> </td>
    	  				<td><input class="easyui-validatebox" type="text" id="loginid" value="${loginUser.id}"  disabled="disabled" /> </td>
    	  			</tr>
    	  			<tr>
    	  				<td><label for="name">帐号:</label> </td>
    	  				<td><input class="easyui-validatebox" type="text" id="LoginName" value="${loginUser.loginName}" name="LoginName" disabled="disabled" /> </td>
    	  			</tr>
    	  			<tr>
    	  				<td><label for="name">邮箱:</label> </td>
    	  				<td><input class="easyui-validatebox" type="text" id="ProtectEMail" value="${loginUser.protectEMail}" name="ProtectEMail" /> </td>
    	  			</tr>
    	  			<tr>
    	  				<td><label for="name">电话:</label> </td>
    	  				<td><input class="easyui-validatebox" type="text" id="ProtectMtel" value="${loginUser.protectMtel}" name="ProtectMtel" /> </td>
    	  			</tr>
    	  			<tr>
    	  				<td></td>
    	  				<td>
    	  					<a href="javascript:void(0)" class="easyui-linkbutton" onclick="updateInfo()" data-options="iconCls:'icon-save'">保存</a>
    	  					<a href="javascript:void(0)" class="easyui-linkbutton" onclick="quxiaoInfo()" data-options="iconCls:'icon-cancel'">取消</a>
    	  				</td>
    	  			</tr>
    	  		</table>
    	  </form>
	</div>
	
	 <!-- 签到信息 -->
    <div id="qinadaoLog" class="easyui-dialog" title="签到信息" 
        data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">   
    	  <form id="qiandaoFrm" class="easyui-form">
    	  		
    	  		<table>
				<tr >
				<td>签到状态：</td>
				 <td  style="font-size: 12px"><%if(s.getAttribute("qdstate")!=null){%>
					<a href="javascript:void(0)" onclick="piny()" id="qd">
						<%=s.getAttribute("qdstate") %>
					</a>
						<%}else{ %>
					<a href="javascript:void(0)" onclick="pin()" id="qd">
						未签到
					</a>
						<%} %>
						<%if(s.getAttribute("qcstate")!=null){%>
					&ensp;&ensp;<a href="javascript:void(0)" id="qc" onclick="pouty()">
						<%=s.getAttribute("qcstate") %>
					</a>
						<%}else{ %>
					&ensp;&ensp;<a href="javascript:void(0)" id="qc" onclick="pout()">未签出</a>
						<%} %>
					</td>
				</tr>
				
			</table>	
    	  </form>
    	
	</div>
	<!-- 修改密码 -->
	<div id="updatePswLog" class="easyui-dialog" title="修改密码" 
        data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">   
    	  <form id="updatePswFrm" class="easyui-form">
    	  		<table cellpadding="5">
    	  			<tr>
    	  				<td><label for="name">原密码:</label> </td>
    	  				<td><input class="easyui-validatebox" type="password" data-options="required:true" id="yuanPsw" /> </td>
    	  			</tr>
    	  			<tr>
    	  				<td><label for="name">新密码:</label> </td>
    	  				<td><input class="easyui-validatebox" type="password" data-options="required:true" id="xinPsw" /> </td>
    	  			</tr>
    	  			<tr>
    	  				<td><label for="name">确认新密码:</label> </td>
    	  				<td><input class="easyui-validatebox" type="password" data-options="required:true" id="xinPsw2" /> </td>
    	  			</tr>
    	  			<tr>
    	  				<td></td>
    	  				<td>
    	  					<a href="javascript:void(0)" class="easyui-linkbutton" onclick="updatePsw()" data-options="iconCls:'icon-save'">保存</a>
    	  					<a href="javascript:void(0)" class="easyui-linkbutton" onclick="quxiaoPsw()" data-options="iconCls:'icon-cancel'">取消</a>
    	  				</td>
    	  			</tr>
    	  		</table>
    	  </form>
	</div>
	
	<!-- 重置密码 -->
	<div id="reloadPswLog" class="easyui-dialog" title="修改密码" 
        data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">   
    	  <form id="reloadPswFrm" class="easyui-form">
    	  		<table cellpadding="5">
    	  			<tr>
    	  				<td><label for="name">请输入密保手机:</label> </td>
    	  				<td><input class="easyui-validatebox" type="text" data-options="required:true" id="metelPsw" /> </td>
    	  			</tr>
    	  			<tr>
    	  				<td><label for="name">请输入密保邮箱:</label> </td>
    	  				<td><input class="easyui-validatebox" type="text" data-options="required:true" id="emailPsw" /> </td>
    	  			</tr>
    	  			<tr>
    	  				<td style="color: red">(二选一即可)</td>
    	  				<td>
    	  					<a href="javascript:void(0)" class="easyui-linkbutton" onclick="reloadPsw()" data-options="iconCls:'icon-save'">保存</a>
    	  					<a href="javascript:void(0)" class="easyui-linkbutton" onclick="reloadclosePsw()" data-options="iconCls:'icon-cancel'">取消</a>
    	  				</td>
    	  			</tr>
    	  		</table>
    	  </form>
	</div>
	</body>
</html>
