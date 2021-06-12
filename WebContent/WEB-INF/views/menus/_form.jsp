<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
        ・<c:out value="${errors}" />
            <br />
        </c:forEach>
    </div>
</c:if>

<label for="menu_date">日付</label>
<br />
<input type="date" name="menu_date"
    value="<fmt:formatDate value='${menu.menu_date}' pattern='yyyy-MM-dd' />" />
<br />
<br />

<label for="user_name">ユーザー名</label>
<br />
<h3>
    <c:out value="${sessionScope.login_user.name}" />
</h3>

<label for="menu_name">メニュー名</label>
<h3 class="attention">※入力必須</h3>
<br />
<input type="text" name="menu_name" value="${menu.menu_name}" />
<br />
<br />
<label for="mood">メニューのタグづけ</label>
<h3>
    ★タグづけすると気分として検索できます。 ※複数可<br /> <label><input type="checkbox"
        name="mood" value="和">和</label>&nbsp;&nbsp;<label><input
        type="checkbox" name="mood" value="洋">洋</label>&nbsp;&nbsp; <label><input
        type="checkbox" name="mood" value="中">中</label>&nbsp;&nbsp;<br /> <label><input
        type="checkbox" name="mood" value="あっさり">あっさり</label>&nbsp;&nbsp; <label><input
        type="checkbox" name="mood" value="がっつり">がっつり</label>&nbsp;&nbsp; <label><input
        type="checkbox" name="mood" value="辛">辛</label><br /> <label><input
        type="checkbox" name="mood" value="メイン">メイン </label>&nbsp;&nbsp;<label><input
        type="checkbox" name="mood" value="副菜">副菜 </label>&nbsp;&nbsp;<label><input
        type="checkbox" name="mood" value="汁物">汁物</label> &nbsp;&nbsp;<label><input
        type="checkbox" name="mood" value="一品料理">一品料理</label>&nbsp;&nbsp; <label><input
        type="checkbox" name="mood" value="軽食">軽食</label> &nbsp;&nbsp; <label><input
        type="checkbox" name="mood" value="デザート">デザート</label><br /> <label>
        <input type="checkbox" name="mood" value="肉">肉
    </label>&nbsp;&nbsp; <label><input type="checkbox" name="mood"
        value="魚">魚</label>&nbsp;&nbsp; <label><input type="checkbox"
        name="mood" value="葉茎菜類">葉茎菜類</label>&nbsp;&nbsp; <label><input
        type="checkbox" name="mood" value="根菜">根菜</label>&nbsp;&nbsp; <label><input
        type="checkbox" name="mood" value="イモ類">イモ類</label>&nbsp;&nbsp; <label><input
        type="checkbox" name="mood" value="果菜">果菜</label> &nbsp;&nbsp; <label><input
        type="checkbox" name="mood" value="卵">卵</label>
</h3>
<label for="ingredient">材料</label>
<br />
<textarea name="ingredient" rows="15" cols="30">${menu.ingredient}</textarea>
<br />
<label for="content">作り方</label>
<br />
<textarea name="content" rows="20" cols="50">${menu.content}</textarea>
<br />
<input type="hidden" name="_token" value="${_token}" />
<button type="submit">My menuを登録</button>
