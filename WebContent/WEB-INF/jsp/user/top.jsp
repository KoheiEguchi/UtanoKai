<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/origin/top.css">
	<jsp:include page="../include/head.jsp" flush="true" />
	<title>ようこそ</title>
</head>
<body>
	<jsp:include page="../include/load.jsp" flush="true" />
	<div id="loaded" class="container">
		<jsp:include page="../include/header.jsp" flush="true" />
		<div class="main">
			<div class="py-4">
				<jsp:include page="../include/title.jsp" flush="true" />
				<h3>ようこそ ${name}様</h3>
				<p class="my-4"><a href="Compose"><input class="btn btn-success btn-lg shadow" type="button" value="新たに詠む"></a></p>
			</div>
			<jsp:include page="../include/msg.jsp" flush="true" />
			
			<!-- ここから最新の歌一覧 -->
			<div class="bg-secondary py-2">
				<h3 class="whiteWord">最新の歌</h3>
			</div>
			<div class="row">
				<div class="col-1 bg-secondary"></div>
				<div class="col-10">
					<div class="row tops">
						<div class="col-md-6 col-xs-12 order-md-2 bg-success shadow list zoom">
							<a class="linkMenuHaiku whiteHover" href="List?genre=1">
								<!-- <img src="img/haiku.png" width="150" height="150"> -->
								<div class="col-2 h3 font-weight-normal">俳句・川柳</div>
								<c:forEach items="${newHaiku}" var="haiku">
									<div class="col-1 text-left py-3">${haiku.strComposeDate} ${haiku.strComposeTime}</div>
									<div class="col-3 text-left py-3 font-weight-bold">
										${haiku.haiku}
										<div class="text-right mb-4">
											<object><a class="linkName" href="UserDetail?name=${haiku.composer}">${haiku.composer}</a></object>
										</div>
									</div>
									<div class="col-3">${haiku.comment}</div>
									<div class="col-1">
										<c:if test="${name != haiku.composer}">
											<p class="text-right">
												<object>
													${haiku.good}人から<a class="linkGood" href="Good?id=${haiku.id}&genre=1&top=top">高評価</a>されました
												</object>
											</p>
										</c:if>
										<c:if test="${name == haiku.composer}">
											<p class="text-right">${haiku.good}人から高評価されました</p>
										</c:if>
									</div>
									<div class="col-2"></div>
								</c:forEach>
							</a>
						</div>
						<div class="col-md-6 col-xs-12 order-md-1 bg-info shadow list zoom">
							<a class="linkMenuTanka blackHover" href="List?genre=2">
								<!-- <img src="img/tanka.png" width="150" height="150"> -->
								<div class="col-2 h3 font-weight-normal">短歌</div>
								<c:forEach items="${newTanka}" var="tanka">
									<div class="col-1 text-left py-3">${tanka.strComposeDate} ${tanka.strComposeTime}</div>
									<div class="col-3 text-left py-3 font-weight-bold">
										${tanka.haiku}
										<div class="text-right mb-4">
											<object><a class="linkName" href="UserDetail?name=${tanka.composer}">${tanka.composer}</a></object>
										</div>
									</div>
									<div class="col-3">${tanka.comment}</div>
									<div class="col-1">
										<c:if test="${name != tanka.composer}">
											<p class="text-right">
												<object>
													${tanka.good}人から<a class="linkGood" href="Good?id=${tanka.id}&genre=2&top=top">高評価</a>されました
												</object>
											</p>
										</c:if>
										<c:if test="${name == tanka.composer}">
											<p class="text-right">${tanka.good}人から高評価されました</p>
										</c:if>
									</div>
									<div class="col-2"></div>
								</c:forEach>
							</a>
						</div>
					</div>
					<div class="row tops">
						<div class="col-md-6 col-xs-12 order-md-2 bg-warning shadow list zoom">
							<a class="linkMenuChoka blackHover" href="List?genre=3">
								<!-- <img src="img/choka.png" width="150" height="150"> -->
								<div class="col-2 h3 font-weight-normal">長歌</div>
								<c:forEach items="${newChoka}" var="choka">
									<div class="col-1 text-left py-3">${choka.strComposeDate} ${choka.strComposeTime}</div>
									<div class="col-3 text-left py-3 font-weight-bold">
										${choka.haiku}
										<div class="col-1 text-right mb-4">
											<object><a class="linkName" href="UserDetail?name=${choka.composer}">${choka.composer}</a></object>
										</div>
									</div>
									<div class="col-3">${choka.comment}</div>
									<div class="col-1">
										<c:if test="${name != choka.composer}">
											<p class="text-right">
												<object>
													${choka.good}人から<a class="linkGood" href="Good?id=${choka.id}&genre=3&top=top">高評価</a>されました
												</object>
											</p>
										</c:if>
										<c:if test="${name == choka.composer}">
											<p class="text-right">${choka.good}人から高評価されました</p>
										</c:if>
									</div>
									<div class="col-2"></div>
								</c:forEach>
							</a>
						</div>
						<div class="col-md-6 col-xs-12 order-md-1 bg-danger shadow list zoom">
							<a class="linkMenuDodoitsu whiteHover" href="List?genre=4">
								<!-- <img src="img/dodoitsu.png" width="150" height="150"> -->
								<div class="col-2 h3 font-weight-normal">都々逸</div>
								<c:forEach items="${newDodoitsu}" var="dodoitsu">
									<div class="col-1 text-left py-3">${dodoitsu.strComposeDate} ${dodoitsu.strComposeTime}	</div>
									<div class="col-3 text-left py-3 font-weight-bold">
										${dodoitsu.haiku}
										<div class="text-right mb-4">
											<object><a class="linkName" href="UserDetail?name=${dodoitsu.composer}">${dodoitsu.composer}</a></object>
										</div>
									</div>
									<div class="col-3">${dodoitsu.comment}</div>
									<div class="col-1">
										<c:if test="${name != dodoitsu.composer}">
											<p class="text-right">
												<object>
													${dodoitsu.good}人から<a class="linkGood" href="Good?id=${dodoitsu.id}&genre=4&top=top">高評価</a>されました
												</object>
											</p>
										</c:if>
										<c:if test="${name == dodoitsu.composer}">
											<p class="text-right">${dodoitsu.good}人から高評価されました</p>
										</c:if>
									</div>
									<div class="col-2"></div>
								</c:forEach>
							</a>
						</div>
					</div>
				</div>
				<div class="col-1 bg-secondary"></div>
			</div>
			<!-- ここまで最新の歌一覧 -->
			
			<!-- ここから高評価の歌一覧 -->
			<div class="bg-secondary py-2"><h3 class="whiteWord">評価の高い歌</h3></div>
			<div class="row tops">
				<div class="col-1 order-3 bg-success py-1 list"><h3 class="whiteWord">俳句・川柳</h3></div>
				<div class="col-10 order-2">
					<div class="row">
						<c:forEach items="${goodHaiku}" var="haiku">
							<div class="col-md-4 col-xs-12 py-4 goodHaiku shadow list zoom">
								<div class="row">
									<a class="linkMenuHaiku blackHover" href="List?genre=1">
										<div class="col-2"></div>
										<div class="col-1 text-left py-3">${haiku.strComposeDate} ${haiku.strComposeTime}</div>
										<div class="col-2 text-left py-3 font-weight-bold">${haiku.haiku}</div>
										<div class="col-1 text-right">
											<object><a class="linkName" href="UserDetail?name=${haiku.composer}">${haiku.composer}</a></object>
										</div>
										<div class="col-3">${haiku.comment}</div>
										<div class="col-1">
											<c:if test="${name != haiku.composer}">
												<p class="text-right">
													<object>
														${haiku.good}人から<a class="linkGood" href="Good?id=${haiku.id}&genre=1&top=top">高評価</a>されました
													</object>
												</p>
											</c:if>
											<c:if test="${name == haiku.composer}">
												<p class="text-right">${haiku.good}人から高評価されました</p>
											</c:if>
										</div>
										<div class="col-2"></div>
									</a>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="col-1 order-1 bg-success"></div>
			</div>
			<div class="row tops">
				<div class="col-1 order-3 bg-info py-1 list"><h3>短歌</h3></div>
				<div class="col-10 order-2">
					<div class="row">
						<c:forEach items="${goodTanka}" var="tanka">
							<div class="col-md-4 col-xs-12 py-4 goodTanka shadow list zoom">
								<div class="row">
									<a class="linkMenuTanka blackHover" href="List?genre=2">
										<div class="col-2"></div>
										<div class="col-1 text-left py-3">${tanka.strComposeDate} ${tanka.strComposeTime}</div>
										<div class="col-2 text-left py-3 font-weight-bold">${tanka.haiku}</div>
										<div class="col-1 text-right">
											<object><a class="linkName" href="UserDetail?name=${tanka.composer}">${tanka.composer}</a></object>
										</div>
										<div class="col-3">${tanka.comment}</div>
										<div class="col-1">
											<c:if test="${name != tanka.composer}">
												<p class="text-right">
													<object>
														${tanka.good}人から<a class="linkGood" href="Good?id=${tanka.id}&genre=2&top=top">高評価</a>されました
													</object>
												</p>
											</c:if>
											<c:if test="${name == tanka.composer}">
												<p class="text-right">${tanka.good}人から高評価されました</p>
											</c:if>
										</div>
										<div class="col-2"></div>
									</a>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="col-1 order-1 bg-info"></div>
			</div>
			<div class="row tops">
				<div class="col-1 order-3 bg-warning py-1 list"><h3>長歌</h3></div>
				<div class="col-10 order-2">
					<div class="row">
						<c:forEach items="${goodChoka}" var="choka">
							<div class="col-md-4 col-xs-12 py-4 goodChoka shadow list zoom">
								<div class="row">
									<a class="linkMenuChoka blackHover" href="List?genre=3">
										<div class="col-2"></div>
										<div class="col-1 text-left py-3">${choka.strComposeDate} ${choka.strComposeTime}</div>
										<div class="col-3">
											<div class="text-left py-3 font-weight-bold">${choka.haiku}</div>
											<div class="text-right">
												<object><a class="linkName" href="UserDetail?name=${choka.composer}">${choka.composer}</a></object>
											</div>
										</div>
										<div class="col-3">${choka.comment}</div>
										<div class="col-1">
											<c:if test="${name != choka.composer}">
												<p class="text-right">
													<object>
														${choka.good}人から<a class="linkGood" href="Good?id=${choka.id}&genre=3&top=top">高評価</a>されました
													</object>
												</p>
											</c:if>
											<c:if test="${name == choka.composer}">
												<p class="text-right">${choka.good}人から高評価されました</p>
											</c:if>
										</div>
										<div class="col-2"></div>
									</a>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="col-1 order-1 bg-warning"></div>
			</div>
			<div class="row tops">
				<div class="col-1 order-3 bg-danger py-1 list"><h3 class="whiteWord">都々逸</h3></div>
				<div class="col-10 order-2">
					<div class="row">
						<c:forEach items="${goodDodoitsu}" var="dodoitsu">
							<div class="col-md-4 col-xs-12 py-4 goodDodoitsu shadow list zoom">
								<div class="row">
									<a class="linkMenuDodoitsu blackHover" href="List?genre=4">
										<div class="col-2"></div>
										<div class="col-1 text-left py-3">${dodoitsu.strComposeDate} ${dodoitsu.strComposeTime}</div>
										<div class="col-2 text-left py-3 font-weight-bold">${dodoitsu.haiku}</div>
										<div class="col-1 text-right">
											<object><a class="linkName" href="UserDetail?name=${dodoitsu.composer}">${dodoitsu.composer}</a></object>
										</div>
										<div class="col-3">${dodoitsu.comment}</div>
										<div class="col-1">
											<c:if test="${name != dodoitsu.composer}">
												<p class="text-right">
													<object>
														${dodoitsu.good}人から<a class="linkGood" href="Good?id=${dodoitsu.id}&genre=4&top=top">高評価</a>されました
													</object>
												</p>
											</c:if>
											<c:if test="${name == dodoitsu.composer}">
												<p class="text-right">${dodoitsu.good}人から高評価されました</p>
											</c:if>
										</div>
										<div class="col-2"></div>
									</a>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="col-1 order-1 bg-danger"></div>
			</div>
			<div class="bg-secondary py-2"><h2></h2></div>
			<!-- ここまで高評価の歌一覧 -->
			
			<p class="my-5"><a href="Compose"><input class="btn btn-success btn-lg shadow" type="button" value="新たに詠む"></a></p>
			<div class="row">
				<div class="col-md-2 col-xs-1"></div>
				<div class="col-md-8 col-xs-10">
					<ul class="nav nav-tabs">
						<li class="nav-item w-25 itemHaiku"><a href="#haiku" class="nav-link active navHaiku" data-toggle="tab">俳句・川柳とは？</a></li>
						<li class="nav-item w-25 itemTanka"><a href="#tanka" class="nav-link navTanka" data-toggle="tab">短歌とは？</a></li>
						<li class="nav-item w-25 itemChoka"><a href="#choka" class="nav-link navChoka" data-toggle="tab">長歌とは？</a></li>
						<li class="nav-item w-25 itemDodoitsu"><a href="#dodoitsu" class="nav-link navDodoitsu" data-toggle="tab">都々逸とは？</a></li>
					</ul>
					<div class="tab-content">
						<div id="haiku" class="tab-pane py-4 active haikuTab"><jsp:include page="../include/haiku.jsp" flush="true" /></div>
						<div id="tanka" class="tab-pane py-4 tankaTab"><jsp:include page="../include/tanka.jsp" flush="true" /></div>
						<div id="choka" class="tab-pane py-4 chokaTab"><jsp:include page="../include/choka.jsp" flush="true" /></div>
						<div id="dodoitsu" class="tab-pane py-4 dodoitsuTab"><jsp:include page="../include/dodoitsu.jsp" flush="true" /></div>
					</div>
				</div>
				<div class="col-md-2 col-xs-1"></div>
			</div>
			<p class="my-3"><a href="UserDetail?name=${name}"><input class="btn btn-primary shadow" type="button" value="あなたの詳細"></a></p>
			<c:if test="${name == 'admin'}">
				<p class="py-5"><a href="UserList"><input class="btn btn-danger shadow" type="button" value="会員一覧"></a></p>
			</c:if>
			<p class="my-5"><a href="Login"><input class="btn btn-warning shadow" type="button" value="退室"></a></p>
		</div>
		<jsp:include page="../include/footer.jsp" flush="true" />
	</div>
</body>
</html>