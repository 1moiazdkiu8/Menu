<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="../layout/app.jsp">
    <c:param name="content">
    <div class="contents">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <p><c:out value="${flush}"></c:out></p>
            </div>
        </c:if>
        <h2>My Menu</h2>
        <table id="menu_list">
            <tbody>
                <tr>

                    <th class="menu_name">メニュー名</th>
                    <th class="menu_action">操作</th>
                    <th class="menu_date">日付</th>
                </tr>
                    <c:forEach var="menu" items="${menus}" varStatus="status">
                        <tr class="row${status.count % 2}">

                            <td class="menu_name"><c:out value="${menu.menu_name}" /></td>
                            <td class="menu_action"><a
                                href="<c:url value='/menus/show?id=${menu.id}'/>">詳細</a></td>
                            <td class="menu_date"><fmt:formatDate
                                    value='${menu.menu_date}' pattern='yyyy-MM-dd' /></td>
                        </tr>

                    </c:forEach>
            </tbody>
        </table>
        <div id="pagination">
            (全${menus_count}件)<br />
            <c:forEach var="i" begin="1" end="${((menus_count -1) /15 )+ 1}"
                step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
            </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/menus/index?page=${i}'/>"><c:out
                                value="${i}" /></a>&nbsp;
            </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <h3>
            <a href="<c:url value='/menus/new' />">新規メニュー登録</a>
        </h3>
        </div>
    </c:param>
</c:import>