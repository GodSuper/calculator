<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>复利计算器</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" language=javascript>
  /*function only_Point_Number(d) {          
            if (!((event.keyCode >= 48 && event.keyCode <= 57) || event.keyCode == 46 || event.keyCode ==8 ))
               {
               alert("请输入正数11");
               if(d.trim()=="1")
               $("#principal").val("");
               if(d.trim()=="2")
               $("#annualRate").val("");
               if(d.trim()=="3")
                $("#compoundAmount").val("");
               event.returnValue = true;
               }
               
            
                            
        }*/
       
       /* function only_Point_Number(d) {    
        var t=/^\d+(\.\d+)?$/; 
if(t.test(d.value)!=true)
{
alert("请输入数字");
d.val("");
}
}*/
       /*
        function only_Point_zhengNumber() {          
            if (!((event.keyCode >= 48 && event.keyCode <= 57) || event.keyCode == 46||event.keyCode ==8))
              {
              
              alert("请输入正整数");
               $("#year").val("");
               event.returnValue = false;
               }
        }
        */
        
  /*判断只能输入数字  */
/*function onlyNum()
{
if(!((event.keyCode>=48&&event.keyCode<=57)||(event.keyCode>=96&&event.keyCode<=105)||(event.keyCode==8)))
//考虑小键盘上的数字键
{
alert("请输入数字");
event.returnvalue=false;
//this.Text=null;
}
}*/
// function onCheck()
// {
// var compoundAmount=$("#compoundAmount").val();
// var principal=$("#principal").val();
// var annualRate=$("#annualRate").val();
// var year=$("#year").val();
// if(principal.trim()=="")
 // {
// alert("请输入本金！");
// return false;
// }
// if(annualRate.trim=="")
// {
// alert("请输入报酬率");
// return false;
// }
// if(year.trim()=="")
// {
// alert("请输入年限");
// return false;
// }
// if(compoundAmount.trim()=="")
// {
// alert("请输入复利金额！");
// return false;
// }
// return true;

// }

// function check_validate1(value){
//  定义正则表达式部分
//  var reg = /^\d+$/;
//  if( value.constructor === String ){
//  var re = value.match( reg );
//  return true;
//  }
//  return false;
// }
/*重置*/
function doClear(d)
{
if(d=="1")
{

					document.all.principal.disabled = true;
					$("#principal").val("最终计算结果");
					document.all.compoundAmount.disabled = false;
					document.all.year.disabled = false;
					document.all.annualRate.disabled = false;
					$("#compoundAmount").val("");
					$("#year").val("");
					$("#annualRate").val("");
}
if(d.trim()=="2")
{
document.all.compoundAmount.disabled = true;
					$("#compoundAmount").val("最终计算结果");
					// 					document.all.compoundAmount.value = "最终计算结果";
					// 					alert(chose+"74544ff");
					document.all.principal.disabled = false;
					document.all.year.disabled = false;
					document.all.annualRate.disabled = false;
					// 					document.all.principal.value = "";
					$("#principal").val("");
					$("#year").val("");
					$("#annualRate").val("");
}
if(d=="3")
{
document.all.annualRate.disabled = true;
					$("#annualRate").val("最终计算结果");
					document.all.compoundAmount.disabled = false;
					document.all.year.disabled = false;
					document.all.principal.disabled = false;
					$("#compoundAmount").val("");
					$("#year").val("");
					$("#principal").val("");
}
if(d=="4")
{
document.all.year.disabled = true;
					$("#year").val("最终计算结果");
					document.all.compoundAmount.disabled = false;
					document.all.annualRate.disabled = false;
					document.all.principal.disabled = false;
					$("#compoundAmount").val("");
					$("#principal").val("");
					$("#annualRate").val("");
}
if(d=="5")
{
$("#benjinLabel").html("贷款本金");
					$("#fuliLabel").html("等额本息");
					document.all.compoundAmount.disabled = true;
					$("#compoundAmount").val("最终计算结果");
					document.all.year.disabled = false;
					document.all.annualRate.disabled = false;
					document.all.principal.disabled = false;
					$("#year").val("");
					$("#principal").val("");
					$("#annualRate").val("");
}
}



