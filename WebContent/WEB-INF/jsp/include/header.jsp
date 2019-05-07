<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/head.jsp" flush="true" />
	<title>ヘッダー</title>
</head>
<body>
	<div class="header">
		<c:if test="${name != null}">
			<p class="leftSide"><a href="UserDetail?name=${name}"><input class="btn btn-primary btn-lg shadow" type="button" value="あなたの詳細"></a></p>
			<c:if test="${top == null}">
				<p class="rightSide"><a href="Top"><input class="btn btn-info btn-lg shadow" type="button" value="入り口へ戻る"></a></p>
			</c:if>
			<c:if test="${top != null}">
				<!-- headerにトグルメニューとか使いたい、トップ画面では新着一覧、高評価一覧、説明へ飛べるようにしたい -->
			</c:if>
		</c:if>
	</div>
</body>
</html>
