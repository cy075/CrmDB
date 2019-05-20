<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户管理</title>
<script src="../../js/global.js"></script>
<script type="text/javascript">
/* 显示 */
$(function(){
		initUser();
	})
	function initUser(){
		
		$("#usersTab").datagrid({
			url:'/CrmDB/users/selectUsers',
			method:'post',
			fitColumns:true,
			pagination:true,
			singleSelect:true,
			toolbar:'#toobar',
			 queryParams:{
				 LoginName : $("#LoginName").val(),
				 IsLockout : $("#IsLockout"). combobox("getValue"),
				 StartcreateTime : $("#StartcreateTime").datetimebox('getValue'),
				 EndcreateTime : $("#EndcreateTime").datetimebox('getValue'),
			},
			
		})
	}
	
	

function formatterCaozuo(value,row,index){
	return "<a href='javascript:void(0)' onclick='update1("+index+")'>编辑</a>   <a href='javascript:void(0)' onclick='del("+index+")'>删除</a>  <a href='javascript:void(0)' class='easyui-linkbutton'  onclick='RestPasUesr("+index+")'>重置密碼</a>"
} 

function close1(){
	$("#update_datagrid").dialog("close");
}
function addUsersClose(){
	$("#addusersDialog").dialog("close");
}

/* 密碼重置 */
function RestPasUesr(index){
	
	var rows=$("#usersTab").datagrid('getData').rows[index];
	var resetPassword=rows.resetPassword;
	var id=rows.id;
	$.post("/CrmDB/users/ResetUserPas",{ resetPassword:resetPassword,id:id},function(res){
		if(res>0){
			$('#usersTab').datagrid('reload');  
			$.messager.alert("提示","密碼重置成功");
		}else{
			$.messager.alert("提示","密碼重置失败");
		}
	})
}

/* 打开添加的对话框 */
function add() {
	$("#addusersDialog").dialog("open");
}

/* 添加用户 */
function addUsersSubmit() {
	var flag = $("#addusersDialog").form("validate");
	if (flag) {
		$.post("/CrmDB/users/addAllUsers", {
			LoginName : $("#LoginName").val(),
			passWord : $("#Password").val(),
			IsLockout : $("#IsLockout").val(),
			LastLoginTime : $("#LastLoginTime").datetimebox('getValue'),
			CreateTime : $("#CreateTime").datetimebox('getValue'),
			LockTime : $("#LockTime").datetimebox('getValue'),
			PsdWrongTime : $("#PsdWrongTime").val(),
			ProtectEMail : $("#ProtectEMail").val(),
			ProtectMtel : $("#ProtectMtel").val()
		}, function(res) {
			if (res > 0) {
				$('#usersTab').datagrid('reload');
				$('#addusersDialog').dialog("close");
				alert("新增成功!!!!")
			} else {
				alert("新增失败!!!!")
			}
		}, "json")
	} else {
		$.messager.alert("提示", "请完善您要添加的数据！！！");
	}

}
/* 删除用户 */
function del(index) {
	var datas = $("#usersTab").datagrid("getData");
	var row = datas.rows[index];
	$.messager.confirm('确认删除', '您确认想要删除吗？', function(r) {
		if (r) {
			$.post("/CrmDB/users/delUsers", {
				id : row.id
			}, function(res) {
				if (res > 0) {
					$('#usersTab').datagrid('reload');
					$.messager.alert('提示', '删除成功！！！');
				}
			}, "json")
		}
	});
}

/* 修改 */

function update1(index) {
		var data=$("#usersTab").datagrid("getData");
		var row=data.rows[index];
		//填充表单
		$("#updatefrm").form("load",row);
		//打开弹窗
		$("#update_datagrid").dialog("open");
	}
	 function update(){
		 $.post("/CrmDB/users/updateUsers",{
			 	id:$("#id1").val(),
			 	LoginName:$("#LoginName1").val(),
			 	protectEMail:$("#protectEMail1").val(),
				protectMtel:$("#protectMtel1").val(),
		 },function(res){
			 if(res>0){
				 $("#usersTab").datagrid("reload");
				 $("#update_datagrid").dialog("close");
				 alert("修改成功");
			 }else{
				 alert("修改失败");
			 }
		 },"json");
	 } 
	 
