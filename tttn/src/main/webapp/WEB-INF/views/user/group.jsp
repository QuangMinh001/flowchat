<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- <link rel="stylesheet" href="style.css"> -->
<link rel="stylesheet" href="${classpath }/css-js/css/style.css">
<link rel="stylesheet" href="${classpath }/css-js/css/comment.css">
<link rel="stylesheet" href="${classpath }/css-js/css/chat-app-copy-and-change-to-comment.css"></link>
<title>Flowchat</title>
<script src="https://kit.fontawesome.com/ef7e2b893b.js"
	crossorigin="anonymous"></script>
</head>

<body>
	<nav class="navbar">
		<div class="nav-left">
			<a href="${classpath }/user/home">
				<img class="logo" src="${classpath}/StorageFolder/images/logo.png" alt="">
			</a>
			<ul class="navlogo">
				<li><img
					src="${classpath}/StorageFolder/images/notification.png"></li>
				<li><a role="button" href="${classpath }/chat-app"><img
						src="${classpath}/StorageFolder/images/inbox.png"></a></li>
				<li><img src="${classpath}/StorageFolder/images/video.png"></li>
			</ul>
		</div>
		<div class="nav-right">
			<div class="search-box">
				<img src="${classpath}/StorageFolder/images/search.png" alt="">
				<input type="text" placeholder="Search">
			</div>
			<div class="profile-image online" onclick="UserSettingToggle()">
				<img src="${classpath}/StorageFolder/images/profile-pic.png" alt="">
			</div>

		</div>
		<div class="user-settings">
			<div class="profile-darkButton">
				<div class="user-profile">
					<img src="${classpath}/StorageFolder/${userLogined.avatar }" alt="">
					<div>
						<p>${userLogined.nickname }</p>
						<a href="${classpath}/user/profile">See your profile</a>
					</div>
				</div>
				<div id="dark-button" onclick="darkModeON()">
					<span></span>
				</div>
			</div>
			<hr>
			<div class="user-profile">
				<img src="${classpath}/StorageFolder/images/feedback.png" alt="">
				<div>
					<p>Give Feedback</p>
					<a href="http://localhost:5555/contact">Help us to improve</a>
				</div>
			</div>
			<hr>
			<div class="settings-links">
				<img src="${classpath}/StorageFolder/images/setting.png" alt=""
					class="settings-icon"> <a href="#">Settings & Privary <img
					src="${classpath}/StorageFolder/images/arrow.png" alt=""></a>
			</div>

			<div class="settings-links">
				<img src="${classpath}/StorageFolder/images/help.png" alt=""
					class="settings-icon"> <a href="#">Help & Support <img
					src="${classpath}/StorageFolder/images/arrow.png" alt=""></a>
			</div>

			<div class="settings-links">
				<img src="${classpath}/StorageFolder/images/Display.png" alt=""
					class="settings-icon"> <a href="#">Display &
					Accessibility <img
					src="${classpath}/StorageFolder/images/arrow.png" alt="">
				</a>
			</div>

			<div class="settings-links">
				<img src="${classpath}/StorageFolder/images/logout.png" alt=""
					class="settings-icon"> <a href="${classpath }/logout">Logout <img
					src="${classpath}/StorageFolder/images/arrow.png" alt=""></a>
			</div>

		</div>
	</nav>

	<!-- content-area------------ -->

	<div class="container">
	
		<div class="left-sidebar">
			<div class="important-links">
				<a href="${classpath}/user/home" style="color: black"><img
					src="${classpath}/StorageFolder/images/news.png" alt="">Tin mới nhât</a> 
				<a href="${classpath}/user/friends" style="color: black"><img
					src="${classpath}/StorageFolder/images/friends.png" alt="">Bạn bè</a>
				<a href="${classpath}/user/group" style="color: black"><img
					src="${classpath}/StorageFolder/images/group.png" alt="">Nhóm</a>
				<a href="${classpath}/user/profile" style="color: black"><img
					src="${classpath}/StorageFolder/images/watch.png" alt="">Trang cá nhân</a>
				<a href="${classpath}/user/remembers" style="color: black"><img
					src="${classpath}/StorageFolder/images/video.png" alt="">Đã lưu</a>
			</div>
		</div>

		<!-- main-content------- -->

		<div class="content-area">
			<img src="${classpath}/StorageFolder/${groupFocus.avatar}" class="coverImage" alt="">
			
			<!-- =================== =================-->
			
			<sf:form class="form" action="${classpath }/user/group/post" method="post" modelAttribute="newSpost" enctype="multipart/form-data">
				<div class="write-post-container">
					<div class="user-profile">
						<img src="${classpath}/StorageFolder/${userLogined.avatar }" alt="">
						<div>
							<p>${userLogined.nickname }</p>
							<select id="protect" name="protect">
								<option value="Group">${groupFocus.groupName }</option>
							</select>
							<input id='groupId' name='groupId' value="${groupFocus.id }" type="text" style="width: 0.1px; height: 0.1px; overflow: hidden; position: absolute;"/>
						</div>
					</div>
	
					<div class="post-upload-textarea">
						<textarea name="description" id="description" placeholder="Chia sẻ vói nhóm của bạn" 
							cols="30" rows="3"></textarea>
						<div class="add-post-links">
							<label for="picture" style="cursor: pointer; "><img
									src="${classpath}/StorageFolder/images/photo.png" alt=""></label>
							<input id='picture' name='picture' type="file" style="width: 0.1px; height: 0.1px; overflow: hidden; position: absolute;"/>
							<button type="submit" style="min-width:15px; border: 2px solid black; cursor: pointer" >Đăng</button>
						</div>
					</div>
				</div>
			</sf:form>
			
			<!-- =================== =================-->
			
			
			<!--========================= mainSposts ==========================-->
			
			
             <c:forEach var="spost" items="${mainSposts }" varStatus="loop">
				<div class="status-field-container write-post-container">
					<div class="user-profile-box">
						<div class="user-profile">
							<a href="${classpath }/user/profile/${spost.user_spost.id }">
							<img src="${classpath}/StorageFolder/${spost.user_spost.avatar}"
								alt=""></a>
							<div>
								<p>${spost.user_spost.nickname }</p>
								<small>${spost.createDate }</small>
							</div>
						</div>
						<div class="dropdown">
						  <button class="dropbtn"><i class="fas fa-ellipsis-v"></i></button>
						  <div class="dropdown-content">
						  	  <c:if test="${usernameLogined == 'boss' || usernameLogined == spost.user_spost.username || userLogined.role.roleName == 'MANAGER'}">
							  	<a href="${classpath }/user/spost/group/delete/${spost.id }">Xóa</a>
							  </c:if>
							  <a href="${classpath }/user/spost/group/remember/${spost.id }">Lưu</a>
						  </div>
						</div>
					</div>
					<div class="status-field" style="">
						<p>
							${spost.description } <a href="#">#</a>
						</p>
						<img src="${classpath}/StorageFolder/${spost.picture}"
							alt="" style="max-height: 500px;object-fit: contain;">

					</div>
					<div class="post-reaction">
						<div class="activity-icons">
							<div>
								<c:choose>
									<c:when test="${spost.checkLiked(userLogined.id) }">
										<a href="${classpath }/user/group/like/${spost.id}" style="text-decoration: none;">
										<img src="${classpath}/StorageFolder/images/like-blue.png"
											alt="">${spost.getLikeQuantity() }</a>
									</c:when>
									<c:otherwise>
										<a href="${classpath }/user/group/like/${spost.id}" style="text-decoration: none;">
										<img src="${classpath}/StorageFolder/images/like.png"
											alt="">${spost.getLikeQuantity() }</a>
									</c:otherwise>
								</c:choose>
							</div>
							<div class='btn'>
								<img src="${classpath}/StorageFolder/images/comments.png" alt="">${spost.getCommentQuantity()}
							</div>
							<div>
								<img src="${classpath}/StorageFolder/images/share.png" alt="">35
							</div>
						</div>
						<div class="post-profile-picture">
							<img src="${classpath}/StorageFolder/${spost.user_spost.avatar}"
								alt=""> <i class=" fas fa-caret-down"></i>
						</div>
					</div>
				<!-- ==========================Comment box(dialog)======================== -->
				<!-- ==================================================================== -->
				
				<div class="modal">
				    <div class="modal-content">
				        <span class="close">&times;</span>
				        <p>Modal Box Content(comments)</p>
				    </div>
				</div>
				<!-- ==================================================================== -->
				<!-- ==================================================================== -->
				</div>
			</c:forEach>
		</div>

		<!-- sidebar------------ -->
		<div class="right-sidebar">
			<h3>${groupFocus.groupName }</h3>
			
			<div style="text-decoration: none; border: 1px solid green; max-width: 135px;">
 				<c:choose>
					<c:when test="${isInGroup == true}">
						<a href="${classpath }/user/group/leave/${groupFocus.id }" role="button" style="text-decoration: none; color: black">Rời nhóm</a>
					</c:when>
					<c:otherwise>
						<a href="${classpath }/user/group/join/${groupFocus.id }" role="button" style="text-decoration: none; color: black">Tham gia nhóm</a>
					</c:otherwise>
				</c:choose>
				
				
			</div>
			<input id="groupFocusId" name="groupFocusId" value="${groupFocus.id }" style="visibility: hidden"/>
			<hr/>
			<div class="heading-link">
				<h4>Recommendation</h4>
				<a href="">Remember</a>
			</div>

			<c:forEach var="group" items="${rightContentGroups }" varStatus="loop">
				<div class="online-list">
					<div class="online">
						<a href="${classpath}/user/group/${group.id }" 
						style="text-decoration: none; color: black"><img
						src="${classpath}/StorageFolder/${group.avatar }" alt="" 
						style="object-fit: cover; height: 45px"></a>						
					</div>
					<p>${group.groupName }</p>
				</div>
			</c:forEach>
		</div>
	</div>

	<script src="${classpath}/css-js/js/function.js"></script>
</body>

	 <script src="https://code.jquery.com/jquery-3.3.1.js" 
	 	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" 
	 	crossorigin="anonymous"></script>
	
	<script type="text/javascript">
	$(document).ready(function () {
		  var modal = $('.modal');
		  var btn = $('.btn');
		  var span = $('.close');

		  btn.click(function () {
		    modal.show();
		  });

		  span.click(function () {
		    modal.hide();
		  });

		  $(window).on('click', function (e) {
		    if ($(e.target).is('.modal')) {
		      modal.hide();
		    }
		  });
	});
	</script>
	

</html>