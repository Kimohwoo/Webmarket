<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
</head>
<body>
	
	<form name="form_main" onSubmit="javascript:return false;">
		<div class="container">
		    <div class="row">
		        <div class="col-xs-12"> </div>
		    </div>
<!-- 		    <div class="row"> -->
<!-- 		        <div class="col-xs-12"> -->
<!-- 			    	<input type="text" name='user_id' value="aa1" class="form-control" id="inputDefault"> -->
<!-- 			    	<input type="text" name='user_name' value="홍길동" class="form-control" id="inputDefault"> -->
<!-- 			    	<input type="text" name='user_phone' value="010-1234-4546" class="form-control" id="inputDefault"> -->
<!-- 				    <input type="text" name='user_grade' value="3" class="form-control" id="inputDefault"> -->
<!-- 			    	<button class="btn btn-primary" type="button" id="button-addon2" onClick='javascript:insertData();' >입력</button> -->
<!-- 			    	<button class="btn btn-primary" type="button" id="button-addon2" onClick='javascript:updateData();' >수정</button> -->
<!-- 		        </div> -->
<!-- 		    </div> -->
		    <div class="row">	        
		        <div class="col-sm-6">   
		        	<div class="input-group mb-3">
			      		<input type="text" name='txt_user_id' class="form-control" placeholder="ID 입력바람!" aria-label="Recipient's username" aria-describedby="button-addon2" onkeyup='javascript:;'>
			      		<button class="btn btn-primary" type="button" id="button-addon2"  onClick='javascript:selectData();' >Button</button>
			    	</div>
			    	<div id='div_res' class="input-group mb-3" >
			    	
			    	</div>
	    		</div>
		        <div class="col-md-3"></div>
		    </div>
		
		</div>
	</form>
	
</body>
<script type="text/javascript">
var ajax1; // XMLhttpRequest객체를 저장할 변수, 전역변수선언

function selectData()//json 요청
{		
//		setTimeout("alert('111111')", 1);
	
	var form_name = "form_main";
	var user_id = document.forms[form_name].elements["txt_user_id"].value;
	
	ajax1 = new XMLHttpRequest();
	
//		var url = "./testFile.jsp"; //요청 url 설정
	var url = "./db/db_select.jsp"; //요청 url 설정
	
	var reqparam = "user_id="+user_id;
	
	ajax1.onreadystatechange = resSelectData; // 다되면 실행할 함수 등록(호출 아님. 역호출)
	ajax1.open("Post", url, "true"); //서버의 요청설정 -url변수에 설정된 리소스를 요청할 준비
	ajax1.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
	ajax1.send(reqparam);
}

function resSelectData()
{
	if(ajax1.readyState == 4)
	{
		
		if(ajax1.status == 200)
		{
			var result = ajax1.responseText;
			
			var objRes = eval("("+result+")");
			
			var num = objRes.datas.length;
			var res = "<table class='table table-hover'>";
			var resDiv = document.getElementById("div_res");
			
			if(num<1)
			{
				res += "<tr><td width='980' height='100' align = 'center' style='font-size:50;'>검색 결과가 없습니다.</td></tr>";
			}
			else
			{
				for(var i=0; i<num; i++)
				{
					var user_id = objRes.datas[i].ID;
					var user_name = objRes.datas[i].PASSWORD;
					var user_phone = objRes.datas[i].NAME;
					var user_gender = objRes.datas[i].GENDER;
					var user_time = objRes.datas[i].REGIST_DAY;
					
					res +="<tr class='table-active'>";
					res +="<td >"+user_id+"</td>";
					res +="<td><br>"+user_name+"<br></td>";
					res +="<td><br>"+user_phone+"<br></td>";
//					res +="<td><br>"+"<button type='button' class='btn btn-primary' value='"+user_id+"' onclick='updateData(this.value)'>수정</button>"+"<br></td>";
//					res +="<td><br>"+"<button type='button' class='btn btn-primary' value='"+user_id+"' onclick='updateData(this.value)'>삭제</button>"+"<br></td>";
					res +="<td><br>"+"<button type='button' class='btn btn-primary' onclick='toInput(\""+user_id+"\",\""+user_name+"\",\""+user_phone+"\",\""+user_gender+"\")'>수정</button>"+"<br></td>";
					res +="<td><br>"+"<button type='button' class='btn btn-primary' value='"+user_id+"' onclick='deleteConfirm(this.value)'>삭제</button>"+"<br></td>";
					res +="</tr>";
				}
			}
			res += "</table>";
			
				//alert(res);
			resDiv.innerHTML = res;
		}
	}
}

function deleteConfirm(user_id)
{
	if(confirm("정말 삭제하시겠습니까?"))
		deleteData(user_id);
		
}

//4.삭제 ajax
function deleteData(user_id)//json 요청
{		
	ajax1 = new XMLHttpRequest();
	
//		var url = "./testFile.jsp"; //요청 url 설정
	var url = "./db_delete.jsp"; //요청 url 설정
	
	var reqparam  = "user_id=" + user_id;
	
	ajax1.onreadystatechange = resDeleteData; // 다되면 실행할 함수 등록(호출 아님. 역호출)
	ajax1.open("Post", url, "true"); //서버의 요청설정 -url변수에 설정된 리소스를 요청할 준비
	ajax1.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
	ajax1.send(reqparam);
}

function resDeleteData()
{
	if(ajax1.readyState == 4)
	{
		
		if(ajax1.status == 200)
		{
			//alert("2");
			
			var result = ajax1.responseText;
//				alert(result);
			
				var objRes = eval("("+result+")");
//				alert(objRes);

			var resDiv = document.getElementById("div_res");
			var res = "";
			

			var success = objRes.SUCCESS;
			
			if(success == "1")
			{
				alert("삭제 성공했어요~!");
				res = "<p>삭제 성공</p>";
				
			}
			else if(success == "0")
			{
				alert("삭제 실패했어요~!")
				res = "<p>삭제 실패</p>";
				
			}			
			
			
//				resDiv.innerHTML = res;

			selectData();

		}
	}
}
</script>
</html>