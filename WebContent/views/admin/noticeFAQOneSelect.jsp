<%@page import="kr.or.iei.admin.notice.model.vo.AdminFAQ"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.or.iei.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자페이지 - 자주 묻는 질문 관리 : 글수정하기 </title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&family=Noto+Serif+KR:wght@400;500;600&display=swap" rel="stylesheet">    
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="/assets/commons/default.css">
<link rel="stylesheet" href="/assets/commons/adminNavigation.css">
<link rel="stylesheet" href="/assets/commons/adminCommon.css">
<link rel="stylesheet" href="/assets/css/adminWrite.css">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="/assets/js/ui.js"></script>
</head>

<body>
    <div id="wrap">
	<%AdminFAQ admfaq = (AdminFAQ)request.getAttribute("admfaq");%>

글번호 : <%=admfaq.getFaq_No() %> 
글제목 : <%=admfaq.getFaq_Title() %>
글내용 : <%=admfaq.getFaq_Content() %>
삭제여부 : <%=admfaq.getFaq_Del_YN() %>

  <!-- navigation -->
		<%@ include file="/views/commons/header/navigationAdmin.jsp"%>
        
        <div id="header">
            <div class="admin-path">
                <p>줍데이공지</p>
                <p>자주 묻는 질문 관리</p>
            </div>

            <div class="box-user">
                <a href="/"><%=m.getNick() %>님</a>
                <a href="/member/logout.do">로그아웃</a>
            </div>
        </div>

        <div id="content">
            <div class="container">
				<form action="/admin/AdminFAQUpdate.do" id="updateForm" method="post">
					<div class="box-write" name="content" id="content">
						<div class="box-subject">
							<input type="text" placeholder="제목을 입력하세요"/><%=adfaq.getFaq_Title() %>
						</div>
						<div class="box-content">
							<textarea placeholder="내용을 입력하세요"><%=adfaq.getFaq_Content() %></textarea>
						</div>
					</div>
					<div class="box-button">
						<input type="submit" value="수정" class="btn-rec" id="updateBtn">
						<input type="submit" value="취소" class="btn-rec" id="cancleBtn">
						<button class="btn-rec"><a href="/admin/adminFAQManageList.do">목록</a></button>
					</div>
				</form>
            </div>
        </div>
    <%--     
    <script>
	var updateBtnFlag = false;
	var boardData;
	$('#updateBtn').click(function(){
		if(updateBtnFlag==false)
			{
				$('#content').prop('disabled',false);
				$('#updateBtn').text('수정완료');
				$('#cancleBtn').css('display','inline');	
				updateBtnFlag=true;
				boardData = $('#content').html();
			}
		else if(updateBtnFlag==true){
			$('#updateForm').submit();
		}
	});
	
	$('#cancleBtn').click(function(){
		location.replace('/admin/adminFAQSelectContent.do?faq_No=<%=adfaq.getFaq_No()%>');
	});
	
</script>
        --%>
        <footer id="footer">
            <p>2021 ⓒ JUP DAY</p>
        </footer>
    </div>
</body>
</html>