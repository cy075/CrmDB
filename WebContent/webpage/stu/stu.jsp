<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="../../js/global.js"></script>
<script type="text/javascript" src="../../js/jquery-easyui-1.4.3/datagrid-export.js"></script>
<script type="text/javascript">
/* 查询所有学生 */
	$(function(){
		init();
	})
	function init(){
		$("#StuTab").datagrid({    
			url:"/CrmDB/getStu",
			method:"post",
			pagination:true,
			singleSelect:true,
			 toolbar : "#tabBar", 
			queryParams: {
				stuname: $("#stuname").val(),
				stuphone: $("#stuphone").val(),
				stuqq: $("#stuqq").val(),
				stuziXunName: $("#stuziXunName").val(),
				stucreateTime: $("#stucreateTime").datetimebox('getValue'),
				 stuisPay: $("#stuisPay").combobox("getValue"),
				 stuisValid: $("#stuisValid").combobox("getValue"),
				stuisReturnVist: $("#stuisReturnVist").combobox("getValue")
				 
				
			} 
		})
	}
	function formatterCaozuo(value,row,index){
		return "<a href='javascript:void(0)' onclick='updateStu1("+index+")'>编辑</a>   <a href='javascript:void(0)' onclick='delStu("+index+")'>删除</a>"
	} 
	
	function closeStu1(){
		$("#update_datagrid").dialog("close");
	}
	
	function closeaddStu(){
		$("#add_datagrid").dialog("close");
	}
	
/* 修改 */

 function updateStu1(index) {
		alert(99)
		var data=$("#StuTab").datagrid("getData");
		var row=data.rows[index];
		//填充表单
		$("#updatefrm").form("load",row);
		//打开弹窗
		$("#update_datagrid").dialog("open");
	}
	 function updateStu(){
		 $.post("/CrmDB/updateStu",{
			 	id:$("#id1").val(),
			 	name:$("#name1").val(),
				sex: $("#sex1").combobox("getValue"),
				age:$("#age1").val(),
				phone:$("#phone1").val(),
				status:$("#status1").combobox("getValue"),
				state:$("#state1").val(),
				msgSource:$("#msgSource1").val(),
				sourceUrl:$("#sourceUrl1").val(),
				sourceKeyWorld:$("#sourceKeyWorld1").val(),
				address:$("#address1").val(),
				qq:$("#qq1").val(),
				weixin:$("#weixin1").val(),
				content:$("#content1").val(),
				createTime:$("#createTime1").datetimebox('getValue'),
				learnForward:$("#learnForward1").val(),
				isValid: $("#isValid1").combobox("getValue"),
				record:$("#record1").val(),
				isReturnVist: $("#isReturnVist1").combobox("getValue"),
				firstVistTime:$("#firstVistTime1").datetimebox('getValue'),
				isHome: $("#isHome1").combobox("getValue"),
				homeTime:$("#homeTime1").datetimebox('getValue'),
				lostValid:$("#lostValid1").val(),
				isPay: $("#isPay1").combobox("getValue"),
				payTime:$("#payTime1").datetimebox('getValue'),
				money:$("#money1").val(),
				isReturnMoney: $("#isReturnMoney1").combobox("getValue"),
				isInClass: $("#isInClass1").combobox("getValue"),
				inClassTime:$("#inClassTime1").datetimebox('getValue'),
				inClassContent:$("#inClassContent1").val(),
				askerContent:$("#askerContent1").val(),
				isDel: $("#isDel1").combobox("getValue"),
				formPart:$("#formPart1").val(),
				concern:$("#concern1").val(),
				isBaoBei:$("#isBaoBei1").combobox("getValue"),
				ziXunName:$("#ziXunName1").val(),
				createUser:$("#createUser1").val(),
				returnMoneyReason:$("#returnMoneyReason1").val(),
				preMoney:$("#preMoney1").val(),
				preMoneyTime:$("#preMoneyTime1").datetimebox('getValue')
		 },function(res){
			 if(res>0){
				 $("#StuTab").datagrid("reload");
				 $("#update_datagrid").dialog("close");
				 alert("修改成功");
			 }else{
				 alert("修改失败");
			 }
		 },"json");
	 }
	 
/* 删除 */
	  function  delStu(index) {
		 var data=$("#StuTab").datagrid("getData");
		 var row=data.rows[index];
		 $.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
			    if (r){ 
			    	$.post("/CrmDB/delStu",{
			    		id:row.id
			    	},function(res){
			    		if(res>0){
			    			 $("#StuTab").datagrid("reload");
			    			 $.messager.alert("提示","删除成功")
			    		}
			    	},"json");
			    }    
			});
	 } 
	