/* 是否锁定 */

 function formatterIslocakout(value,row,index){

		return row.isLockout==1?'未锁定':'锁定';
		

	}
	function suoding(value,row,index){
		return '<a href="javascript:void(0)" class="easyui-linkbutton"  onclick="suodingYonghu('+index+')">锁定用户</a>   <a href="javascript:void(0)" class="easyui-linkbutton"  onclick="jiesuoYonghu('+index+')">解锁用户 </a>'
	}
	function juesefenpei(value,row,index){
		return '<a href="javascript:void(0)" class="easyui-linkbutton"  onclick="juese('+index+')">角色设置</a>'
	}
	
	function suodingYonghu(index){
		var id=$("#usersTab").datagrid('getData').rows[index].id;
		var isLockOut=$("#usersTab").datagrid('getData').rows[index].isLockout; 
		if(isLockOut == 1){ 
			$.post("/CrmDB/users/openCloseUser",{
				id:id,
				IsLockout:2
			},function(res){
				if(res>0){
					$('#usersTab').datagrid('reload');  
					$.messager.alert("提示","用户锁定成功");
				}else{
					$.messager.alert("提示","该用户锁定失败");
				}
			})
		}else{
			alert("该用户已被锁定")
		}
		
	}
	function jiesuoYonghu(index){
		var id=$("#usersTab").datagrid('getData').rows[index].id;
		var isLockOut=$("#usersTab").datagrid('getData').rows[index].isLockout;
		if(isLockOut==2){
			$.post("/CrmDB/users/openCloseUser",{id:id,IsLockout:1},function(res){
				if(res>0){
					$('#usersTab').datagrid('reload');  
					$.messager.alert("提示","用户解锁成功");
				}else{
					$.messager.alert("提示","解锁失败");
				}
			})
		}else{
			alert("该用户未被锁定")
		}
		
	} 
/* 	角色设置 */
function juese(index) {
		var data=$("#usersTab").datagrid("getData");
		var row=data.rows[index];
		//填充表单
		$("#juesefrm").form("load",row);
		//打开弹窗
		$("#juese_datagrid").dialog("open");
	}