/*计算存入本金  */
function onBenjin()
{	
var r=/^(0\.(0[1-9]{1}|[1-9]\d?)|1(\.0{1,2})?)$/ //年利率：只能输入0-1的小数,保留小数后两位
var t=/^-?\d+\.?\d{0,2}$/; //复利金额：只能输入两位小数
var s=/^[0-9]*[1-9][0-9]*$/;//年限：只能输入正整数
if($("#annualRate").val().trim()=="")
{
alert("请输入年利率，年利率不能为空！");
return false;
}
if(r.test(annualRate.value)!=true && $("#annualRate").val().trim()!="")
{
alert("请在年利率输入框输入0-1（保留两位小数）！");
return false;
}
if($("#year").val().trim()=="")
{
alert("请输入年限，年限不能为空！");
return false;
}
if(s.test(year.value)!=true && $("#year").val().trim()!="")
{
alert("请在年限输入框输入正整数！");
return false;
}
if($("#compoundAmount").val().trim()=="")
{
alert("请输入复利金额，复利金额不能为空！");
return false;
}
if(t.test(compoundAmount.value)!=true&&$("#compoundAmount").val().trim()!="")
{
alert("请在复利金额输入框输入正数（保留两位小数）！");
return false;
}

	$.ajax({
		url:"<%=path%>/Calculator/Calculator2",
		data: {"a":1,"compoundAmount":$("#compoundAmount").val(),"year": $("#year").val(),"annualRate":$("#annualRate").val()},
		success : function(data) {
			alert("55555555555555");
			document.all.principal.disabled = true;
			$("#principal").val(data);
		}
	});
	
}

