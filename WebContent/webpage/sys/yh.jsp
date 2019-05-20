<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<script src="../../js/global.js"></script>
<script>
	var token = globalData.myToken;//申请到的数据密钥
	function searchUser() {
		$("#tab").datagrid({
			url : "http://stuapi.ysd3g.com/api/GetUsers",
			pagination : true,
			method : "post",
			queryParams : {
				orderBy : '',
				userName : '',
				beginDate : '',
				endDate : '',
				isLock : '',
				token : token
			}
		})
	}
	$(function() {
		searchUser()
	})

	function formatterCaozuo(value, row, index) {

		return "<a href='javascript:void(0)' onclick='edit(" + index
				+ ")'>编辑</a>  <a href='javascript:void(0)' onclick='del("
				+ index
				+ ")'>删除</a> <a href='javascript:void(0)' onclick='datile("
				+ index + ")'>查看</a>"
	}
	/*修改用户信息*/
	function edit(index) {

		var data = $("#tab").datagrid("getData");
		var row = data.rows[index];
		$("#frm").form("load", row);
		$("#edit-window").window("open");
	}

	function submitForm() {
		$.post("http://stuapi.ysd3g.com/api/UpdateUser", {
			email : "378869982@qq.com",
			mtel : "18436003856",
			LoginName : $("#LoginName").val(),
			token : token
		}, function(res) {
			if (res.success) {
				alert("修改成功");
				$("#edit-window").window("close");
				$("#tab").datagrid("reload");
			}
		}, "json")

	}

	function clearForm() {
		$("#edit-window").window("close");
	}
	/*删除用户*/
	function del(index) {
		var data = $("#tab").datagrid("getData");
		var row = data.rows[index];
		$.post("http://stuapi.ysd3g.com/api/DeleteUser", {

			uid : row.Id,
			token : token
		}, function(deleteInfo) {
			var deleteInfo = eval("(" + deleteInfo + ")");
			if (deleteInfo.success) {
				alert("删除成功");
				$("#tab").datagrid("load");
			}

		}

		);
	}

	/*添加用户*/
	function addUser() {
		$("#adduser_window").window("open");
	}

	function submitUserForm() {
		var flag = $("#adduserForm").form("validate");
		var name = $("#name").val();
		var email = $("#email").val();
		var mtel = $("#mtel").val();
		if (flag) {
			$.post("http://stuapi.ysd3g.com/api/CreateUser", {
				loginName : name,
				email : email,
				mtel : mtel,
				token : token
			},

			function(addInfo) {
				if (addInfo.success) {
					alert("新增成功");
					$("#adduser_window").window("close");
					$("#adduserForm").datagrid("reload");
				}

			}, "json");
		}

	}

	function clearUserForm() {
		$("#adduser_window").window("close");
	}

	/*查看用户信息*/
	function datile(index) {
		var data = $("#tab").datagrid("getData");
		var row = data.rows[index];
		$("#lookForm").form("load", row);
		$("#look-window").window("open");
	}

	//重置密码
	function formatterPassword(value, row, index) {
		return "<a href='javascript:void(0)' style='cursor: pointer;' onclick='resetPassword("
				+ index + ")'>重置密码</a>";
	}
	//重置密码
	function resetPassword(index) {
		$.messager.confirm('确认', '您确认要重置用户密码吗？', function(r) {
			if (r) {
				var data = $("#tab").datagrid("getData");
				var row = data.rows[index];
				var LoginName = row.LoginName;
				$.post("http://stuapi.ysd3g.com/api/ResetPassword", {
					un : LoginName,
					token : token
				}, function(res) {
					if (res.success) {
						$.messager.alert("提示", "密码重置成功！");
						$("#tab").datagrid("reload");
					}
				}, "json")
			}
		});
	}

	//锁定和解锁用户
	function formatterSuoDing(value, row, index) {
		return "<a href='javascript:void(0)' style='cursor: pointer;' onclick='lockUser("
				+ index
				+ ")'>锁定用户</a> <a href='javascript:void(0)' style='cursor: pointer;' onclick='unlockUser("
				+ index + ")'>解锁用户</a>";
	}
	//锁定用户
	function lockUser(index) {
		$.messager.confirm('确认', '您确认想要锁定用户吗？', function(r) {
			if (r) {
				var data = $("#tab").datagrid("getData");
				var row = data.rows[index];
				var LoginName = row.LoginName;
				$.post("http://stuapi.ysd3g.com/api/LockUser", {
					un : LoginName,
					token : token
				}, function(res) {
					if (res.success) {
						$.messager.alert("提示", "锁定成功！");
						$("#tab").datagrid("reload");
					}
				}, "json")
			}
		});
	}
	//解锁用户
	function unlockUser(index) {
		$.messager.confirm('确认', '您确认想要解锁用户吗？', function(r) {
			if (r) {
				var data = $("#tab").datagrid("getData");
				var row = data.rows[index];
				var LoginName = row.LoginName;
				$.post("http://stuapi.ysd3g.com/api/UnLockUser", {
					un : LoginName,
					token : token
				}, function(res) {
					if (res.success) {
						$.messager.alert("提示", "解锁成功！");
						$("#tab").datagrid("reload");
					}
				}, "json")
			}
		});
	}

	//设置角色权限
	function formatterQuanXian(value, row, index) {
		return "<a href='javascript:void(0)' style='cursor: pointer;' onclick='showRoles("
				+ index + ")'>设置权限</a>";
	}

	//打开设置权限框
	function showRoles(index) {
		$("#ToRole").window("open");
		var data = $("#tab").datagrid("getData");
		var row = data.rows[index];
		var id = row.Id;
		var LoginName = row.LoginName;
		$("#parentModulenames").text(LoginName);
		$("#juese").datagrid({
			url : 'http://stuapi.ysd3g.com/api/GetRolesAll', //数据接口的地址
			queryParams : { //要发送的参数列表
				token : token
			}
		});
		$("#User-juese").datagrid({
			url : 'http://stuapi.ysd3g.com/api/GetRoleByUserId', //数据接口的地址
			queryParams : { //要发送的参数列表
				uId : id,
				token : glbalData.myToken
			}
		});
	}
	/*多条件检索*/
	function searchs() {
		$("#tab").datagrid({
			url : 'http://stuapi.ysd3g.com/api/GetUsers', //数据接口的地址
			queryParams : { //要发送的参数列表
				token : token,
				orderBy : $("#orderBy").textbox("getValue"),
				userName : $("#userName").textbox("getValue"),
				beginDate : $("#beginDates").textbox("getValue"),
				endDate : $("#endDates").textbox("getValue"),
				isLock : $("#isLock").textbox("getValue")
			}
		});
	}
