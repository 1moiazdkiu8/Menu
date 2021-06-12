<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <div class="contents">
            <c:choose>
                <c:when test="${menu != null}">
                    <h2>メニュー 編集ページ</h2>
                    <form method="POST" action="<c:url value='/menus/update'/>">
                        <c:import url="_form.jsp" />
                    </form>

                    <h3>
                        <a href="#" onclick="confirmDestroy();">このメニューを削除する</a>
                    </h3>
                    <form method="POST"
                        action="${pageContext.request.contextPath}/menus/destroy">
                        <input type="hidden" name="_token" value="${_token}" />
                    </form>
                    <script>
                        function confirmDestroy() {
                            if (confirm("本当に削除してよろしいですか？")) {
                                document.forms[1].submit();
                            }
                        }
                    </script>
                </c:when>
                <c:otherwise>
                    <h2>お探しのデータは見つかりませんでした。</h2>
                </c:otherwise>
            </c:choose>
            <h3>
                <a href="<c:url value='/menus/index'/>">一覧に戻る</a>
            </h3>
        </div>
    </c:param>
</c:import>