/*计算复利金额  */
function onFuli()
{
var r=/^(0\.(0[1-9]{1}|[1-9]\d?)|1(\.0{1,2})?)$/ //年利率：只能输入0-1的小数,保留小数后两位
var t=/^-?\d+\.?\d{0,2}$/; //本金：只能输入两位小数
var s=/^[0-9]*[1-9][0-9]*$/;//年限：只能输入正整数
if($("#principal").val().trim()=="")
{
alert("请输入本金,本金不能为空！");
return false;
}

if(t.test(principal.value)!=true&&$("#principal").val().trim()!="")
{
alert("请在存入本金输入框输入正数（保留两位小数）！");
return false;
}
if($("#annualRate").val().trim()=="")
{
alert("请输入年利率，年利率不能为空！");
return false;
}
if(r.test(annualRate.value)!=true && $("#annualRate").val().trim()!="")
{
alert("请在年利率输入框输入0-1（保留两位小数）！");
return false;
}

if($("#year").val().trim()=="")
{
alert("请输入年限，年限不能为空！");
return false;
}
if(s.test(year.value)!=true && $("#year").val().trim()!="")
{
alert("请在年限输入框输入正整数！");
return false;
}
	alert(11111);
	$.ajax({
		url:"<%=path%>/Calculator/Calculator2",
		data: {"a":2,"principal":$("#principal").val(),"year": $("#year").val(),"annualRate":$("#annualRate").val()},
		success : function(data) {
// 			alert("55555555555555");
			document.all.compoundAmount.disabled = true;
			$("#compoundAmount").val(data);
		}
	});
	}
	
	
	/* 计算等额本息 */
	function onDengerbenxin()
{
var r=/^(0\.(0[1-9]{1}|[1-9]\d?)|1(\.0{1,2})?)$/ //年利率：只能输入0-1的小数,保留小数后两位
var t=/^-?\d+\.?\d{0,2}$/; //本金：只能输入两位小数
var s=/^[0-9]*[1-9][0-9]*$/;//年限：只能输入正整数
if($("#principal").val().trim()=="")
{
alert("请输入贷款本金,贷款本金不能为空！");
return false;
}

if(t.test(principal.value)!=true&&$("#principal").val().trim()!="")
{
alert("请在贷款本金输入框输入正数（保留两位小数）！");
return false;
}
if($("#annualRate").val().trim()=="")
{
alert("请输入年利率，年利率不能为空！");
return false;
}
if(r.test(annualRate.value)!=true && $("#annualRate").val().trim()!="")
{
alert("请在年利率输入框输入0-1（保留两位小数）！");
return false;
}

if($("#year").val().trim()=="")
{
alert("请输入年限，年限不能为空！");
return false;
}
if(s.test(year.value)!=true && $("#year").val().trim()!="")
{
alert("请在年限输入框输入正整数！");
return false;
}
	alert(5555);
	$.ajax({
		url:"<%=path%>/Calculator/Calculator2",
		data: {"a":5,"principal":$("#principal").val(),"year": $("#year").val(),"annualRate":$("#annualRate").val()},
		success : function(data) {
// 			alert("55555555555555");
			document.all.compoundAmount.disabled = true;
			$("#compoundAmount").val(data);
		}
	});
	}
	
	/*function doCheckNum()
	{
	var a=/^0[1-9]$|^[1-9][0-9]?$|^00?\.(?:0[1-9]|[1-9][0-9]?)$|^(?:0[1-9]|[1-9][0-9]?)\.[0-9]$/;
alert("33333");
if(a.test(annualRate.value)!=true)
{
alert("请输入0-1范围内的小数");
}
	}*/
	
	/*计算年利率  */
	function onBaochoulv()
{
var t=/^-?\d+\.?\d{0,2}$/; //本金 复利金额：只能输入两位小数
var s=/^[0-9]*[1-9][0-9]*$/;//年限：只能输入正整数
if($("#principal").val().trim()=="")
{
alert("请输入本金，本金不能为空！");
return false;
}
if(t.test(principal.value)!=true&&$("#principal").val().trim()!="")
{
alert("请在存入本金输入框输入正数（保留两位小数）！");
return false;
}
if($("#year").val().trim()=="")
{
alert("请输入年限，年限不能为空！");
return false;
}
if(s.test(year.value)!=true && $("#year").val().trim()!="")
{
alert("请在年限输入框输入正整数！");
return false;
}
if($("#compoundAmount").val().trim()=="")
{
alert("请输入复利金额，复利金额不能为空！");
return false;
}
if(t.test(compoundAmount.value)!=true&&$("#compoundAmount").val().trim()!="")
{
alert("请在复利金额输入框输入正数（保留两位小数）！");
return false;
}
	alert(11111);
	$.ajax({
		url:"<%=path%>/Calculator/Calculator2",
		data: {"a":3,"principal":$("#principal").val(),"year": $("#year").val(),"compoundAmount":$("#compoundAmount").val()},
		success : function(data) {
// 			alert("55555555555555");
			document.all.annualRate.disabled = true;
			$("#annualRate").val(data);
		}
	});
	}
	
	/*计算年限  */
	function onNianxian()
{
var r=/^(0\.(0[1-9]{1}|[1-9]\d?)|1(\.0{1,2})?)$/ //年利率：只能输入0-1的小数,保留小数后两位
var t=/^-?\d+\.?\d{0,2}$/; //本金：只能输入两位小数
if($("#principal").val().trim()=="")
{
alert("请输入本金，本金不能为空！");
return false;
}
if(t.test(principal.value)!=true&&$("#principal").val().trim()!="")
{
alert("请在存入本金输入框输入正数（保留两位小数）！");
return false;
}
if($("#annualRate").val().trim()=="")
{
alert("请输入年利率，年利率不能为空！");
return false;
}
if(r.test(annualRate.value)!=true && $("#annualRate").val().trim()!="")
{
alert("请在年利率输入框输入0-1（保留两位小数）！");
return false;
}
if($("#compoundAmount").val().trim()=="")
{
alert("请输入复利金额，复利金额不能为空！");
return false;
}
if(t.test(compoundAmount.value)!=true&&$("#compoundAmount").val().trim()!="")
{
alert("请在复利金额输入框输入正数（保留两位小数）！");
return false;
}

	alert(11111);
	$.ajax({
		url:"<%=path%>/Calculator/Calculator2",
		data: {"a":4,"principal":$("#principal").val(),"compoundAmount": $("#compoundAmount").val(),"annualRate":$("#annualRate").val()},
		success : function(data) {
// 			alert("55555555555555");
			document.all.year.disabled = true;
			$("#year").val(data);
		}
	});
	}
	
	
	/*判断选择的按钮，对指定的输入框限制  */
	function doChose(chose)
	{
		$.ajax({
			url:"<%=path%>/Calculator/Calculator1?chose=" + chose,
			success : function(chose) {
				//alert(chose);
				// 				alert(chose.trim() == "1");
				if (chose.trim() == "2") {

					document.all.compoundAmount.disabled = true;
					$("#compoundAmount").val("最终计算结果");
					$("#benjinLabel").html("存入本金");
					$("#fuliLabel").html("复利终值");
					// 					document.all.compoundAmount.value = "最终计算结果";
					// 					alert(chose+"74544ff");
					document.all.principal.disabled = false;
					document.all.year.disabled = false;
					document.all.annualRate.disabled = false;
					// 					document.all.principal.value = "";
					$("#principal").val("");
					$("#year").val("");
					$("#annualRate").val("");
				} else if (chose.trim() == "1") {

					document.all.principal.disabled = true;
					$("#principal").val("最终计算结果");
					$("#benjinLabel").html("存入本金");
					$("#fuliLabel").html("复利终值");
					document.all.compoundAmount.disabled = false;
					document.all.year.disabled = false;
					document.all.annualRate.disabled = false;
					$("#compoundAmount").val("");
					$("#year").val("");
					$("#annualRate").val("");
				} else if (chose.trim() == "3") {

					document.all.annualRate.disabled = true;
					$("#annualRate").val("最终计算结果");
					$("#benjinLabel").html("存入本金");
					$("#fuliLabel").html("复利终值");
					document.all.compoundAmount.disabled = false;
					document.all.year.disabled = false;
					document.all.principal.disabled = false;
					$("#compoundAmount").val("");
					$("#year").val("");
					$("#principal").val("");
				} else if (chose.trim() == "4") {
					document.all.year.disabled = true;
					$("#year").val("最终计算结果");
					$("#benjinLabel").html("存入本金");
					$("#fuliLabel").html("复利终值");
					document.all.compoundAmount.disabled = false;
					document.all.annualRate.disabled = false;
					document.all.principal.disabled = false;
					$("#compoundAmount").val("");
					$("#principal").val("");
					$("#annualRate").val("");
				} else if (chose.trim() == "5") {
 					//var benjinLabel=$("#benjinLabel").val("贷款本金");
 					 //var fuliLabel=$("#fuliLabel").val("等额本息");
					//var benjinLabel=documdocument.getElementById("benjin");
					//benjinLabel.innerText="贷款本金";
					$("#benjinLabel").html("贷款本金");
					$("#fuliLabel").html("等额本息");
					document.all.compoundAmount.disabled = true;
					$("#compoundAmount").val("最终计算结果");
					document.all.year.disabled = false;
					document.all.annualRate.disabled = false;
					document.all.principal.disabled = false;
					$("#year").val("");
					$("#principal").val("");
					$("#annualRate").val("");
				}

			}

		});
	}
