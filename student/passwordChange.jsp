<%@ page contentType="text/html; charset=gb2312"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="${pageContext.request.contextPath}/bootstrap/layer/layer.js"></script>
<script type="text/javascript">
	function checkForm(){
		var oldPassword=document.getElementById("oldPassword").value;
		var newPassword=document.getElementById("newPassword").value;
		var rPassword=document.getElementById("rPassword").value;
		if(oldPassword==""||oldPassword==null){
			layer.tips('����дԭ����', "#oldPassword", {
	      		 tips: [2, '#F70909'],
	      		 time: 2000,
					  tipsMore: true
				         });
			return false;
		} 
		if(newPassword==null||newPassword==""){
			layer.tips('����д������', "#newPassword", {
	     		 tips: [2, '#F70909'],
	     		 time: 2000,
					  tipsMore: true
				         });
			return false;

			}
		if(rPassword==null||rPassword==""){
			layer.tips('�����ٴ���д������', "#rPassword", {
	    		 tips: [2, '#F70909'],
	    		 time: 2000,
					  tipsMore: true
				         });
			return false;

			}
		if(newPassword!=rPassword){
			layer.tips('����������д��һ��', "#rPassword", {
	     		 tips: [2, '#F70909'],
	     		 time: 2000,
					  tipsMore: true
				         });
			return false;
		}
		$.ajax({  
	        type : "POST",  //�ύ��ʽ  
	        url : "password?action=change",//·��  
	        data : {  
	            "oldPassword" : oldPassword,
	            "newPassword":newPassword,
	            "rPassword":rPassword   
	        },//���ݣ�����ʹ�õ���Json��ʽ���д���  
	        dataType:'json',
	        success : function(data) {//�������ݸ��ݽ��������Ӧ�Ĵ���  
	         if(data.msg=="�޸ĳɹ�"){
	           layer.alert(data.msg);
	           window.location.href="login.jsp";
	              }else{
	            		layer.tips(data.msg, "#oldPassword", {
	                    tips: [2, '#F70909'],
	                 	time: 2000,
	           			tipsMore: true
	           	  });
	            }
	        },
	        error:function (XMLHttpRequest, textStatus, errorThrown) { 
	        	  layer.alert(XMLHttpRequest.status);
	              layer.alert(XMLHttpRequest.readyState);
	              layer.alert(textStatus);
	        }   
	    });  
		return true;
	}
	
	$(document).ready(function(){
		$("ul li:eq(2)").addClass("active");
	});
</script>
<div class="data_list">
		<div class="data_list_title" style="text-align:center;">
			<font  size="5" >�޸�����</font>
		</div>
		<form >
			<div class="data_form" >
				<input type="hidden" id="studentId" name="studentId" value="${student.studentId }"/>
					<table style="margin:auto;">
						<tr>
							<td>&nbsp;&nbsp;&nbsp;ԭ���룺<input type="password" id="oldPassword"  name="oldPassword" value="${oldPassword }"  style="margin-top:5px;height:30px;" />${error}</td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;�����룺<input type="password" id="newPassword"  name="newPassword" value="${newPassword }" style="margin-top:5px;height:30px;" /></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td>�ظ����룺<input type="password" id="rPassword"  name="rPassword" value="${rPassword }" style="margin-top:5px;height:30px;" /></td>
							<td><font color="red">*</font></td>
						</tr>
					</table>
					<div  style="position:relative ; left:44%; ">
						<input type="button" class="btn btn-large btn-primary" value="�ύ" onclick="checkForm()"/>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn  btn-large btn-primary btn-primary" type="button" onclick="javascript:window.location='record'">����</button>
					</div>
					<div>
						&nbsp;&nbsp;&nbsp;<font id="error" color="red">${error}</font>
					</div>
			</div>
		</form>
</div>