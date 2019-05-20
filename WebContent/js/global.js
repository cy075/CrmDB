var globalData = {
	
	pre :"http://127.0.0.1:8080/CrmDB/",
	myToken:"3f659924-7427-4a12-9be4-da808d7b8686",
	myTheme:"black",
	
	setUserInfo:function(uid,uname,roleNames){
		window.sessionStorage.setItem("uid",uid);
		window.sessionStorage.setItem("uname",uname);
		window.sessionStorage.setItem("roleNames",roleNames);
	},
	
	getCurUid : function(){
		return window.sessionStorage.getItem("uid");
	},
	
	getCurUName:function (){
		return window.sessionStorage.getItem("uname");
	},
	
}
document.write('<link rel="stylesheet" type="text/css" href="'+globalData.pre+'js/jquery-easyui-1.4.3/themes/icon.css">');
document.write('<link rel="stylesheet" type="text/css" href="'+globalData.pre+'js/jquery-easyui-1.4.3/themes/gray/easyui.css">');
document.write('<script type="text/javascript" src="'+globalData.pre+'js/jquery-easyui-1.4.3/jquery.min.js"></script>');
document.write('<script type="text/javascript" src="'+globalData.pre+'js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>');
document.write('<script type="text/javascript" src="'+globalData.pre+'js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>');


    
    
    
    