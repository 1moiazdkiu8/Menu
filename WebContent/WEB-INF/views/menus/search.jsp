<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../layout/app.jsp">
    <c:param name="content">
    <div class="contents">
        <h3>
            選択した気分:
            <c:out value="${checked}" />
        </h3>
        <br />
        <h2>検索結果一覧</h2>
        <table id="today_menu_list">
            <tbody>
                <tr>
                    <th class="menu_name">メニュー名</th>
                    <th class="menu_action">操作</th>
                </tr>
                <c:forEach var="menu" items="${today_options}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td class="menu_name"><c:out value="${menu.menu_name}" /></td>
                        <td class="menu_action"><a
                            href="<c:url value='/menus/show?id=${menu.id}'/>">詳細</a></td>
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
        <h3>
            <a href="<c:url value='/' />">条件を変更して検索する</a>
        </h3>
        </div>
    </c:param>
</c:import>
