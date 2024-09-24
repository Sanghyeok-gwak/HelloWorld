<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
  <style>
    /* 메인페이지 */
    .main-popular-products,.main-popular-imminent{
      margin-top: 100px;
    }
    .main-popular-products-sub, .main-popular-imminent-sub{
      display: flex;
      justify-content: center;
    }
    .main-popular-products-text,.main-popular-imminent-text,.main-event-text{
      text-align: center;
      margin-bottom: 10px;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .main-deadline-imminent,.main-event{
      margin-top: 50px;
    }
    .main-event{
    	margin-bottom: 200px;
    }
  </style>
	<body>
					<%@ include file="/views/common/header.jsp" %>
					 <section>
					 <div id="main-top" class="carousel slide" data-ride="carousel">
		
		        <!-- Indicators -->
		        <ul class="carousel-indicators">
		          <li data-target="#main-top" data-slide-to="0" class="active"></li>
		          <li data-target="#main-top" data-slide-to="1"></li>
		          <li data-target="#main-top" data-slide-to="2"></li>
		        </ul>
		      
		        <!-- The slideshow -->
		        <div class="carousel-inner">
		          <div class="carousel-item active">
		            <img src="./assets/image/imgTest.jpeg" width="100%" height="400px" alt="Los Angeles">
		          </div>
		          <div class="carousel-item">
		            <img src="./assets/image/imgTest.jpeg" width="100%" height="400px" alt="Chicago">
		          </div>
		          <div class="carousel-item">
		            <img src="./assets/image/imgTest.jpeg" width="100%" height="400px" alt="New York">
		          </div>
		        </div>
		      
		        <!-- Left and right controls -->
		        <a class="carousel-control-prev" href="#main-top" data-slide="prev">
		          <span class="carousel-control-prev-icon"></span>
		        </a>
		        <a class="carousel-control-next" href="#main-top" data-slide="next">
		          <span class="carousel-control-next-icon"></span>
		        </a>
		      
		      </div>
	  <div class="helloworld-main-sub">
	    <div class="main-popular-products">
	      <div class="main-popular-products-text">
	      	<img src="./assets/image/fire.gif" alt="fire" width="100px" height="100px">
	      		<h3>인기상품</h3>
	      </div>
	      <div class="main-popular-products-sub">
		      <div class="card" style="width:250px;">
		        <img class="card-img-top" src="./assets/image/imgTest.jpeg" alt="Card image">
			        <div class="card-body">
			          <h4 class="card-title">John Doe</h4>
			          <p class="card-text"><h5>Some example text.</h5></p>
			          <p class="card-text"><h5>999,999,999</h5></p>
			       </div>
	      </div>
	      <div class="card" style="width:250px; margin-left: 10px; margin-right: 10px;">
	        <img class="card-img-top" src="./assets/image/imgTest.jpeg" alt="Card image">
		        <div class="card-body">
		          <h4 class="card-title">John Doe</h4>
		          <p class="card-text"><h5>Some example text.</h5></p>
		          <p class="card-text"><h5>999,999,999</h5></p>
		        </div>
	      </div>
	      <div class="card" style="width:250px">
	        <img class="card-img-top" src="./assets/image/imgTest.jpeg" alt="Card image">
		        <div class="card-body">
		          <h4 class="card-title">John Doe</h4>
		          <p class="card-text"><h5>Some example text.</h5></p>
		          <p class="card-text"><h5>999,999,999</h5></p>
		        </div>
	      </div>
	    </div>
	  </div>

    <!------------------------------------------------------------------------------------------------------------->  
    <div class="main-deadline-imminent">
      <div class="main-popular-imminent-text">
	      <img src="./assets/image/time.gif" alt="fire" width="100px" height="100px">
	      <h3>마감임박</h3>
      </div>
      
     <div class="main-popular-imminent-sub">
      <div class="card" style="width:250px;">
       <img class="card-img-top" src="./assets/image/imgTest.jpeg" alt="Card image">
        <div class="card-body">
          <h4 class="card-title">John Doe</h4>
          <p class="card-text"><h5>Some example text.</h5></p>
          <p class="card-text"><h5>999,999,999</h5></p>
        </div>
      </div>
      <div class="card" style="width:250px; margin-left: 10px; margin-right: 10px;">
       <img class="card-img-top" src="./assets/image/imgTest.jpeg" alt="Card image">
        <div class="card-body">
         <h4 class="card-title">John Doe</h4>
         <p class="card-text"><h5>Some example text.</h5></p>
         <p class="card-text"><h5>999,999,999</h5></p>
        </div>
      </div>
      <div class="card" style="width:250px">
       <img class="card-img-top" src="./assets/image/imgTest.jpeg" alt="Card image">
	       <div class="card-body">
	         <h4 class="card-title">John Doe</h4>
	         <p class="card-text"><h5>Some example text.</h5></p>
	         <p class="card-text"><h5>999,999,999</h5></p>
	       </div>
      </div>
    </div>
    <!------------------------------------------------------------------------------------------------------------->  
    <div class="main-event">
     <div class="main-event-text">
      <img src="./assets/image/gift.gif" alt="fire" width="100px" height="100px">
      <h3>이벤트</h3>
     </div>
    <div class="main-popular-products-sub">
      <div class="card" style="width:250px;">
       <img class="card-img-top" src="./assets/image/imgTest.jpeg" alt="Card image">
        <div class="card-body">
         <h4 class="card-title">John Doe</h4>
         <p class="card-text"><h5>Some example text.</h5></p>
         <p class="card-text"><h5>999,999,999</h5></p>
        </div>
      </div>
      <div class="card" style="width:250px; margin-left: 10px; margin-right: 10px;">
       <img class="card-img-top" src="./assets/image/imgTest.jpeg" alt="Card image">
        <div class="card-body">
          <h4 class="card-title">John Doe</h4>
          <p class="card-text"><h5>Some example text.</h5></p>
          <p class="card-text"><h5>999,999,999</h5></p>
        </div>
       </div>
      <div class="card" style="width:250px">
       <img class="card-img-top" src="./assets/image/imgTest.jpeg" alt="Card image">
        <div class="card-body">
         <h4 class="card-title">John Doe</h4>
         <p class="card-text"><h5>Some example text.</h5></p>
         <p class="card-text"><h5>999,999,999</h5></p>
        </div>
      </div>
      
      
      
		    </div>
		  </div>
		</div>
		</div>
			 
			 
			 </section>
			<%@ include file="/views/common/footer.jsp" %>
</body>
</html>