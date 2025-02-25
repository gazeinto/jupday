<%@page import="kr.or.iei.crew.model.vo.CrewBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JUP:DAY | 크루 피드 수정</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&family=Noto+Serif+KR:wght@400;500;600&display=swap" rel="stylesheet">    
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="/assets/commons/default.css">
<link rel="stylesheet" href="/assets/commons/header.css">
<link rel="stylesheet" href="/assets/commons/footer.css">
<link rel="stylesheet" href="/assets/commons/common.css">
<link rel="stylesheet" href="/assets/css/crewWriteFeed.css">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="/assets/js/ui.js"></script>
</head>
<body>

	<%
		String crewName = (String)request.getAttribute("crewName");
		CrewBoard cb = (CrewBoard)request.getAttribute("crewBoard");
		int currentPage = (int)request.getAttribute("currentPage");	
		int currentFeedPage = (int)request.getAttribute("currentFeedPage");
	%>

	<div id="wrap">
		<!-- header -->
		<%@ include file="/views/commons/header/header.jsp"%>
			
		<div id="content">
			<div class=box-title>
				<p class="tit-small">J U P : D A Y</p>
				<p class="tit-big"><%=crewName %></p>
			</div>
			
			<form action="/crew/crewUpdateFeed.do" method="post">
				<div class="box-write">
					<div class="box-subject">
						<input type="text" name="feedSubject" placeholder="제목을 입력하세요" value="<%=cb.getFeedSubject()%>">
					</div>
					<div class="box-content">
						<textarea name="feedContent" placeholder="내용을 입력하세요"><%=cb.getFeedContent() %></textarea>
					</div>
					<div class="box-upload">
						<label for="upload">
							<i class="far fa-image"></i>
							<span>사진첨부</span>
						</label>
						<input type="file" id="upload">
					</div>
					<input type="hidden" name="crewNo" value="<%=cb.getCrewNo()%>">
					<input type="hidden" name="currentPage" value="<%=currentPage%>">
					<input type="hidden" name="feedNo" value="<%=cb.getFeedNo()%>">
					<input type="hidden" name="currentFeedPage" value="<%=currentFeedPage%>">
				</div>
				<div class="box-button">
					<input type="submit" value="완료" class="btn-m">
					<button class="btn-m"><a href="/crew/crewOneFeed.do?crewNo=<%=cb.getCrewNo() %>&currentPage=<%=currentPage %>&feedNo=<%=cb.getFeedNo() %>&currentFeedPage=<%=currentFeedPage%>">취소</a></button>
				</div>
			</form>
			
		</div>
		
		<!-- footer -->
		<%@ include file="/views/commons/footer/footer.jsp"%>
	</div>

</body>
</html>