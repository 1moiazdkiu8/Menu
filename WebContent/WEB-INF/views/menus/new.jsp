<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h2>メニュー 新規登録ページ</h2>

        <form method="POST" action="<c:url value='/menus/create' />">
            <c:import url="_form.jsp" />
        </form>

        <p>
            <a href="<c:url value='/menus/index'/>">一覧に戻る</a>
        </p>
    </c:param>
</c:import>