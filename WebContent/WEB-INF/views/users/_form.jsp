<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" />
            <br />
        </c:forEach>

    </div>
</c:if>

<label for="name">ユーザー名</label>
※スペースを除いた2文字以上8文字以内
<br />
<input type="text" name="name" value="${user.name}" />
<br />
<br />

<label for="password">パスワード</label>
※大文字を含む4文字以上12文字以内の英数字
<br />
<input type="password" name="password" />
<br />
<br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">登録</button>