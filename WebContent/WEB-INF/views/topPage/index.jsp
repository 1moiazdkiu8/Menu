<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <div class="contents">
            <c:if test="${flush != null}">
                <div id="flush_success">
                    <p>
                        <c:out value="${flush}"></c:out>
                    </p>
                </div>
            </c:if>
            <h2>
                <a href="<c:url value='/menus/new'/>">★新規メニュー登録</a>
            </h2>

            <c:if test="${error_message != null}">
                <div id="error_message">
                    <c:out value="${error_message}"></c:out>
                </div>
            </c:if>

            <h2>★気分を選択してメニューを検索</h2>
            <h3>※複数選択可</h3>
            <form method="GET" action="?">

                <label><input type="checkbox" name="mood" value="あっさり">あっさり</label>&nbsp;&nbsp;
                <label><input type="checkbox" name="mood" value="がっつり">がっつり</label><br />
                <label><input type="checkbox" name="mood" value="和">和</label>&nbsp;&nbsp;<label><input
                    type="checkbox" name="mood" value="洋">洋</label>&nbsp;&nbsp; <label><input
                    type="checkbox" name="mood" value="中">中</label>&nbsp;&nbsp;<br />
                <label><input type="checkbox" name="mood" value="メイン">メイン
                </label>&nbsp;&nbsp;<label><input type="checkbox" name="mood"
                    value="副菜">副菜 </label>&nbsp;&nbsp;<label><input
                    type="checkbox" name="mood" value="汁物">汁物</label> &nbsp;&nbsp;<label><input
                    type="checkbox" name="mood" value="一品料理">一品料理</label>&nbsp;&nbsp; <label><input
                    type="checkbox" name="mood" value="軽食">軽食</label> &nbsp;&nbsp; <label><input
                    type="checkbox" name="mood" value="デザート">デザート</label><br /> <label>
                    <input type="checkbox" name="mood" value="肉">肉
                </label>&nbsp;&nbsp; <label><input type="checkbox" name="mood"
                    value="魚">魚</label>&nbsp;&nbsp; <label><input
                    type="checkbox" name="mood" value="葉菜">葉菜</label>&nbsp;&nbsp; <label><input
                    type="checkbox" name="mood" value="根菜">根菜</label>&nbsp;&nbsp; <label><input
                    type="checkbox" name="mood" value="イモ類">イモ類</label>&nbsp;&nbsp; <label><input
                    type="checkbox" name="mood" value="果菜">果菜</label> <br /> <br />
                <h3>My Menuから検索↓</h3>
                <button type="submit"
                    formaction="<c:url value='/menus/search/random' />">おすすめ</button>
                &nbsp;&nbsp;
                <button type="submit" formaction="<c:url value='/menus/search' />">検索結果一覧</button>
                <br /> <br />
                <h3>みんなのMenuを含めて検索↓</h3>
                <button type="submit"
                    formaction="<c:url value='/menus/all/search/random' />">おすすめ</button>
                &nbsp;&nbsp;
                <button type="submit"
                    formaction="<c:url value='/menus/all/search' />">検索結果一覧</button>
            </form>
        </div>
    </c:param>
</c:import>