</script>
</head>

<body>

	<table id="tab" class="easyui-datagrid">
		<thead>
			<tr>
				<th data-options="field:'Id',width:280,hidden:true">用户ID</th>
				<th data-options="field:'LoginName',width:100">用户名</th>
				<th data-options="field:'ProtectEMail',width:100">邮箱</th>
				<th data-options="field:'ProtectMTel',width:100,">手机号</th>
				<th data-options="field:'IsLockout',width:60,">是否锁定</th>
				<th data-options="field:'CreateTime',width:120,">创建时间</th>
				<th data-options="field:'LastLoginTime',width:120,">最后登录的时间</th>
				<th
					data-options="field:'caozuo',width:100,formatter:formatterCaozuo">操作</th>
				<th
					data-options="field:'quanXian',width:60,formatter:formatterQuanXian">权限设置</th>
				<th
					data-options="field:'password',width:60,formatter:formatterPassword">密码设置</th>
				<th
					data-options="field:'suoDing',width:120,formatter:formatterSuoDing">锁定管理</th>
			</tr>

			<!--多条件查询-->
			<div id="usertb" style="padding: 5px; height: auto">
				<div style="margin-bottom: 5px">
					<a href="javascript:void(0)" class="easyui-linkbutton"
						iconCls="icon-add" plain="true" onclick="addUser()">添加</a> 用户名: <input
						class="easyui-textbox" type="text" id="userName"
						style="width: 80px"> 起止时间: <input class="easyui-datebox"
						id="beginDates" name="beginDates" required="true" />-<input
						class="easyui-datebox" id="endDates" name="endDates"
						required="true" /> 是否锁定: <select id="isLock"
						class="easyui-combobox" name="isLock" style="height: auto;">
						<option value="">请选择</option>
						<option value="是">是</option>
						<option value="否">否</option>
					</select> 排序: <select id="orderBy" class="easyui-combobox" name="orderBy"
						style="height: auto;">
						<option value="">请选择</option>
						<option value="CreateTime">创建时间</option>
						<option value="LastLoginTime">最后登录时间</option>
					</select> <a href="javascript:void(0)" class="easyui-linkbutton"
						iconCls="icon-search" onclick="searchs()">搜索</a>
				</div>
			</div>
		</thead>
	</table>


	<div id="edit-window" title="修改用户信息" class="easyui-window"
		data-options="modal:true,closed:true"
		style="width: 200px; height: 400px;">
		<form id="frm">
			<input type="text" class="easyui-textbox" id="LoginName"
				name="LoginName" /><br /> <input type="text"
				class="easyui-textbox" id="Id" name="Id" /><br /> <input
				type="text" class="easyui-textbox" id="CreateTime" name="CreateTime" /><br />
			<input type="text" class="easyui-textbox" id="LastLoginTime"
				name="LastLoginTime" /><br />
		</form>
		<a class="easyui-linkbutton" href='javascript:void(0)'
			onclick='submitForm()'>提交</a> <a class="easyui-linkbutton"
			href='javascript:void(0)' onclick='clearForm()()'>取消</a>
	</div>


	<div id="look-window" title="查看用户信息" class="easyui-window"
		data-options="modal:true,closed:true"
		style="width: 200px; height: 400px;">
		<form id="lookForm">
			用户名:<input type="text" class="easyui-textbox" id="LoginName"
				name="LoginName" /><br /> 邮箱:<input type="text"
				class="easyui-textbox" id="ProtectEMail" name="ProtectEMail" /><br />
			手机号:<input type="text" class="easyui-textbox" id="ProtectMTel"
				name="ProtectMTel" /><br /> 创建时间:<input type="text"
				class="easyui-textbox" id="CreateTime" name="CreateTime" /><br />
			最后登录时间:<input type="text" class="easyui-textbox" id="LastLoginTime"
				name="LastLoginTime" /><br />
		</form>

	</div>

	<div id="adduser_window" class="easyui-window" title="新增员工信息"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width: 500px; height: 300px; padding: 10px;">

		<form id="adduserForm">
			<table cellpadding="5">
				<tr>
					<td>用户名:</td>
					<td><input class="easyui-textbox" type="text" name="name"
						id="name" data-options="required:true"></input></td>
				</tr>

				<tr>
					<td>邮箱:</td>
					<td><input class="easyui-textbox" type="text" name="email"
						id="email" data-options="required:true,validType:'email'"></input></td>
				</tr>

				<tr>
					<td>手机号:</td>
					<td><input type="text" class="easyui-numberbox" id="mtel"
						name="mtel" data-options="required:true"></td>
				</tr>

			</table>
		</form>
		<div style="text-align: center; padding: 5px; float: left;">
			<a href="javascript:void(0)" class="easyui-linkbutton" type="button"
				onclick="submitUserForm()">提交</a> <a href="javascript:void(0)"
				class="easyui-linkbutton" onclick="clearUserForm()">取消</a>
		</div>
	</div>

	<!--设置权限-->
	<div id="ToRole" class="easyui-window" title="设置权限"
		style="width: 700px; height: 520px"
		data-options="iconCls:'icon-save',modal:true,closed:true">
		<div style="width: 200px; float: left;">
			<table class="easyui-datagrid" id="juese" title="系统角色列表"
				data-options="rownumbers:true,singleSelect:true,pagination:true,method:'post',pageSize:10">
				<thead>
					<tr>
						<th data-options="field:'Id',width:280,hidden:true">ID</th>
						<th data-options="field:'Name',width:100">角色名称</th>
					</tr>
				</thead>
			</table>
		</div>
		<div
			style="width: 100px; float: left; text-align: center; padding-top: 150px; padding-left: 120px;">
			您当前正在为：
			<div id="parentModulenames" style="font-size: 25px; color: red;"></div>
			设置角色权限！ <a href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-add" onclick="tianjia()">添加权限</a><br /> <a
				href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-remove" onclick="yichu()">移除权限</a>
		</div>
		<div style="width: 200px; float: right;">
			<table class="easyui-datagrid" id="User-juese" title="当前用户角色列表"
				data-options="rownumbers:true,singleSelect:true,pagination:true,method:'post',pageSize:10">
				<thead>
					<tr>
						<th data-options="field:'Id',width:280,hidden:true">ID</th>
						<th data-options="field:'Name',width:100">角色名称</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>

</body>

</html>