</script>

<script type="text/javascript" src="js/jquery-2.0.0.min.js"></script>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"
	type="text/css"></link>
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css"
	type="text/css">
</link>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>

<body background="<%=path %>/image/ssss.jpg" style="font-family: cursive;">
	<!-- 标题 start-->
	<nav class="navbar navbar-inverse">

	<div class="container">
		<div class="page-header" style="text-align:center">
			<h1 style="text-align:center;color:white">
				复利计算器
				<ul class="nav navbar-nav navbar-right">
					<li style="font-size:20px "><a href="#">打印</a>
			</h1>
		</div>
	</div>
	</nav>
	<!-- 标题 end-->


	<!--计算面板start -->
	<div class="container">
		<div class="panel panel-default ">
			<div class="panel-heading" style="font-size: 25px">计算</div>
			<form action="<%=path %>/Calculator/Calculator2" method="post"
				theme="ajax">
				<div class="panel-body" class="container" align="center">
					<input type="radio" name="chose" id="benjin" onclick="doChose('1')"
						value="1" checked="checked" /> <label for="benjin">本金计算</label>&nbsp;&nbsp;
					<input type="radio" name="chose" id="fuli" value="2"
						onclick="doChose('2')" /> <label for="fuli">复利计算</label> <input
						type="radio" name="chose" id="baochoulv" value="3"
						onclick="doChose('3')" /> <label for="baochoulv">存款利率</label> <input
						type="radio" name="chose" id="nianxian" value="4"
						onclick="doChose('4')" /> <label for="nianxian">存款年限</label> <input
						type="radio" name="chose" id="benxi" value="5"
						onclick="doChose('5')" /> <label for="benxi">分期还款</label><br>
					<br>

					<div align="center">
						<label id="benjinLabel" name="benjin" style="width: 125px; ">存入本金：
						</label> <input name="principal" id="principal" disabled="disabled"
							value="最终计算结果" style="width: 426px; " />
					</div>
					<br>
					<div align="center">
						<label id="nianlilvLabel" name="nianlilv" style="width: 126px;margin-left:10px; ">存入年利率：
						</label> <input name="annualRate" id="annualRate"
							 style="width: 427px; margin-left:5px;" />%
					</div>
					<br>
					<div align="center">
						<label id="nianxianLabel" name="nianxian" style="width: 125px; onkeyup="this.value=this.value.replace(/\D/g,")" onafterpaste=”this.value=this.value.replace(/\D/g,")">存入年限：</label>
						<input name="year" id="year" 
							style="width: 426px; " />
					</div>
					<br>
					<div align="center">
						<label id="fuliLabel" name="fuli" style="width: 125px; ">复利终值：</label>
						<input name="compoundAmount" id="compoundAmount"
							 style="width: 426px; " ></input>
					</div>
					<br>
					<div  align="center">
						<input type="button" value="计算" style="width: 100px"
							onclick="return (principal.disabled == true?onBenjin():(compoundAmount.disabled==true?onFuli():(annualRate.disabled==true?onBaochoulv():((benjinLabel.html()=='贷款本金')?onNianxian():onDengerbenxin()))))" />
						<input style="margin-left:100px; width: 100px"  type="button" value="重置" onclick="return (principal.disabled == true?doClear('1'):(compoundAmount.disabled==true?doClear('2'):(annualRate.disabled==true?doClear('3'):((benjinLabel.html()=='贷款本金')?doClear('5'):doClear('4')))))">
					</div>
					<br>

				</div>
			</form>
		</div>
	</div>

	<!--计算面板end -->
	
	<!-- 显示动态start --> 
	
	<div class="container" >
		<div class="panel panel-default ">
			<div class="panel-heading" style="font-size: 25px ">动态显示投资类型</div>
				<div class="panel-body" class="container" >
   <table align="center" style="width: 800px;margin-left: 230px " class="container" >
   <tr>
   <th style=" width: 230px " align="center" >投资类型</th>
   <th style=" width: 230px " align="center">收益类型</th>
   <th style=" width: 230px" align="center">计算结果</th>
   </tr>
   <tr>
   	
   </tr>
   </table>
   
  </div>
		</div>
	</div>
	<!-- 显示动态end -->

	<!-- 显示当前计算结果start -->
	<!--  <div class="container"> -->
	<!-- <div class="panel panel-default "> -->
	<!-- Default panel contents -->
	<!--   <div class="panel-heading">计算结果</div> -->
	<!-- <div class="panel-body"> -->
	<!--   <div> 终值： <s:property value="total"/> </div><br> -->
	<s:debug></s:debug>
	<!--     </div> -->
	<!-- </div> -->
	<!-- </div> -->
	<!-- 显示当前计算结果end-->
	<!-- 显示未来10天面板start -->
	<!-- 显示未来10天面板end -->

	<!-- 图形显示start-->
	<!-- 图形显示end-->


	<!-- 页尾start -->
	<div class="footer" style="text-align: center;">
		<!--		<div class="container">-->
		<p>14级商软一班 曹嘉琪 版权所有</p>
		<p>学校：广州商学院</p>
		<p>电话：88888888</p>
	</div>
	<!-- 页尾end -->

</body>
</html>
