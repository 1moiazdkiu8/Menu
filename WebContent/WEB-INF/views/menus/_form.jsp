<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
        ・<c:out value="${errors}" />
            <br />
        </c:forEach>
    </div>
</c:if>

<label for="menu_date">日付</label>
<br />
<input type="date" name="menu_date"
    value="<fmt:formatDate value='${menu.menu_date}' pattern='yyyy-MM-dd' />" />
<br />
<br />

<label for="user_name">ユーザー名</label>
<br />
<c:out value="${sessionScope.login_user.name}" />
<br />
<br />

<label for="menu_name">メニュー名</label>
<br />
<input type="text" name="menu_name" value="${menu.menu_name}" />
<br />
<br />

<label for="content">内容</label>
<br />
<textarea name="content" rows="30" cols="50">${menu.content}</textarea>
<br />
<br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">投稿</button>
