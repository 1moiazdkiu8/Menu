<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
    <div class="contents">
        <c:choose>
            <c:when test="${menu !=null}">
                <h2>Menu 詳細ページ</h2>

                <table>
                    <tbody>
                        <tr>
                            <th>ユーザー名</th>
                            <td><c:out value="${menu.user.name}" /></td>
                        </tr>
                        <tr>
                            <th>日付</th>
                            <td><fmt:formatDate value="${menu.menu_date}"
                                    pattern="yyyy-MM-dd" /></td>
                        </tr>
                        <tr>
                            <th>メニュー名</th>
                            <td><c:out value="${menu.menu_name}" /></td>
                        </tr>
                        <tr>
                            <th>タグ</th>
                            <td><c:out value="${menu.mood}" /></td>

                        </tr>
                        <tr>
                            <th>材料</th>
                            <td><pre><c:out value="${menu.ingredient}" /></pre></td>
                        </tr>
                        <tr>
                            <th>作り方</th>
                            <td><pre><c:out value="${menu.content}" /></pre></td>
                        </tr>
                        <tr>
                            <th>登録日時</th>
                            <td><fmt:formatDate value="${menu.created_at}"
                                    pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        </tr>
                        <tr>
                            <th>更新日時</th>
                            <td><fmt:formatDate value="${menu.updated_at}"
                                    pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        </tr>
                    </tbody>
                </table>
                <c:if test="${sessionScope.login_user.id == menu.user.id}">
                    <p>
                        <a href="<c:url value="/menus/edit?id=${menu.id}" />">このメニューを編集する</a>
                    </p>
                </c:if>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>

        <h3>
            <a href="<c:url value='/' />">Topページに戻る</a><br /> <a
                href="<c:url value='/menus/index'/>">My menuに戻る</a><br /> <a
                href="<c:url value='/menus/all/index'/>">みんなのMenuに戻る</a><br />
        </h3>
        </div>
    </c:param>
</c:import>