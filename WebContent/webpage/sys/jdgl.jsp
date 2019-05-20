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
		$("#tabs").datagrid({
			url : "http://stuapi.ysd3g.com/api/GetRolesAll",
			pagination : true,
			method : "post",
			queryParams : {
				token : token
			}
		})
	}
	$(function() {
		searchUser()
	})

	/*修改角色信息*/
	function edit(index) {
		var data = $("#tabs").datagrid("getData");
		var row = data.rows[index];
		$("#form").form("load", row);
		$("#edit-window").window("open");
	}

	function submitForm() {
		$.post("http://stuapi.ysd3g.com/api/UpdateRole", {
			roleId : $("#Id").val(),
			name : $("#Name").val(),
			token : token
		}, function(res) {
			if (res.success) {
				alert("修改成功");
				$("#edit-window").window("close");
				$("#tabs").datagrid("reload");
			}
		}, "json")

	}

	/*删除角色*/

	function del(index) {
		var data = $("#tabs").datagrid("getData");
		var row = data.rows[index];
		$.post("http://stuapi.ysd3g.com/api/DeleteRole ", {
			roleId : row.Id,
			token : token
		}, function(deleteInfo) {
			var deleteInfo = eval("(" + deleteInfo + ")");
			if (deleteInfo.success) {
				alert("删除成功");
				$("#tabs").datagrid("load");
			}
		}

		);
	}

	/*添加角色*/
	function addRole() {
		$("#addrole_window").window("open");
	}

	function submitRoleForm() {
		var flag = $("#addroleForm").form("validate");
		var Names = $("#Names").val();
		if (flag) {
			$.post("http://stuapi.ysd3g.com/api/CreateRole", {
				name : Names,
				token : token
			},

			function(addInfo) {
				if (addInfo.success) {
					alert("新增成功");
					$("#addrole_window").window("close");
					$("#addroleForm").datagrid("reload");
				}

			}, "json");
		}

	}

	function clearRoleForm() {
		$("#addrole_window").window("close");
	}

	/*查看角色信息*/

	function datile(index) {
		var data = $("#tabs").datagrid("getData");
		var row = data.rows[index];
		$("#lookForm").form("load", row);
		$("#look-window").window("open");
	}

	function formatterCaozuo(value, row, index) {

		return "<a href='javascript:void(0)' onclick='edit(" + index
				+ ")'>编辑</a>  <a href='javascript:void(0)' onclick='del("
				+ index
				+ ")'>删除</a> <a href='javascript:void(0)' onclick='datile("
				+ index + ")'>查看</a>"
	}
</script>
</head>
<body>
	<table id="tabs" class="easyui-datagrid"
		style="width: 600px; height: 600px;" title="角色管理">
		<thead>
			<tr>
				<th data-options="field:'Id',width:300">用户id</th>
				<th data-options="field:'Name',width:120">用户名</th>
				<th
					data-options="field:'caozuo',width:160,formatter:formatterCaozuo">操作</th>

			</tr>

			<div id="usertb" style="padding: 5px; height: auto">
				<div style="margin-bottom: 5px">
					<a href="javascript:void(0)" class="easyui-linkbutton"
						iconCls="icon-add" plain="true" onclick="addRole()">添加角色</a>
				</div>
			</div>
		</thead>
	</table>

	<div id="edit-window" title="修改角色信息" class="easyui-window"
		data-options="modal:true,closed:true"
		style="width: 200px; height: 400px;">
		<form id="form">
			<input type="text" class="easyui-textbox" id="Id" name="Id" /><br />
			<input type="text" class="easyui-textbox" id="Name" name="Name" /><br />
		</form>
		<a class="easyui-linkbutton" href='javascript:void(0)'
			onclick='submitForm()'>提交</a> <a class="easyui-linkbutton"
			href='javascript:void(0)' onclick='clearForm()()'>取消</a>
	</div>

	<div id="look-window" title="查看角色信息" class="easyui-window"
		data-options="modal:true,closed:true"
		style="width: 200px; height: 400px;">
		<form id="lookForm">
			用户Id:<input type="text" class="easyui-textbox" id="Id" name="Id" /><br />
			用户名:<input type="text" class="easyui-textbox" id="Name" name="Name" /><br />
		</form>
	</div>

	<div id="addrole_window" class="easyui-window" title="添加角色"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width: 500px; height: 300px; padding: 10px;">
		<form id="addroleForm">
			<table cellpadding="5">
				<tr>
					<td>用户名:</td>
					<td><input class="easyui-textbox" type="text" name="Names"
						id="Names" data-options="required:true"></input></td>
				</tr>

			</table>
		</form>
		<div style="text-align: center; padding: 5px; float: left;">
			<a href="javascript:void(0)" class="easyui-linkbutton" type="button"
				onclick="submitRoleForm()">提交</a> <a href="javascript:void(0)"
				class="easyui-linkbutton" onclick="clearRoleForm()">取消</a>
		</div>
	</div>

	<!--权限设置-->
	<div id="quanxian" class="easyui-dialog"
		style="width: 300px; height: 500px"
		data-options="iconCls:'icon-save',modal:true,closed:true">
		<ul id="tre" class="easyui-tree" checkbox="true"></ul>
		<div></div>
		&nbsp;&nbsp;&nbsp; <a href="javascript:void(0)"
			class="easyui-linkbutton" iconCls="icon-ok" onclick="subimtQXfm()">提交</a>
		&nbsp;&nbsp;&nbsp; <a href="javascript:void(0)"
			class="easyui-linkbutton" iconCls="icon-cancel" onclick="exitfm()">取消</a>
	</div>
</body>
</html>