/* 添加 */
	 function add() {
			//打开弹窗
			$("#add_datagrid").dialog("open");
	}
	
	function addStu() {
		
		$.post("/CrmDB/addStu",{
			name:$("#name2").val(),
			sex:$("#sex2").combobox("getValue"),
			age:$("#age2").val(),
			phone:$("#phone2").val(),
			status:$("#status2").combobox("getValue"),
			state:$("#state2").val(),
			msgSource:$("#msgSource2").val(),
			sourceUrl:$("#sourceUrl2").val(),
			sourceKeyWorld:$("#sourceKeyWorld2").val(),
			address:$("#address2").val(),
			askerId:$("#askerId2").val(),
			qq:$("#qq2").val(),
			weixin:$("#weixin2").val(),
			content:$("#content2").val(),
			createTime:$("#createTime2").datetimebox('getValue'),
			learnForward:$("#learnForward2").val(),
			isValid: $("#isValid2").combobox("getValue"),
			record:$("#record2").val(),
			isReturnVist:$("#isReturnVist2").combobox("getValue"),
			firstVistTime:$("#firstVistTime2").datetimebox('getValue'),
			isHome:$("#isHome2").val(),
			homeTime:$("#homeTime2").datetimebox('getValue'),
			lostValid:$("#lostValid2").val(),
			isPay:$("#isPay2").combobox("getValue"),
			payTime:$("#payTime2").datetimebox('getValue'),
			money:$("#money2").val(),
			isReturnMoney:$("#isReturnMoney2").combobox("getValue"),
			isInClass:$("#isInClass2").combobox("getValue"),
			inClassTime:$("#inClassTime2").datetimebox('getValue'),
			inClassContent:$("#inClassContent2").val(),
			askerContent:$("#askerContent2").val(),
			isDel: $("#isDel2").combobox("getValue"),
			formPart:$("#formPart2").val(),
			concern:$("#concern2").val(),
			isBaoBei:$("#isBaoBei2").combobox("getValue"),
			ziXunName:$("#ziXunName2").val(),
			createUser:$("#createUser2").val(),
			returnMoneyReason:$("#returnMoneyReason2").val(),
			preMoney:$("#preMoney2").val(),
			preMoneyTime:$("#preMoneyTime2").datetimebox('getValue')
		},function(res){
			if(res>0){
				 $("#StuTab").datagrid("reload");
				 $("#add_datagrid").dialog("close");
				 alert("添加成功");
			}else{
				alert("添加失败");
				}
		},"json");
	}
	function closeStu() {
		 $("#add_datagrid").dialog("close");
	}
	 
	 
	//导出excel
	function exportExcel(){

		$('#StuTab').datagrid('toExcel','dg.xls');	// export to excel
	} 
	
</script>
</head>
<body>
<!-- 多条件查询 -->
 <div id="toobar">
	<div id="tabBar">
			名称:<input type="text" class="easyui-textbox" id="stuname" />
			电话：<input class="easyui-textbox" type="text" id="stuphone" >
			咨询师：<input class="easyui-textbox" type="text" id="stuziXunName" >
			QQ：<input type="text" class="easyui-textbox" id="stuqq" >
			创建时间：<input type="text" class="easyui-datetimebox" id="stucreateTime" >
		
			是否缴费： <select id="stuisPay" class="easyui-combobox"  name="是否缴费">   
			    <option value="" >--请选择--</option>   
			    <option value="已缴费">已缴费</option>   
			    <option value="未缴费">未缴费</option>   
			</select> 
			 是否上报：<select id="stuisValid" class="easyui-combobox" name="是否上报">   
			    <option value="">---请选择---</option>   
			    <option value="已上报">已上报</option>   
			    <option value="未上报">未上报</option>   
			</select>
			是否回访：<select id="stuisReturnVist" class="easyui-combobox" name="是否回访">   
			    <option value="">---请选择---</option>   
			    <option value="已回访">已回访</option>   
			    <option value="未回访">未回访</option>   
			</select> 
			<a href="javascript:void(0)" onclick="init()"	class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</a>
			<a href="javascript:void(0)" onclick="add()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>
			<a class="easyui-linkbutton" plain="true" onclick="exportExcel()" id="serach" data-options="iconCls:'icon-print'">导出excel</a>
</div> 
			
	</div>
