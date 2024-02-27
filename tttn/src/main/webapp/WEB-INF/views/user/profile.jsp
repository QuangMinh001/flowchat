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
					<img src="${classpath}/StorageFolder/images/profile-pic.png" alt="">
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

	<!-- profile-page-------------------------- -->


    <div class="profile-container">
        <img src="${classpath}/StorageFolder/images/cover.png" class="coverImage" alt="">
        <div class="dashboard">
            <div class="left-dashboard">
                <img src="${classpath}/StorageFolder/${userFocus.avatar}" class="dashboard-img" alt="">
                <div class="left-dashboard-info">
                    <h3>${userFocus.nickname }</h3>
                    <p>120 Friends - 20 mutuals</p>
                    <div class="mutual-friend-images">
                        <img src="${classpath}/StorageFolder/images/member-1.png" alt="">
                        <img src="${classpath}/StorageFolder/images/member-2.png" alt="">
                        <img src="${classpath}/StorageFolder/images/member-3.png" alt="">
                        <img src="${classpath}/StorageFolder/images/member-5.png" alt="">
                    </div>
                </div>
            </div>
            <div class="right-dashboard-info">
                <div class="right-dashboard-info-top">
	                <c:choose>
						<c:when test="${userFocus.username == usernameLogined }">
							<a href="${classpath }/chat-app"><button type="button"><i class="far fa-envelope"></i> Tin nhắn</button></a>
						</c:when>
						<c:otherwise>
							<a href="${classpath }/chat-app"><button type="button"><i class="far fa-envelope"></i> Tin nhắn</button></a>
							<c:if test="${isFriend == false}">
								<a href="${classpath }/user/friend/${userFocus.id}"><button type="button"><i class="fas fa-user-plus"></i>Theo dõi</button></a>
							</c:if>
						</c:otherwise>
					</c:choose>
                </div>
                <div class="right-div-single-logo"><a href="#"> <i class="fas fa-ellipsis-h"></i></a></div>
            </div>
        </div>


        <div class="container content-profile-container">
            <div class="left-sidebar profile-left-sidebar">
                <div class="left-profile-sidebar-top">
                    <div class="intro-bio">
                        <h4>intro</h4>
                        <p>${userFocus.description } <i class="far fa-smile-beam"></i></p>
                        <hr>
                    </div>
                </div>

                <div class="left-profile-sidebar-top gallery">
                    <div class="heading-link profile-heading-link">
                        <h4>Photos</h4>
                        <a href="">All Photos</a>
                    </div>

                    <div class="gallery-photos">
                        <div class="gallery-photos-rowFirst">
                            <img src="${classpath}/StorageFolder/images/photo1.png" alt="">
                            <img src="${classpath}/StorageFolder/images/photo2.png" alt="">
                            <img src="${classpath}/StorageFolder/images/photo3.png" alt="">
                    
                            <img src="${classpath}/StorageFolder/images/photo4.png" alt="">
                            <img src="${classpath}/StorageFolder/images/photo5.png" alt="">
                            <img src="${classpath}/StorageFolder/images/photo6.png" alt="">
                        </div>
                    </div>
                </div>

                <div class="left-profile-sidebar-top gallery">
                    <div class="heading-link profile-heading-link">
                        <h4>Friends</h4>
                        <a href="">All Friends</a>
                    </div>

                    <div class="gallery-photos">
                        <div class="gallery-photos-rowFirst">
                            <div class="first-friend">
                                <img src="${classpath}/StorageFolder/images/member-1.png" alt="">
                                <p>Nathan M</p>
                            </div>
                            <div class="second-friend">
                                <img src="${classpath}/StorageFolder/images/member-2.png" alt="">
                                <p>Joseph N</p>
                            </div>
                            <div class="third-friend">
                                <img src="${classpath}/StorageFolder/images/member-3.png" alt="">
                                <p>Blondie K</p>
                            </div>
                            <div class="forth-friend">
                                <img src="${classpath}/StorageFolder/images/member-4.png" alt="">
                                <p>Jonathon J</p>
                            </div>
                            <div class="fifth-friend">
                                <img src="${classpath}/StorageFolder/images/member-5.png" alt="">
                                <p>Mark K</p>
                            </div>
                            <div class="sixth-friend">
                                <img src="${classpath}/StorageFolder/images/member-6.png" alt="">
                                <p>Emilia M</p>
                            </div>
                            <div class="seventh-friend">
                                <img src="${classpath}/StorageFolder/images/member-7.png" alt="">
                                <p>Max P</p>
                            </div>
                            <div class="eighth-friend">
                                <img src="${classpath}/StorageFolder/images/member-8.png" alt="">
                                <p>Layla M</p>
                            </div>
                            <div class="ninth-friend">
                                <img src="${classpath}/StorageFolder/images/member-9.png" alt="">
                                <p>Edward M</p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <!-- main-content------- -->

            <div class="content-area profile-content-area">
                <!-- =================== =================-->
				<sf:form class="form" action="${classpath }/user/post" method="post" modelAttribute="newSpost" enctype="multipart/form-data">
					<div class="write-post-container">
						<div class="user-profile">
							<img src="${classpath}/StorageFolder/${userFocus.avatar }" alt="">
							<div>
								<p>${userFocus.nickname }</p>
								<select id="protect" name="protect">
									<option value="Public">Công khai <i class="fas fa-caret-down"></i></option>
									<option value="Private">Riêng tư <i class="fas fa-caret-down"></i></option>
								</select>
							</div>
						</div>
						<div class="post-upload-textarea">
							<textarea name="description" id="description" placeholder="What's on your mind, Alex?" 
								cols="30" rows="3"></textarea>
							<div class="add-post-links">
								<label for="picture" style="cursor: pointer; "><img
									src="${classpath}/StorageFolder/images/photo.png" alt=""></label>
								<input id='picture' name='picture' type="file" 
									style="width: 0.1px; height: 0.1px; overflow: hidden; position: absolute;" multiple="multiple"/>
								<button type="submit" style="min-width:15px; border: 2px solid black; cursor: pointer" >Đăng</button>
							</div>
						</div>
					</div>
				</sf:form>
				
				<!-- =================== =================-->

             <c:forEach var="spost" items="${mainSposts }" varStatus="loop">
				<div class="status-field-container write-post-container">
					<div class="user-profile-box">
						<div class="user-profile">
							<img src="${classpath}/StorageFolder/${spost.user_spost.avatar}"
								alt="">
							<div>
								<p>${spost.user_spost.nickname }</p>
								<small>${spost.createDate }</small>
							</div>
						</div>
						<div>
							<a href="#"><i class="fas fa-ellipsis-v"></i></a>
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
									<a href="${classpath }/user/profile/like/${spost.id}">
										<img src="${classpath}/StorageFolder/images/like-blue.png"
										alt="">${spost.getLikeQuantity() }</a>
								</c:when>						
								<c:otherwise>
									<a href="${classpath }/user/profile/like/${spost.id}">
										<img src="${classpath}/StorageFolder/images/like.png"
										alt="">${spost.getLikeQuantity() }</a>
								</c:otherwise>
							</c:choose>
							</div>
							<div class='btn'>
								<img src="${classpath}/StorageFolder/images/comments.png" 
								alt="">${spost.getCommentQuantity() }
							</div>
							<div>
								<img src="${classpath}/StorageFolder/images/share.png" alt="">35
							</div>
						</div>
						<div class="post-profile-picture">
							<img src="${classpath}/StorageFolder/images/profile-pic.png "
								alt=""> <i class=" fas fa-caret-down"></i>
						</div>
					</div>
				<!-- ==========================Comment box(dialog)======================== -->
				<!-- ==================================================================== -->
				
				<div class="modal">
				    <div class="modal-content">
				        <span class="close">&times;</span>
				        <p>Bình luận về bài viết của ${spost.user_spost.nickname }</p>
				    </div>
				</div>
				<!-- ==================================================================== -->
				<!-- ==================================================================== -->
				</div>
			</c:forEach>
                <button type="button" class="btn-LoadMore" onclick="LoadMoreToggle()">Load More</button>
            </div>
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