<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
    <div class="contents">
        <c:choose>
            <c:when test="${user != null}">
                <h2>${user.name} のプロフィール</h2>

                <table>
                    <tbody>

                        <tr>
                            <th>ユーザー名</th>
                            <td><c:out value="${user.name}" /></td>
                        </tr>

                        <tr>
                            <th>登録日時</th>
                            <td><fmt:formatDate value="${user.created_at}"
                                    pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        </tr>
                        <tr>
                            <th>更新日時</th>
                            <td><fmt:formatDate value="${user.updated_at}"
                                    pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        </tr>
                    </tbody>
                </table>

                <h3>
                    <a href="<c:url value='/users/edit?id=${user.id}' />">プロフィールを編集する</a>
                </h3>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>
        </div>
    </c:param>
</c:import>