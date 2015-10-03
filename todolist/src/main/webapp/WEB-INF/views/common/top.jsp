<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<title>할 일 관리 웹사이트</title>
</head>
<body>


	<!-- 로그인, 회원가입 버튼 유효성 검사 스크립트  -->
	<script>
		$(document)
				.ready(
						function() {
							$("#register")
									.click(
											function() {
												var id = $("#registerid").val();
												var pw = $("#password").val();
												var pwc = $("#passwordconfirm")
														.val();
												if (id == "") {
													$("#messagebox")
															.attr('class',
																	'alert alert-danger show');
													$("#message").text(
															"아이디를 입력하세요");
													$("#member_email").focus();
													exit;

												} else if (pw == "") {
													$("#messagebox")
															.attr('class',
																	'alert alert-danger show');
													$("#message").text(
															"비밀번호를 입력하세요");
													$("#password").val("");
													$("#passwordconfirm").val(
															"");
													$("#password").focus();
													exit;

												} else if (pwc == "") {
													$("#messagebox")
															.attr('class',
																	'alert alert-danger show');
													$("#message").text(
															"비밀번호 확인을 입력하세요");
													$("#password").val("");
													$("#passwordconfirm").val(
															"");
													$("#passwordconfirm")
															.focus();
													exit;
												} else if (pw != pwc) {
													$("#messagebox")
															.attr('class',
																	'alert alert-danger show');
													$("#message").text(
															"비밀번호가 일치하지 않습니다.");
													$("#password").val("");
													$("#passwordconfirm").val(
															"");
													$("#password").focus();
													exit;
												} else if (!(id >= '0' && id <= '9')
														&& !(id >= 'a' && id <= 'z')) {
													$("#messagebox")
															.attr('class',
																	'alert alert-danger show');
													$("#message")
															.text(
																	"아이디는 숫자와 소문자만 가능합니다.");
													$("#member_email").val("");
													$("#member_email").focus();
													exit;
												} else if (id.indexOf(" ") >= 0) {
													$("#messagebox")
															.attr('class',
																	'alert alert-danger show');
													$("#message")
															.text(
																	"아이디에 공백을 사용할 수 없습니다.");
													$("#member_email").val("");
													$("#member_email").focus();
													exit;
												} else if (id.length<5 || id.length>12) {
													$("#messagebox")
															.attr('class',
																	'alert alert-danger show');
													$("#message")
															.text(
																	"아이디는 5~12자로 입력하세요");
													$("#member_email").val("");
													$("#member_email").focus();
													exit;
												} else if (pw.length<6 || pw.length>20) {
													$("#messagebox")
															.attr('class',
																	'alert alert-danger show');
													$("#message")
															.text(
																	"패스워드는 6~20자로 입력하세요");
													$("#password").val("");
													$("#passwordconfirm").val(
															"");
													$("#password").focus();
													exit;
												}
												$
														.getJSON(
																"/idCheck?id="
																		+ $(
																				"#registerid")
																				.val(),
																function(data) {
																	if (data.check == '0') {
																		$(
																				"#registerform")
																				.submit();
																	} else {
																		$(
																				"#messagebox")
																				.attr(
																						'class',
																						'alert alert-danger show');
																		$(
																				"#message")
																				.text(
																						"중복되는 아이디가 있습니다.");
																		$(
																				"#registerid")
																				.val(
																						"");
																		document.register.registerid
																				.focus();
																		exit;
																	}
																});
											});
							$("#loginbtn")
									.click(
											function() {
												$
														.getJSON(
																"/loginCheck?id="
																		+ $(
																				"#id")
																				.val()
																		+ "&password="
																		+ $(
																				"#pw")
																				.val(),
																function(data) {
																	if (data.check == '1') {
																		$(
																				"#loginform")
																				.submit();
																	} else {
																		$(
																				"#messagebox")
																				.attr(
																						'class',
																						'alert alert-danger show');
																		$(
																				"#message")
																				.text(
																						"없는 계정이거나 잘못된 정보입니다.");
																		exit;
																	}
																});

											});
						});
	</script>


	<%
		if (session.getAttribute("isLoged") == null || session.getAttribute("isLoged").equals("false")) {
	%>
	<c:set var='loged' value='false' />
	<%
		} else {
	%>
	<c:set var='loged' value='true' />
	<%
		}
	%>


	<c:if test="${loged==false}">
		<!--로그인 -->
		<div class="modal fade" id="login" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div id="messagebox" class="alert alert-danger hidden" role="alert">
						<span class="glyphicon glyphicon-exclamation-sign"
							aria-hidden="true"></span> <span id="message"></span>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-sm-6">
								<form class="form-horizontal" name="login" id="loginform"
									action="/login" method="post">
									<div class="form-group">
										<div class="col-sm-10">
											<h4>가입한 계정으로 로그인</h4>
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-10">
											<input type="text" class="form-control" id='id' name="id"
												placeholder="가입하신 ID">
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-10">
											<input type="password" class="form-control" id='pw' name="pw"
												placeholder="비밀번호 입력">
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-10">
											<button type="button" id="loginbtn" class="btn btn-primary">로그인</button>
										</div>
									</div>
								</form>
							</div>
							<div class="col-sm-6">
								<form class="form-horizontal" name="register" id="registerform"
									action="/register" method="post">
									<div class="form-group">
										<div class="col-sm-10">
											<h4>새로운 계정 만들기</h4>
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-10">
											<input type="text" class="form-control" name="registerid"
												id="registerid" placeholder="사용할 ID를 입력하세요" maxlength="25">
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-10">
											<input type="password" class="form-control" id="password"
												name="password" placeholder="비밀번호" maxlength="25">
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-10">
											<input type="password" class="form-control"
												id="passwordconfirm" name="passwordconfirm"
												placeholder="비밀번호 확인">
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-10">
											<button type="button" id="register" class="btn btn-primary">회원가입</button>
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="modal-footer"></div>
					</div>
				</div>
			</div>
		</div>
	</c:if>


	<!-- 네비게이션	 -->
	<nav class="navbar navbar-inverse"
		style="margin-bottom: 0px; border: 0px; min-height: 60px">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-9">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="">ToDo List</a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-9">
				<ul class="nav navbar-nav">
					<c:if test="${loged==false}">
						<li><a href="#" data-toggle="modal" data-target="#login"><strong>로그인</strong></a></li>
					</c:if>
					<c:if test="${loged==true}">
						<li><a href="/naverLogout.go"><strong>${sessionScope.email}</strong>
								로그아웃</a></li>
					</c:if>
				</ul>
			</div>
		</div>

	</nav>