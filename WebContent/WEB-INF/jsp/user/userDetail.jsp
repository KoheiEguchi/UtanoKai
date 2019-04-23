<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/head.jsp" flush="true" />
	<c:if test="${composerName == null}">
		<title>${name}様の詳細</title>
	</c:if>
	<c:if test="${composerName != null}">
		<title>${composerName}様の詳細</title>
	</c:if>
</head>
<body>
	<jsp:include page="../include/load.jsp" flush="true" />
	<div id="loaded" class="container">
		<jsp:include page="../include/header.jsp" flush="true" />
		<div class="main">
			<div id="top"><jsp:include page="../include/title.jsp" flush="true" /></div>
			<jsp:include page="../include/msg.jsp" flush="true" />
			<c:if test="${loginOk == null}">
				<c:if test="${composerName == null}">
					<h2 class="py-4">${name}様の詳細</h2>
				</c:if>
				<c:if test="${composerName != null}">
					<h2 class="py-4">${composerName}様の詳細</h2>
				</c:if>
				<c:forEach items="${userList}" var="user">
					<div class="row">
						<div class="col-1"></div>
						<div class="col-10">
							<div class="row">
								<div class="col-md-3 col-xs-1"></div>
								<div class="col-md-3 col-xs-12 font-weight-bold text-left border-bottom border-dark">俳号</div>
								<c:if test="${composerName == null}">
									<div class="col-md-3 col-xs-12 text-right border-bottom border-dark">${name}</div>
								</c:if>
								<c:if test="${composerName != null}">
									<div class="col-md-3 col-xs-12 text-right border-bottom border-dark">${composerName}</div>
								</c:if>
								<div class="col-md-3 col-xs-1"></div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-3 col-xs-1"></div>
								<div class="col-md-3 col-xs-12 font-weight-bold text-left border-bottom border-dark">入会日時</div>
								<div class="col-md-3 col-xs-12 text-right border-bottom border-dark">
									<f:formatDate value="${user.createDate}" pattern="yyyy年M月d日" /> 
									<f:formatDate value="${user.createTime}" pattern="k時m分s秒" />
								</div>
								<div class="col-md-3 col-xs-1"></div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-3 col-xs-1"></div>
								<div class="col-md-3 col-xs-12 font-weight-bold text-left border-bottom border-dark">更新日時</div>
								<div class="col-md-3 col-xs-12 text-right border-bottom border-dark">
									<f:formatDate value="${user.updateDate}" pattern="yyyy年M月d日" /> 
									<f:formatDate value="${user.updateTime}" pattern="k時m分s秒" />
								</div>
								<div class="col-md-3 col-xs-1"></div>
							</div>
							<br>
						</div>
						<div class="col-1"></div>
					</div>
				</c:forEach>
				<details>
					<summary>これまで詠まれた歌</summary>
					<div class="bg-secondary py-1"><h3 class="whiteWord">俳句・川柳</h3></div>
					<div class="row">
						<c:forEach items="${haikuList}" var="haiku" varStatus="listNum">
							<c:if test="${listNum.count % 2 == 0}">
								<div class="col-md-4 col-xs-12 bg-light shadow list zoom">
									<div class="row lists">
										<div class="col-1"></div>
										<div class="col-1">
											<c:if test="${name == 'admin'}">
												<a href="HaikuDelete?id=${list.id}&genre=1">
													<input class="btn btn-warning shadow deleteHaiku" type="button" value="この歌を削除する">
												</a>
											</c:if>
										</div>
										<div class="col-1 text-left py-3">${haiku.strComposeDate} ${haiku.strComposeTime}</div>
										<div class="col-4">
											<p class="text-left py-3 font-weight-bold">${haiku.haiku}</p>
											<p class="text-right">${haiku.composer}</p>
										</div>
										<div class="col-2">${haiku.comment}</div>
										<div class="col-1">
											<c:if test="${name != haiku.composer}">
												<p class="text-right">
													<object>
														${haiku.good}人から<a class="linkGood" href="Good?id=${haiku.id}&genre=1">高評価</a>されました
													</object>
												</p>
											</c:if>
											<c:if test="${name == haiku.composer}">
												<p class="text-right">${haiku.good}人から高評価されました</p>
											</c:if>
										</div>
										<div class="col-2"></div>
									</div>
								</div>
							</c:if>
							<c:if test="${listNum.count % 2 != 0}">
								<div class="col-md-4 col-xs-12 bg-success shadow list zoom">
									<div class="row lists">
										<div class="col-1"></div>
										<div class="col-1">
											<c:if test="${name == 'admin'}">
												<a href="HaikuDelete?id=${list.id}&genre=1">
													<input class="btn btn-warning shadow deleteHaiku" type="button" value="この歌を削除する">
												</a>
											</c:if>
										</div>
										<div class="col-1 text-left py-3 whiteWord">${haiku.strComposeDate} ${haiku.strComposeTime}</div>
										<div class="col-4">
											<p class="text-left py-3 font-weight-bold whiteWord">${haiku.haiku}</p>
											<p class="text-right whiteWord">${haiku.composer}</p>
										</div>
										<div class="col-2 whiteWord">${haiku.comment}</div>
										<div class="col-1">
											<c:if test="${name != haiku.composer}">
												<p class="text-right whiteWord">
													<object>
														${haiku.good}人から<a class="linkGood" href="Good?id=${haiku.id}&genre=1">高評価</a>されました
													</object>
												</p>
											</c:if>
											<c:if test="${name == haiku.composer}">
												<p class="text-right whiteWord">${haiku.good}人から高評価されました</p>
											</c:if>
										</div>
										<div class="col-2"></div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<div class="bg-secondary py-1"><h3 class="whiteWord">短歌</h3></div>
					<div class="row">
						<c:forEach items="${tankaList}" var="tanka" varStatus="listNum">
							<c:if test="${listNum.count % 2 == 0}">
								<div class="col-md-4 col-xs-12 bg-light shadow list zoom">
									<div class="row lists">
										<div class="col-1"></div>
										<div class="col-1">
											<c:if test="${name == 'admin'}">
												<a href="HaikuDelete?id=${list.id}&genre=2">
													<input class="btn btn-warning shadow deleteHaiku" type="button" value="この歌を削除する">
												</a>
											</c:if>
										</div>
										<div class="col-1 text-left py-3">${tanka.strComposeDate} ${tanka.strComposeTime}</div>
										<div class="col-4">
											<p class="text-left py-3 font-weight-bold">${tanka.haiku}</p>
											<p class="text-right">${tanka.composer}</p>
										</div>
										<div class="col-2">${tanka.comment}</div>
										<div class="col-1">
											<c:if test="${name != tanka.composer}">
												<p class="text-right">
													<object>
														${tanka.good}人から<a class="linkGood" href="Good?id=${tanka.id}&genre=2">高評価</a>されました
													</object>
												</p>
											</c:if>
											<c:if test="${name == tanka.composer}">
												<p class="text-right">${tanka.good}人から高評価されました</p>
											</c:if>
										</div>
										<div class="col-2"></div>
									</div>
								</div>
							</c:if>
							<c:if test="${listNum.count % 2 != 0}">
								<div class="col-md-4 col-xs-12 bg-info shadow list zoom">
									<div class="row lists">
										<div class="col-1"></div>
										<div class="col-1">
											<c:if test="${name == 'admin'}">
												<a href="HaikuDelete?id=${list.id}&genre=2">
													<input class="btn btn-warning shadow deleteHaiku" type="button" value="この歌を削除する">
												</a>
											</c:if>
										</div>
										<div class="col-1 text-left py-3">${tanka.strComposeDate} ${tanka.strComposeTime}</div>
										<div class="col-4">
											<p class="text-left py-3 font-weight-bold">${tanka.haiku}</p>
											<p class="text-right">${tanka.composer}</p>
										</div>
										<div class="col-2">${tanka.comment}</div>
										<div class="col-1">
											<c:if test="${name != tanka.composer}">
												<p class="text-right">
													<object>
														${tanka.good}人から<a class="linkGood" href="Good?id=${tanka.id}&genre=2">高評価</a>されました
													</object>
												</p>
											</c:if>
											<c:if test="${name == tanka.composer}">
												<p class="text-right">${tanka.good}人から高評価されました</p>
											</c:if>
										</div>
										<div class="col-2"></div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<div class="bg-secondary py-1"><h3 class="whiteWord">長歌</h3></div>
					<div class="row">
						<c:forEach items="${chokaList}" var="choka" varStatus="listNum">
							<c:if test="${listNum.count % 2 == 0}">
								<div class="col-md-4 col-xs-12 bg-light shadow list zoom">
									<div class="row lists">
										<div class="col-1"></div>
										<div class="col-1">
											<c:if test="${name == 'admin'}">
												<a href="HaikuDelete?id=${list.id}&genre=3">
													<input class="btn btn-warning shadow deleteHaiku" type="button" value="この歌を削除する">
												</a>
											</c:if>
										</div>
										<div class="col-1 text-left py-3">${choka.strComposeDate} ${choka.strComposeTime}</div>
										<div class="col-4">
											<p class="text-left py-3 font-weight-bold">${choka.haiku}</p>
											<p class="text-right">${choka.composer}</p>
										</div>
										<div class="col-2">${choka.comment}</div>
										<div class="col-1">
											<c:if test="${name != choka.composer}">
												<p class="text-right">
													<object>
														${choka.good}人から<a class="linkGood" href="Good?id=${choka.id}&genre=3">高評価</a>されました
													</object>
												</p>
											</c:if>
											<c:if test="${name == choka.composer}">
												<p class="text-right">${choka.good}人から高評価されました</p>
											</c:if>
										</div>
										<div class="col-2"></div>
									</div>
								</div>
							</c:if>
							<c:if test="${listNum.count % 2 != 0}">
								<div class="col-md-4 col-xs-12 bg-warning shadow list zoom">
									<div class="row lists">
										<div class="col-1"></div>
										<div class="col-1">
											<c:if test="${name == 'admin'}">
												<a href="HaikuDelete?id=${list.id}&genre=3">
													<input class="btn btn-warning shadow deleteHaiku" type="button" value="この歌を削除する">
												</a>
											</c:if>
										</div>
										<div class="col-1 text-left py-3">${choka.strComposeDate} ${choka.strComposeTime}</div>
										<div class="col-4">
											<p class="text-left py-3 font-weight-bold">${choka.haiku}</p>
											<p class="text-right">${choka.composer}</p>
										</div>
										<div class="col-2">${choka.comment}</div>
										<div class="col-1">
											<c:if test="${name != choka.composer}">
												<p class="text-right">
													<object>
														${choka.good}人から<a class="linkGood" href="Good?id=${choka.id}&genre=3">高評価</a>されました
													</object>
												</p>
											</c:if>
											<c:if test="${name == choka.composer}">
												<p class="text-right">${choka.good}人から高評価されました</p>
											</c:if>
										</div>
										<div class="col-2"></div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<div class="bg-secondary py-1"><h3 class="whiteWord">都々逸</h3></div>
					<div class="row">
						<c:forEach items="${dodoitsuList}" var="dodoitsu" varStatus="listNum">
							<c:if test="${listNum.count % 2 == 0}">
								<div class="col-md-4 col-xs-12 bg-light shadow list zoom">
									<div class="row lists">
										<div class="col-1"></div>
										<div class="col-1">
											<c:if test="${name == 'admin'}">
												<a href="HaikuDelete?id=${list.id}&genre=4">
													<input class="btn btn-warning shadow deleteHaiku" type="button" value="この歌を削除する">
												</a>
											</c:if>
										</div>
										<div class="col-1 text-left py-3">${dodoitsu.strComposeDate} ${dodoitsu.strComposeTime}</div>
										<div class="col-4">
											<p class="text-left py-3 font-weight-bold">${dodoitsu.haiku}</p>
											<p class="text-right">${dodoitsu.composer}</p>
										</div>
										<div class="col-2">${dodoitsu.comment}</div>
										<div class="col-1">
											<c:if test="${name != dodoitsu.composer}">
												<p class="text-right">
													<object>
														${dodoitsu.good}人から<a class="linkGood" href="Good?id=${dodoitsu.id}&genre=4">高評価</a>されました
													</object>
												</p>
											</c:if>
											<c:if test="${name == dodoitsu.composer}">
												<p class="text-right">${dodoitsu.good}人から高評価されました</p>
											</c:if>
										</div>
										<div class="col-2"></div>
									</div>
								</div>
							</c:if>
							<c:if test="${listNum.count % 2 != 0}">
								<div class="col-md-4 col-xs-12 bg-danger shadow list zoom">
									<div class="col-1"></div>
										<div class="col-1">
											<c:if test="${name == 'admin'}">
												<a href="HaikuDelete?id=${list.id}&genre=4">
													<input class="btn btn-warning shadow deleteHaiku" type="button" value="この歌を削除する">
												</a>
											</c:if>
										</div>
									<div class="col-1 text-left py-3 whiteWord">${dodoitsu.strComposeDate} ${dodoitsu.strComposeTime}</div>
									<div class="col-4">
										<p class="text-left py-3 font-weight-bold whiteWord">${dodoitsu.haiku}</p>
										<p class="text-right whiteWord">${dodoitsu.composer}</p>
									</div>
									<div class="col-2 whiteWord">${dodoitsu.comment}</div>
									<div class="col-1">
											<c:if test="${name != dodoitsu.composer}">
												<p class="text-right whiteWord">
													<object>
														${dodoitsu.good}人から<a class="linkGood" href="Good?id=${dodoitsu.id}&genre=4">高評価</a>されました
													</object>
												</p>
											</c:if>
											<c:if test="${name == dodoitsu.composer}">
												<p class="text-right whiteWord">${dodoitsu.good}人から高評価されました</p>
											</c:if>
										</div>
										<div class="col-2"></div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<div class="bg-secondary py-2"><h2></h2></div>
					<p><a href="#top"><input class="btn btn-secondary shadow" type="button" value="一番上へ戻る"></a></p>
				</details>
			</c:if>
			<c:if test="${myData != null}">
				<h3 class="space">情報の更新</h3>
				<c:if test="${loginOk == null}">
					<p>情報変更</p>
					<form action="UserDetail" method="POST">
						<jsp:include page="../include/loginForm.jsp" flush="true" />
						<p class="my-4"><input class="btn btn-success btn-lg shadow" type="submit" value="認証"></p>
					</form>	
				</c:if>
				<c:if test="${loginOk != null}">
					<p>新しい情報をお教えください。</p>
					<form action="UserDetail?loginOk&id=${id}" method="POST">
						<jsp:include page="../include/createForm.jsp" flush="true" />
						<p class="my-4"><input class="btn btn-success btn-lg shadow" type="submit" value="変更"></p>
					</form>
				</c:if>
			</c:if>
			<p class="my-4"><a href="Top"><input class="btn btn-info shadow" type="button" value="戻る"></a></p>
			<c:if test="${myData != null}">
				<c:if test="${name != 'admin'}">
					<p class="space"><a href="UserDelete"><input class="btn btn-danger shadow" type="button" value="退会"></a></p>
				</c:if>
			</c:if>
		</div>
		<jsp:include page="../include/footer.jsp" flush="true" />
	</div>
</body>
</html>
