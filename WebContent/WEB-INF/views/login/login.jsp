<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <div class="back">
            <div class="contents">
                <c:if test="${hasError}">
                    <div id="flush_error">
                        <p>ユーザー名かパスワードが間違っています。</p>
                    </div>
                </c:if>
                <c:if test="${flush != null}">
                    <div id="flush_success">
                        <p>
                            <c:out value="${flush}"></c:out>
                        </p>
                    </div>
                </c:if>
                <div class="form">
                    <form method="POST" action="<c:url value='/login' />">
                        <label for="name">ユーザー名</label><br /> <input type="text"
                            name="name" value="${name}" /> <br /> <br /> <label
                            for="password">パスワード</label><br /> <input type="password"
                            name="password" /> <br /> <br /> <input type="hidden"
                            name="_token" value="${_token}" />
                        <button type="submit">ログイン</button>
                    </form>
                </div>
                <div class="reg">
                    <br />
                    <h2>ユーザー登録はこちらから↓</h2>
                    <div class="btn">
                        <h3>
                            <a href="<c:url value='/users/new'/>">新規登録</a>
                        </h3>
                    </div>
                </div>
            </div>
        </div>

    </c:param>
</c:import>