function closejuese(){
	$("#juese_datagrid").dialog("close");
}
</script>
</head>
<body>
	
	<table id="usersTab">
		<thead>
			<tr>
				<th data-options="field:'id',title:'编号'"></th>
				<th data-options="field:'loginName',title:'登录名'"></th>
				<th data-options="field:'password',title:'密码'"></th>
				<th data-options="field:'isLockout',title:'是否锁定',formatter:formatterIslocakout"></th>
				<th data-options="field:'lastLoginTime',title:'最后一次登录时间'"></th>
				<th data-options="field:'createTime',title:'账户创立时间'"></th>
				<th data-options="field:'lockTime',title:'被锁定时间'"></th>
				<th data-options="field:'psdWrongTime',title:'密码错误次数'"></th>
				<th data-options="field:'protectEMail',title:'密保邮箱'"></th>
				<th data-options="field:'protectMtel',title:'密保手机号'"></th>
				<th data-options="field:'suoding',formatter:suoding,title:'账号锁定'"></th>
				<th data-options="field:'jues',formatter:juesefenpei,title:'角色分配'"></th>
				<th data-options="field:'caozuo',title:'操作',formatter:formatterCaozuo"></th>
				
			</tr>
		</thead>
	</table>
	
	
	<!-- 多条件查询 -->
	<div id="toobar">
		<form>
		 <label for="name">用户名:</label> 
            	<input class="easyui-validatebox" type="text" id="LoginName"  /> 
         <label for="name">创建起止时间:</label> 
            	<input class="easyui-datetimebox" type="text" id="StartcreateTime"  /> 
		 <label for="name">创建结束时间:</label> 
				<input class="easyui-datetimebox" type="text" id="EndcreateTime" /> 
		 <label for="name">锁定状态:</label>
			 <select id="IsLockout" class="easyui-combobox"  style="width:200px;">   
			    <option value="" >--请选择--</option>   
			    <option value="2">锁定</option>   
			    <option value="1">未锁定</option>   
			</select> 
		<a href="javascript:void(0)" onclick="initUser()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">搜索</a> 
		<a href="javascript:void(0)" onclick="add()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>
		</form>
	
	</div>
	
	<!-- 添加用户信息 -->
	<div id="addusersDialog" class="easyui-dialog"
		data-options="modal:true,closed:true">
		<form id="addusersFrm" class="easyui-form">
			<table>
				<tr>
					<td><label for="name">登录名:</label></td>
					<td><input class="easyui-validatebox" type="text"
						id="LoginName" name="LoginName" data-options="required:true" /></td>
				</tr>
				<tr>
					<td><label for="name">密码:</label></td>
					<td><input class="easyui-validatebox" type="text"
						id="Password" name="Password" data-options="required:true" /></td>
				</tr>
				<tr>
					<td><label for="name">是否锁定:</label></td>
					<td><input class="easyui-validatebox" type="text"
						id="IsLockout" name="IsLockout" data-options="required:true" /></td>
				</tr>
				<tr>
					<td><label for="name">最后一次登陆时间:</label></td>
					<td><input class="easyui-datetimebox" type="text"
						id="LastLoginTime" name="LastLoginTime"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<td><label for="name">账户创建时间:</label></td>
					<td><input class="easyui-datetimebox" type="text"
						id="CreateTime" name="CreateTime" data-options="required:true" /></td>
				</tr>
				
				<tr>
					<td><label for="name">被锁定时间:</label></td>
					<td><input class="easyui-datetimebox" type="text"
						id="LockTime" name="LockTime" data-options="required:true" /></td>
				</tr>
				<tr>
					<td><label for="name">密码错误次数:</label></td>
					<td><input class="easyui-validatebox" type="text"
						id="PsdWrongTime" name="PsdWrongTime" data-options="required:true" /></td>
				</tr>
				<tr>
					<td><label for="name">密保邮箱:</label></td>
					<td><input class="easyui-validatebox" type="text"
						id="ProtectEMail" name="ProtectEMail" data-options="required:true" /></td>
				</tr>
				<tr>
					<td><label for="name">密保手机号:</label></td>
					<td><input class="easyui-validatebox" type="text"
						id="ProtectEMail" name="ProtectEMail" data-options="required:true" /></td>
				</tr>
				<tr>
					<td><a href="javascript:void(0)" class="easyui-linkbutton"
						onclick="addUsersSubmit()">提交</a></td>
					<td><a href="javascript:void(0)" class="easyui-linkbutton"
						onclick="addUsersClose()">取消</a></td>
				</tr>
			</table>
		</form>

	</div>
	
	<!-- 修改 -->
	 <div id="update_datagrid" class="easyui-dialog" data-options="modal:true,closed:true">
		<form id="updatefrm">
			<label for="name">编号:</label>   
            <input class="easyui-validatebox" type="text" id="id1" name="id" disabled="disabled" />
            <label for="name">登录名:</label>   
            <input class="easyui-validatebox" type="text" id="loginName1" name="loginName" disabled="disabled" /> 
           
             <label for="name">密保邮箱:</label>   
            <input class="easyui-validatebox" type="text" id="protectEMail1" name="protectEMail" />
            <label for="name">密保手机号:</label>   
            <input class="easyui-validatebox" type="text" id="protectMtel1" name="protectMtel" />
		</form>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="update()">提交</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="close1()">取消</a>
	</div>
	
	<!-- 角色设置-->
	 <div id="juese_datagrid" class="easyui-dialog" data-options="modal:true,closed:true">
		<form id="juesefrm">
           <label for="name">角色:</label>
			 <select id="IsLockout" class="easyui-combobox"  style="width:200px;">   
			    <option value="" >--请选择--</option>   
			    <option value="2">锁定</option>   
			    <option value="1">未锁定</option>   
			</select>  
		</form>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="updatejuese()">提交</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closejuese()">取消</a>
	</div>
	
</body>
</html>