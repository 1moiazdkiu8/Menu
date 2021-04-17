<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:if test="${hasError}">
            <div id="flush_error">ユーザー名かパスワードが間違っています。</div>
        </c:if>
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2>ログイン</h2>
        <form method="POST" action="<c:url value='/login' />">
            <label for="name">ユーザー名</label><br /> <input type="text" name="name"
                value="${name}" /> <br /> <br /> <label for="password">パスワード</label><br />
            <input type="password" name="password" /> <br /> <br /> <input
                type="hidden" name="_token" value="${_token}" />
            <button type="submit">ログイン</button>
        </form>
        <br />
        <br />
        <h2>
            <a href="<c:url value='/users/new'/>">新規登録</a>
        </h2>
    </c:param>
</c:import>