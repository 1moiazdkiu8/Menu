<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
    <div class="contents">
        <c:choose>
            <c:when test="${user != null}">
                <h2>${user.name} のプロフィール　編集ページ</h2>
                <p>（パスワードは変更する場合のみ入力してください）</p>
                <form method="POST" action="<c:url value='/users/update' />">
                    <c:import url="_form.jsp" />
                </form>

                <h3><a href="#" onclick="confirmDestroy();">このユーザーを削除する</a></h3>
                <form method="POST" action="<c:url value='/users/destroy' />">
                    <input type="hidden" name="_token" value="${_token}" />
                </form>
                <script>
                    function confirmDestroy() {
                        if(confirm("本当に削除してよろしいですか？")) {
                            document.forms[1].submit();
                        }
                    }
                </script>
            </c:when>
            <c:otherwise>
                <h2>自分以外のプロフィールは編集できません。</h2>
            </c:otherwise>
        </c:choose>
    </div>
    </c:param>
</c:import>