<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/origin/compose.css">
	<jsp:include page="../include/head.jsp" flush="true" />
	<title>新たに詠む</title>
</head>
<body>
	<jsp:include page="../include/load.jsp" flush="true" />
	<div id="loaded" class="container">
		<jsp:include page="../include/header.jsp" flush="true" />
		<div class="main">
			<jsp:include page="../include/title.jsp" flush="true" />
			<jsp:include page="../include/msg.jsp" flush="true" />
			<h3 class="py-3">新たに詠む</h3>
			<form action="Compose?name=${name}" method="POST">
				<div class="row py-4">
					<div class="col-md-4 order-md-3 h-auto pt-3 composeBg composeTwist">
						<h4 class="text-left py-4">詠む歌</h4>
						<div class="py-4">
							<p class="text-left my-5 h5">詠む歌をお選びください</p>
							<div class="btn-group" data-toggle="buttons">
								<div class="radio mr-5 genreBtns">
									<label class="btn btn-outline-success shadow composeBtn">
										<input type="radio" name="genre" value="1"><span class="font py-2">俳句</span>
									</label>
									<label class="btn btn-outline-info shadow composeBtn">
										<input type="radio" name="genre" value="2"><span class="font py-2">短歌</span>
									</label>
									<label class="btn btn-outline-warning shadow composeBtn">
										<input type="radio" name="genre" value="3"><span class="font py-2">長歌</span>
									</label>
									<label class="btn btn-outline-danger shadow composeBtn">
										<input type="radio" name="genre" value="4"><span class="font py-2">都々逸</span>
									</label>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4 order-md-2 h-100 pt-3 composeHaikuBg composeTwist">
						<h4 class="text-left py-4">本文</h4>
						<p>
							<textarea class="composeHaiku" name="haiku" cols="46" rows="5" placeholder="歌をお詠みください"></textarea>
						</p>
					</div>
					<div class="col-md-4 order-md-1 h-100 pt-3 composeBg composeTwist">
						<h4 class="text-left py-4">込めた思い</h4>
						<p>
							<textarea class="composeComment" name="comment" cols="46" rows="10" placeholder="この歌に込めた思いや解説等をお書きください"></textarea>
						</p>
					</div>
				</div>
				<p><input class="btn btn-success btn-lg shadow my-4" type="submit" value="投稿する"></p>
				<p class="py-4"><a href="Top"><input class="btn btn-info shadow" type="button" value="戻る"></a></p>
			</form>
		</div>
		<jsp:include page="../include/footer.jsp" flush="true" />
	</div>
</body>
</html>
