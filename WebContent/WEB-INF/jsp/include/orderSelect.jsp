<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/head.jsp" flush="true" />
	<title>並び替え選択肢</title>
</head>
<body>
	<div class="row py-4">
		<div class="col-md-5 col-xs-1"></div>
		<div class="col-md-2 col-xs-10">
			<select class="form-control" name="order">
				<option value="new">新しい順</option>
				<option value="old">古い順</option>
				<option value="good">高評価順</option>
				<option value="bad">低評価順</option>
			</select>
			<p><input class="btn btn-primary shadow mt-2" type="submit" value="並び替え"></p>
		</div>
		<div class="col-md-5 col-xs-1"></div>
	</div>
</body>
</html>