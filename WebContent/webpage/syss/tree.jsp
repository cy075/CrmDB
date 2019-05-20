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
	$(function() {
		$("#tre").tree({
			url : "http://stuapi.ysd3g.com/api/GetAllModule",
			method : "post",
			queryParams : {
				token : token
			},
			onClick : function(node) {
				$.post("http://stuapi.ysd3g.com/api/GetModuleById", {
					id : node.id,
					token : token

				}, function(res) {
					if (res.success) {
						var msg = eval("(" + res.message + ")");
						//填充进表单
						$("#frm").form("load", msg);//打开弹窗
						$("#edit-window").window("open");
					}
				}, "json")

			}

		})

	})
</script>
</head>
<body>
	<div id="usertb" style="padding: 5px; height: auto">
		<div style="margin-bottom: 5px">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-add" plain="true" onclick="add()">添加</a> <a
				href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-mini-edit" plain="true" onclick="update()">修改</a> <a
				href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-cut" plain="true" onclick="del()">删除</a>
		</div>
	</div>
	<ul class="easyui-tree" id="tre"></ul>
	<div id="edit-window" class="easyui-window"
		data-options="modal:true,closed:true"
		style="width: 200px; height: 400px;">
		<form id="frm">
			name:<input type="text" class="easyui-textbox" id="name" name="name" /><br />
			parentId:<input type="text" class="easyui-textbox" id="parentId"
				name="parentId" /><br /> url:<input type="text"
				class="easyui-textbox" id="url" name="url" /><br /> weight:<input
				type="text" class="easyui-textbox" id="weight" name="weight" /><br />
		</form>
		<a class="easyui-linkbutton" href='javascript:void(0)'
			onclick='submitForm()'>提交</a> <a class="easyui-linkbutton"
			href='javascript:void(0)' onclick='clearForm()'>取消</a>
	</div>

</body>
</html>
