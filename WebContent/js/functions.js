/**
 * 
 */

// 对 index.html进行验证
function checkLogin(form){
	if(form.username.value==""){
		alert("用户名不能为空！");
		form.username.focus();
		return false;
	}
	
	if(form.password.value==""){
		alert("用户密码不能为空！");
		form.password.focus();
		return false;
	}
	
//	if((form.username.value=="admin")&&(form.password.value=="123456")){
//	    return true;
//	}
//	if((form.username.value=="ascent")&&(form.password.value=="ascent")){
//		return true;
//	}
	
	return true;
}


// index登录验证方法
function checkLoginIndex(form){
	if(form.username.value==""){
		alert("用户名不能为空！");
		form.username.focus();
		return false;
	}
	
	if(form.password.value==""){
		alert("登录密码不能为空！");
		form.password.focus();
		return false;
	}
	
	if((form.username.value=="ascent")&&(form.password.value=="ascent")){
		form.action="product/products_showusers.jsp";
		return true;
	}
	if((form.username.value=="admin")&&(form.password.value=="123456")){
		form.action="product/products_showusers.jsp";
		return true;
	}
	alert("未查找到该用户！");
	return false;
}

/*//更换样式
function changeStyle(sel){
       var value = sel.options[sel.selectedIndex].value;	// 拿到sel.option[index]的值 andreas08(?).css
       // alert("value:"+value)
       var links = document.getElementById("styles");    // 拿到此时link 的值 通过ID获得。
       // alert("links:"+links);
       links.href="./css/"+value; 
    }*/


//拿到样式 并更换样式
function changeStyle(sel){
	 	var selectedStyle = "./css/andreas08(blue).css";
       var value = sel.options[sel.selectedIndex].value;
       var links = document.getElementById("styles");
       links.href="./css/"+value;
       var style = "style";
       SetCookie(style, links.href);
//       var u = "value="+links.href;
//       //alert(u);
//       document.cookie = u;
//     globalHeadStyle = links.href;
    }

//拿到cookie
function getCookie()
	{
			var c_name="value"; // 鍙橀噺鍚�
	   		if (document.cookie.length > 0) {
	        c_start = document.cookie.indexOf(c_name + "=")
	        if (c_start != -1) {
	            c_start = c_start + c_name.length + 1
	            c_end = document.cookie.indexOf(";", c_start)
	            if (c_end == -1) c_end = document.cookie.length
	            //        document.write(document.cookie.substring(c_start,c_end)+"<br>");
	            var sss= unescape(document.cookie.substring(c_start, c_end))  // 鍙栧嚭鍊�
	           var links = document.getElementById("styles");
	           links.href=sss;
	           //alert(sss)
	        }
	    }
	}
	

//设置cookie
function SetCookie(name,value){
 var Days = 0.05;    //设置保存时间 0.04为一小时  此为10分钟   1表示1天
 var exp = new Date();//new Date("December 31, 9998");
 exp.setTime(exp.getTime() + Days*24*60*60*1000);
 document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}

//拿到cookile
function getCookie(){
 var name = "style";
 var arr = document.cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
 if (arr != null) {
	  var sss = unescape(arr[2]); 
	  var links = document.getElementById("styles");
	  links.href=sss;
 	}
}

//删除cookie
function delCookie(){
	var name = "style";  // 若要使用样式需要注意id="styles"的设置
 var exp = new Date();
 exp.setTime(exp.getTime() - 1);
 var cval = getCookie(name);
 if (cval != null) document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
}

   

