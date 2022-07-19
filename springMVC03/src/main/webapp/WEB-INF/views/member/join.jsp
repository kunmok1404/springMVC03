<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="container">
<jsp:include page="../common/header.jsp"/>
  <h2>Spring MVC03</h2>
  <div class="panel panel-default">
    <div class="panel-heading">회원가입</div>
    <div class="panel-body">
    	<form action='<c:url value="/memRegister.do"/>' method="post">
    		<table class="table table-bordered" style="text-align:center; border:1px solid #dddddd;">
    			<tr>
    				<td style="width:200px; vertical-align: middle;">아이디</td>
    				<td><input id="memID" name="memID" type="text" class="form-control" maxlength="20" placeholder="아이디를 입력해주세요"/></td>
    				<td style="width:110px; vertical-align: middle;"><button type="button" onclick="registChk()" class="btn btn-primary btn-sm">중복확인</button></td>
    			</tr>
    			<tr>
    				<td style="width:200px; vertical-align: middle;">비밀번호</td>
    				<td colspan="2"><input id="memPassword1" name="memPassword1" onblur="passwordChk()" type="password" class="form-control" maxlength="20" placeholder="비밀번호를 입력해주세요"/></td>
    			</tr>
    			<tr>
    				<td style="width:200px; vertical-align: middle;">비밀번호 확인</td>
    				<td colspan="2"><input id="memPassword2" name="memPassword2" onblur="passwordChk()" type="password" class="form-control" maxlength="20" placeholder="비밀번호를 다시 입력해주세요"/></td>
    			</tr>
    			<tr>
    				<td style="width:200px; vertical-align: middle;">사용자 이름</td>
    				<td colspan="2"><input id="memName" name="memName" type="text" class="form-control" maxlength="20" placeholder="이름을 입력해주세요"/></td>
    			</tr>
    			<tr>
    				<td style="width:200px; vertical-align: middle;">나이</td>
    				<td colspan="2"><input id="memAge" name="memAge" type="number" class="form-control" maxlength="2" placeholder="나이를 입력해주세요"/></td>
    			</tr>
    			<tr>
    				<td style="width:200px; vertical-align: middle;">성별</td>
    				<td colspan="2">
    					<div class="form-group" style="text-align:center; margin:0 auto;">
    						<div class="btn-group" data-toggle="buttons">
    							<label class="btn btn-primary active">
    								<input name="memGender" type="radio" autocomplete="off" value="남자" checked/>남자
    							</label>
    							<label class="btn btn-primary">
    								<input name="memGender" type="radio" autocomplete="off" value="여자"/>여자
    							</label>
    						</div>
    					</div>
    				</td>
    			</tr>
    			<tr>
    				<td style="width:200px; vertical-align: middle;">이메일</td>
    				<td colspan="2"><input id="memEmail" name="memEmail" type="email" class="form-control" maxlength="20" placeholder="이메일을 입력해주세요"/></td>
    			</tr>
    			<tr>
    				<td colspan="3" style="text-align:left;">
    					<input type="submit" class="btn btn-primary btn-sm pull-right" value="등록"/>
    				</td>
    			</tr>
    		</table>
    	</form>
    </div>
    <div class="panel-footer">스프1탄_인프런(TED)</div>
    
    <!-- 모달창 -->
<!--     <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button> -->

	  <!-- Modal -->
	  <div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div id="checkType" class="modal-content">
	        <div class="modal-header panel-heading">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">메세지 확인</h4>
	        </div>
	        <div class="modal-body">
	          <p id="result_msg"></p>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
    
    
  </div>
</div>

</body>
<script type="text/javascript">
	function registChk() {
		var memID = $("#memID").val();
		if(!memID) {
			return alert("아이디를 입력하세요");
		}
		var paramObj = {
			"memID" : memID
		}
		$.ajax({
			url : "memRegisterChk",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(paramObj),
			success : function(result){
				if(result == 1) {
					$("#result_msg").html("사용할 수 있는 아이디입니다.");
					$("#checkType").attr("class", "modal-content panel-success");
				} else {
					$("#result_msg").html("사용할 수 없는 아이디입니다.");
					$("#checkType").attr("class", "modal-content panel-warning");
				}	
				$("#myModal").modal("show");
			},
			error : function(){
				alert("error");
			}
		});	
	}
</script>
</html>