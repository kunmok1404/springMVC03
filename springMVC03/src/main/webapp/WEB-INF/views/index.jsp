<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<div class="container">
	<jsp:include page="common/header.jsp"/>
		<c:choose>
			<c:when test="${empty mvo}">
				<h4>Spring MVC03</h4>
			</c:when> 
			<c:otherwise>
				<h4>[사진]${mvo.memName}님 안녕하세요.</h4>
			</c:otherwise>
		</c:choose>
	  <p>In this example, the navigation bar is hidden on small screens and replaced by a button in the top right corner (try to re-size this window).
	</div>
	
	<!-- 실패메시지 -->
	  <div class="modal fade" id="myMsg" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div id="msgType" class="modal-content panel-info">
	        <div class="modal-header panel-heading">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">${msgType}</h4>
	        </div>
	        <div class="modal-body">
	          <p>${msg}</p>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
</body>
<script type="text/javascript">
	$(function(){
		var type = '${msgType}';
		var msg = '${msg}';
		if(${!empty msgType}) {
			$("#msgType").attr("class", "modal-content panel-success");
			$("#myMsg").modal("show");
		};
	});
</script>
</html>
