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
            <h2>今日のおすすめ</h2>
            <table id="today_menu_list">
                <tbody>
                    <tr>
                        <th class="menu_name">メニュー名</th>
                        <th class="menu_action">操作</th>
                    </tr>
                    <tr>
                        <td class="menu_name"><c:out value="${result.menu_name}" /></td>
                        <td class="menu_action"><a
                            href="<c:url value='/menus/show?id=${result.id}'/>">詳細</a></td>
                    </tr>
                </tbody>
            </table>
            <br />
            <script>
                function onemoretime() {
                    location.reload();
                }
            </script>
            <div class="reload">
                <input type="button" value="他のおすすめを見る" onclick="onemoretime()">
            </div>
            <br /> <br />
            <h3>
                <a href="<c:url value='/menus/new' />">新規メニュー登録</a>
            </h3>
            <h3>
                <a href="<c:url value='/' />">戻る</a>
            </h3>
        </div>
    </c:param>
</c:import>