<!-- 查询所有信息 -->
	 <table id="StuTab" class="easyui-datagrid">
		<thead>
			<tr>
				  <th data-options="field:'id',title:'编号'">编号</th>  
				  <th data-options="field:'name',title:'学生姓名'">学生姓名</th>  
				  <th data-options="field:'sex',title:'性别'">性别</th> 
				   <th data-options="field:'age',title:'年龄'">年龄</th>  
				  <th data-options="field:'phone',title:'电话'">电话</th>  
				  <th data-options="field:'status',title:'学历'">学历</th>  
				  <th data-options="field:'state',title:'状态'">状态</th>  
				  <th data-options="field:'msgSource',title:'来源渠道'">来源渠道</th>  
				  <th data-options="field:'sourceUrl',title:'来源网站'">来源网站</th>  
				  <th data-options="field:'sourceKeyWorld',title:'来源关键词'">来源关键词</th>  
				  <th data-options="field:'address',title:'地址'">地址</th>  
				  <th data-options="field:'askerName',title:'发布者'">发布者</th>  
				  <th data-options="field:'qq',title:'学员QQ'">学员QQ</th>  
				  <th data-options="field:'weixin',title:'学员微信'">学员微信</th>  
				  <th data-options="field:'content',title:'内容'">内容</th>  
				  <th data-options="field:'createTime',title:'创建时间'">创建时间</th>  
				  <th data-options="field:'learnForward',title:'来源部门'">来源部门</th>  
				  <th data-options="field:'isValid',title:'是否上报'">是否上报</th>  
				  <th data-options="field:'record',title:'课程方向'">课程方向</th>  
				  <th data-options="field:'isReturnVist',title:'是否回访'">是否回访</th>  
				  <th data-options="field:'firstVistTime',title:'第一次回访时间'">第一次回访时间</th>  
				  <th data-options="field:'isHome',title:'是否上门'">是否上门</th>  
				  <th data-options="field:'homeTime',title:'上门时间'">上门时间</th>  
				  <th data-options="field:'lostValid',title:'无效原因'">无效原因</th>  
				  <th data-options="field:'isPay',title:'是否缴费'">是否缴费</th>  
				  <th data-options="field:'payTime',title:'缴费时间'">缴费时间</th>  
				  <th data-options="field:'money',title:'金额'">金额</th>  
				  <th data-options="field:'isReturnMoney',title:'是否退费'">是否退费</th>  
				  <th data-options="field:'isInClass',title:'是否进班'">是否进班</th>  
				  <th data-options="field:'inClassTime',title:'进班时间'">进班时间</th>  
				  <th data-options="field:'inClassContent',title:'进班备注'">进班备注</th>  
				  <th data-options="field:'askerContent',title:'退费原因'">退费原因</th>  
				  <th data-options="field:'isDel',title:'是否删除'">是否删除</th>
				  <th data-options="field:'formPart',title:'来源部门'">来源部门</th> 
				  <th data-options="field:'concern',title:'影响'">影响</th> 
				  <th data-options="field:'isBaoBei',title:'是否报备'">是否报备</th>   
				  <th data-options="field:'ziXunName',title:'咨询师姓名'">咨询师姓名</th>  
				  <th data-options="field:'createUser',title:'录入人员'">录入人员</th>  
				  <th data-options="field:'returnMoneyReason',title:'退费原因'">退费原因</th>
				   <th data-options="field:'preMoney',title:'定金金额'">定金金额</th>
				  <th data-options="field:'preMoneyTime',title:'定金时间'">定金时间</th>  
				  
				  <th data-options="field:'caozuo',title:'操作',formatter:formatterCaozuo"></th>
			</tr>
		</thead>
	</table> 
	
	
 <!-- 修改 -->
	<div id="update_datagrid" class="easyui-dialog" data-options="modal:true,closed:true">
		<form id="updatefrm">
			<label for="name">编号:</label>   
            <input class="easyui-validatebox" type="text" id="id1" name="id" disabled="disabled" />
            <label for="name">学生姓名:</label>   
            <input class="easyui-validatebox" type="text" id="name1" name="name" /> 
            <label for="name">性别:</label>   
            <select id="sex1" class="easyui-combobox" name="sex">   
			    <option value="">---请选择---</option>   
			    <option value="男">男</option>   
			    <option value="女">女</option>   
			</select>
            <label for="name">年龄:</label>   
            <input class="easyui-validatebox" type="text" id="age1" name="age"/> <br>
            <label for="name">电话:</label>   
            <input class="easyui-validatebox" type="text" id="phone1" name="phone" />
            <label for="name">学历:</label>   
             <select id="status1" class="easyui-combobox" name="status">   
			    <option value="">---请选择---</option>  
			    <option value="小学">小学</option>   
			    <option value="初中">初中</option>   
			    <option value="高中">高中</option>
			    <option value="中专">中专</option> 
			    <option value="大专">大专</option>    
			    <option value="本科">本科</option>
			    <option value="硕士">硕士</option>
			    <option value="研究生">研究生</option>   
			</select>
            <label for="name">状态:</label>   
            <input class="easyui-validatebox" type="text" id="state1" name="state"/> <br>
            <label for="name">来源渠道:</label>   
            <input class="easyui-validatebox" type="text" id="msgSource1" name="msgSource"/> 
			<label for="name">来源关键词:</label>   
            <input class="easyui-validatebox" type="text" id="sourceKeyWorld1" name="sourceKeyWorld" />
            <label for="name">地址:</label>   
            <input class="easyui-validatebox" type="text" id="address1" name="address" /> <br>
            <label for="name">qq:</label>   
            <input class="easyui-validatebox" type="text" id="qq1" name="qq" /> <br>
            <label for="name">微信:</label>   
            <input class="easyui-validatebox" type="text" id="weixin1" name="weixin" /> 
            <label for="name">内容:</label>   
            <input class="easyui-validatebox" type="text" id="content1" name="content" /> 
            <label for="name">创建时间:</label>   
            <input class="easyui-datetimebox" type="text" id="createTime1" name="createTime" /> <br>
            <label for="name">来源部门:</label>   
            <input class="easyui-validatebox" type="text" id="learnForward1" name="learnForward" /> 
            <label for="name">是否上报:</label>   
        	<select id="isValid1" class="easyui-combobox" name="isValid">   
			    <option value="">---请选择---</option>   
			    <option value="已上报">已上报</option>   
			    <option value="未上报">未上报</option>   
			</select>
            <label for="name">课程方向:</label>   
            <input class="easyui-validatebox" type="text" id="record1" name="record" /> <br>
            <label for="name">是否回访:</label>   
            <select id="isReturnVist1" class="easyui-combobox" name="isReturnVist">   
			    <option value="">---请选择---</option>   
			    <option value="已回访">已回访</option>   
			    <option value="未回访">未回访</option>   
			</select> 
            <label for="name">第一次回访时间:</label>   
            <input class="easyui-datetimebox" type="text" id="firstVistTime1" name="firstVistTime" />
            <label for="name">是否上门:</label>   
            <select id="isHome1" class="easyui-combobox" name="isHome">   
			    <option value="">---请选择---</option>   
			    <option value="已上门">已上门</option>   
			    <option value="未上门">未上门</option>   
			</select> 
             <label for="name">上门时间:</label>   
            <input class="easyui-datetimebox" type="text" id="homeTime1" name="homeTime" />
             <label for="name">无效原因:</label>   
            <input class="easyui-validatebox" type="text" id="lostValid1" name="lostValid" /> 
             <label for="name">是否缴费:</label>   
          	  <select id="isPay1" class="easyui-combobox"  name="isPay">   
			    <option value="" >--请选择--</option>   
			    <option value="已缴费">已缴费</option>   
			    <option value="未缴费">未缴费</option>   
			</select> 
             <label for="name">缴费时间:</label>   
            <input class="easyui-datetimebox" type="text" id="payTime1" name="payTime" />
             <label for="name">金额:</label>   
            <input class="easyui-validatebox" type="text" id="money1" name="money" />
             <label for="name">是否退费:</label>   
            <select id="isReturnMoney1" class="easyui-combobox" name="isReturnMoney">   
			    <option value="">---请选择---</option>   
			    <option value="已退费">已退费</option>   
			    <option value="未退费">未退费</option>   
			</select> 
             <label for="name">是否进班:</label>   
            <select id="isInClass1" class="easyui-combobox" name="isInClass">   
			    <option value="">---请选择---</option>   
			    <option value="已进班">已进班</option>   
			    <option value="未进班">未进班</option>   
			</select>
             <label for="name">进班时间:</label>   
            <input class="easyui-datetimebox" type="text" id="inClassTime1" name="inClassTime" />
            <label for="name">进班备注:</label>   
            <input class="easyui-validatebox" type="text" id="inClassContent1" name="inClassContent" /> <br>
            <label for="name">退费原因:</label>   
            <input class="easyui-validatebox" type="text" id="askerContent1" name="askerContent" /> 
            <label for="name">是否删除:</label>   
            <select id="isDel1" class="easyui-combobox" name="isDel">   
			    <option value="">---请选择---</option>   
			    <option value="已删除">已删除</option>   
			    <option value="未删除">未删除</option>   
			</select>
            <label for="name">来源部门:</label>   
            <input class="easyui-validatebox" type="text" id="formPart1" name="formPart" /> <br>
            <label for="name">影响:</label>   
            <input class="easyui-validatebox" type="text" id="concern1" name="concern" /> 
            <label for="name">是否报备:</label>   
            <select id="isBaoBei1" class="easyui-combobox" name="isBaoBei">   
			    <option value="">---请选择---</option>   
			    <option value="已报备">已报备</option>   
			    <option value="未报备">未报备</option>   
			</select>
            <label for="name">咨询师姓名:</label>   
            <input class="easyui-validatebox" type="text" id="ziXunName1" name="ziXunName" /> <br>
            <label for="name">录入人员:</label>   
            <input class="easyui-validatebox" type="text" id="createUser1" name="createUser" /> 
            <label for="name">退费原因:</label>   
            <input class="easyui-validatebox" type="text" id="returnMoneyReason1" name="returnMoneyReason" /> 
            <label for="name">定金金额:</label>   
            <input class="easyui-validatebox" type="text" id="preMoney1" name="preMoney" /> <br>
            <label for="name">定金时间:</label>   
            <input class="easyui-datetimebox" type="text" id="preMoneyTime1" name="preMoneyTime" /> <br>
            
		</form>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="updateStu()">提交</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeStu1()">取消</a>
	</div>
	
