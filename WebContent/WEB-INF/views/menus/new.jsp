<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../layout/app.jsp">
    <c:param name="content">
    <div class="contents">
        <h2>メニュー 新規登録ページ</h2>

        <form method="POST" action="<c:url value='/menus/create' />">
            <c:import url="_form.jsp" />
        </form>
<br/>
        <h3>
            <a href="<c:url value='/menus/index'/>">一覧に戻る</a>
        </h3>
        </div>
    </c:param>
</c:import>