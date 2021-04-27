<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../layout/app.jsp">
    <c:param name="content">

        <h2>今日のメニュー</h2>
        <table id="today_menu_list">
            <tbody>
                <tr>
                    <th class="menu_name">メニュー名</th>
                    <th class="menu_action">操作</th>
                </tr>

                <c:forEach var="menu" items="${today_options}" begin="1" end="3"
                    varStatus="status">

                    <tr class="row${status.count % 2}">

                        <td class="menu_name"><c:out value="${menu.menu_name}" /></td>
                        <td class="menu_action"><a
                            href="<c:url value='/menus/show?id=${menu.id}'/>">詳細</a></td>
                    </tr>
                </c:forEach>

            </tbody>
        </table>
        <script>
            function onemoretime() {
                location.reload();
            }
        </script>
        <input type="button" value="他のおすすめを見る" onclick="onemoretime()">

    </c:param>
</c:import>