<!-- 添加 -->
	 <div id="add_datagrid" class="easyui-dialog" data-options="modal:true,closed:true">
		<form id="addfrm">
			
            <label for="name">学生姓名:</label>   
            <input class="easyui-validatebox" type="text" id="name2" name="name" /> 
            <label for="name">性别:</label>   
            <select id="sex2" class="easyui-combobox" name="sex">   
			    <option value="">---请选择---</option>   
			    <option value="男">男</option>   
			    <option value="女">女</option>   
			</select>
            <label for="name">年龄:</label>   
            <input class="easyui-validatebox" type="text" id="age2" name="age"/> <br>
            <label for="name">电话:</label>   
            <input class="easyui-validatebox" type="text" id="phone2" name="phone" />
            <label for="name">学历:</label>   
           <select id="status2" class="easyui-combobox" name="status">   
			    <option value="">---请选择---</option>  
			    <option value="小学">小学</option>   
			    <option value="初中">初中</option>   
			    <option value="高中">高中</option>
			    <option value="中专">中专</option> 
			    <option value="大专">大专</option>    
			    <option value="本科">本科</option>
			    <option value="硕士">硕士</option>
			    <option value="研究生">研究生</option>   
			</select>
            <label for="name">状态:</label>   
            <input class="easyui-validatebox" type="text" id="state2" name="state"/> <br>
            <label for="name">来源渠道:</label>   
            <input class="easyui-validatebox" type="text" id="msgSource2" name="msgSource"/> 
			<label for="name">来源关键词:</label>   
            <input class="easyui-validatebox" type="text" id="sourceKeyWorld2" name="sourceKeyWorld" />
            <label for="name">地址:</label>   
            <input class="easyui-validatebox" type="text" id="address2" name="address" /> <br>
           <!--  <label for="name">推销者id:</label>   
            <input class="easyui-validatebox" type="text" id="netPusherId2" name="netPusherId" />  -->
            <label for="name">发布者:</label>   
            <input class="easyui-validatebox" type="text" id="askerId2" name="askerId" value="${loginUser.id}" /> 
            <label for="name">qq:</label>   
            <input class="easyui-validatebox" type="text" id="qq2" name="qq" /> <br>
            <label for="name">微信:</label>   
            <input class="easyui-validatebox" type="text" id="weixin2" name="weixin" /> 
            <label for="name">内容:</label>   
            <input class="easyui-validatebox" type="text" id="content2" name="content" /> 
            <label for="name">创建时间:</label>   
            <input class="easyui-datetimebox" type="text" id="createTime2" name="createTime" /> <br>
            <label for="name">来源部门:</label>   
            <input class="easyui-validatebox" type="text" id="learnForward2" name="learnForward" /> 
            <label for="name">是否上报:</label>   
            <select id="isValid2" class="easyui-combobox" name="isValid">   
			    <option value="">---请选择---</option>   
			    <option value="已上报">已上报</option>   
			    <option value="未上报">未上报</option>   
			</select>
            <label for="name">课程方向:</label>   
            <input class="easyui-validatebox" type="text" id="record2" name="record" /> <br>
            <label for="name">是否回访:</label>   
             <select id="isReturnVist2" class="easyui-combobox" name="isReturnVist">   
			    <option value="">---请选择---</option>   
			    <option value="已回访">已回访</option>   
			    <option value="未回访">未回访</option>   
			</select> 
            <label for="name">第一次回访时间:</label>   
            <input class="easyui-datetimebox" type="text" id="firstVistTime2" name="firstVistTime" />
            <label for="name">是否上门:</label>   
           <select id="isHome2" class="easyui-combobox" name="isHome">   
			    <option value="">---请选择---</option>   
			    <option value="已上门">已上门</option>   
			    <option value="未上门">未上门</option>   
			</select> 
             <label for="name">上门时间:</label>   
            <input class="easyui-datetimebox" type="text" id="homeTime2" name="homeTime" />
             <label for="name">无效原因:</label>   
            <input class="easyui-validatebox" type="text" id="lostValid2" name="lostValid" /> 
             <label for="name">是否缴费:</label>   
             <select id="isPay2" class="easyui-combobox"  name="isPay">   
			    <option value="" >--请选择--</option>   
			    <option value="已缴费">已缴费</option>   
			    <option value="未缴费">未缴费</option>   
			</select> 
             <label for="name">缴费时间:</label>   
            <input class="easyui-datetimebox" type="text" id="payTime2" name="payTime" />
             <label for="name">金额:</label>   
            <input class="easyui-validatebox" type="text" id="money2" name="money" />
             <label for="name">是否退费:</label>   
            <select id="isReturnMoney2" class="easyui-combobox" name="isReturnMoney">   
			    <option value="">---请选择---</option>   
			    <option value="已退费">已退费</option>   
			    <option value="未退费">未退费</option>   
			</select> 
             <label for="name">是否进班:</label>   
             <select id="isInClass2" class="easyui-combobox" name="isInClass">   
			    <option value="">---请选择---</option>   
			    <option value="已进班">已进班</option>   
			    <option value="未进班">未进班</option>   
			</select>
             <label for="name">进班时间:</label>   
            <input class="easyui-datetimebox" type="text" id="inClassTime2" name="inClassTime" />
            <label for="name">进班备注:</label>   
            <input class="easyui-validatebox" type="text" id="inClassContent2" name="inClassContent" /> <br>
            <label for="name">退费原因:</label>   
            <input class="easyui-validatebox" type="text" id="askerContent2" name="askerContent" /> 
            <label for="name">是否删除:</label>   
            <select id="isDel2" class="easyui-combobox" name="isDel">   
			    <option value="">---请选择---</option>   
			    <option value="已删除">已删除</option>   
			    <option value="未删除">未删除</option>   
			</select> 
            <label for="name">来源部门:</label>   
            <input class="easyui-validatebox" type="text" id="formPart2" name="formPart" /> <br>
            <label for="name">影响:</label>   
            <input class="easyui-validatebox" type="text" id="concern2" name="concern" /> 
            <label for="name">是否报备:</label>   
             <select id="isBaoBei2" class="easyui-combobox" name="isBaoBei">   
			    <option value="">---请选择---</option>   
			    <option value="已报备">已报备</option>   
			    <option value="未报备">未报备</option>   
			</select>
            <label for="name">咨询师姓名:</label>   
            <input class="easyui-validatebox" type="text" id="ziXunName2" name="ziXunName" /> <br>
            <label for="name">录入人员:</label>   
            <input class="easyui-validatebox" type="text" id="createUser2" name="createUser" /> 
            <label for="name">退费原因:</label>   
            <input class="easyui-validatebox" type="text" id="returnMoneyReason2" name="returnMoneyReason" /> 
            <label for="name">定金金额:</label>   
            <input class="easyui-validatebox" type="text" id="preMoney2" name="preMoney" /> <br>
            <label for="name">定金时间:</label>   
            <input class="easyui-datetimebox" type="text" id="preMoneyTime2" name="preMoneyTime" /> <br>
            
		</form>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="addStu()">提交</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeaddStu()">取消</a>
	</div>

	 
	
	
</body>
	
  
</body>
</html>