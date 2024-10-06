<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소개페이지</title>
<style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body, html {
      height: 100%;
      font-family: 'Arial', sans-serif;
      scroll-behavior: smooth;
      overflow: hidden;
    }

    .section {
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      position: relative;
      background-size: cover;
      background-position: center;
      opacity: 0;
      transition: opacity 0.5s ease;
    }

    #section1 {
      background-image: url('https://i.ibb.co/dtTfcBx/image.jpg');
      flex-direction: row;
    }

    #section2 {
      background-image: url('https://i.ibb.co/2kqFZc5/seciton2img.jpg');
      flex-direction: row-reverse;
    }

    #section3 {
      display: flex;
      flex-direction: row;
      height: 100%;
      position: relative;
    }

    #section3 .img-container {
      position: relative;
      width: 25%;
      height: 100%;
      overflow: hidden;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    #section3 .img-container h1 {
      position: absolute;
      bottom: 55%;
      left: 50%;
      transform: translateX(-50%);
      color: white;
      text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
      opacity: 0;
      transition: opacity 1s ease;
      font-size: 2rem;
    }

    #section3 .img1 {
      background-image: url('https://i.ibb.co/NNhV6SW/banner-mexico-004.jpg');
      background-size: cover;
      background-position: center;
    }

    #section3 .img2 {
      background-image: url('https://i.ibb.co/VL5SnkF/ai-generative-image-of-a-bustling-japanese-street-food-market-free-photo.jpg');
      background-size: cover;
      background-position: center;
    }

    #section3 .img3 {
      background-image: url('https://i.ibb.co/gZNn48k/asdff.jpg');
      background-size: cover;
      background-position: center;
    }

    #section3 .img4 {
      background-image: url('https://i.ibb.co/nB0jdxs/asdf.jpg');
      background-size: cover;
      background-position: center;
    }

    #section3 p {
      position: absolute;
      bottom: 10%;
      left: 50%;
      transform: translateX(-50%);
      font-size: 2.0rem;
      color: white;
      text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
      opacity: 0;
      transition: opacity 1s ease;
      text-align: center;
    }

    #section5 {
      background-image: url('https://i.ibb.co/RD9XRZg/section3img.jpg');
      flex-direction: row;
    }

    #section6 {
      background-image: url('https://i.ibb.co/RSW9j8W/section4img.jpg');
      flex-direction: row-reverse;
    }

    .content {
      width: 50%;
      text-align: center;
      padding: 20px;
      color: #fff;
      backdrop-filter: blur(2px);
      text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
    }

    .left {
      text-align: left;
      padding-left: 50px;
    }

    .right {
      text-align: right;
      padding-right: 50px;
    }
    h1{
      font-size: 3rem;
    }
    p{
      font-size: 1.5rem;
    }
    h1, p, .button {
      opacity: 0;
      transition: opacity 0.5s ease;
    }

    .button {
      margin-top: 20px;
      padding: 15px 30px;
      background-color: #ff6f61;
      color: white;
      font-size: 1.5rem;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s ease, opacity 0.5s ease;
    }

    .button:hover {
      background-color: #ff3b30;
    }
  </style>

</head>
<body>
  <div class="section" id="section1">
    <div class="content left">
      <h1>여행의 시작</h1>
      <p>프로젝트 준비, 정말 수고 많으셨습니다.</p>
      <p>이제, 그 노력의 결과를 만끽할 시간입니다.</p>
    </div>
  </div>
  
  <div class="section" id="section2">
    <div class="content right">
      <h1>목적지 탐색</h1>
      <p>당신이 꿈꿔온 여행지, 여기 있습니다.</p>
      <p>이제는 그동안의 스트레스를 잊고, 새로운 세계로의 초대를 받으세요.</p>
    </div>
  </div>
  
  <div class="section" id="section3">
    <div class="img-container img1">
      <h1>액티비티</h1>
    </div>
    <div class="img-container img2">
      <h1>음식</h1>
    </div>
    <div class="img-container img3">
      <h1>가족</h1>
    </div>
    <div class="img-container img4">
      <h1>힐링</h1>
    </div>
    <p>당신의 모든 취향이 이곳에 담겨있습니다.</p>
  </div>

  <div class="section" id="section5">
    <div class="content left">
      <h1>떠날 준비</h1>
      <p>여행을 위한 모든 준비가 완료되었습니다.</p>
      <p>기대와 설렘으로 가득 찬 순간이 다가옵니다.</p>
    </div>
  </div>

  <div class="section" id="section6">
    <div class="content right">
      <h1>잊지 못할 기억</h1>
      <p>여행 준비 다 하셨죠?</p>
      <button class="button" onclick="location.href='index.jsp'">자, 이제 예약하러 가볼까요?</button>
    </div>
  </div>

  <script>
    let currentSectionIndex = 0;
    const sections = document.querySelectorAll('.section');
    const totalSections = sections.length;
    let isScrolling = false;

    window.onload = () => {
      sections[0].style.opacity = 1;
      animateSection(0);
    };

    function animateSection(index) {
      sections[index].style.opacity = 1;

      const titles = sections[index].querySelectorAll('h1');
      const paragraphs = sections[index].querySelectorAll('p');
      const button = sections[index].querySelector('.button');

      setTimeout(() => {
        titles.forEach((title, i) => {
          setTimeout(() => {
            title.style.opacity = 1;
          }, i * 300);
        });

        paragraphs.forEach((para, i) => {
          setTimeout(() => {
            para.style.opacity = 1;
          }, (i + titles.length) * 300);
        });

        if (button) {
          setTimeout(() => {
            button.style.opacity = 1; 
          }, (titles.length + paragraphs.length) * 300 + 500);
        }
      }, 1000);
    }

    function enableScroll() {
      isScrolling = false;
    }

    window.addEventListener('wheel', (event) => {
      if (isScrolling) return;
      isScrolling = true;

      if (event.deltaY > 0 && currentSectionIndex < totalSections - 1) {
        currentSectionIndex++;
      } else if (event.deltaY < 0 && currentSectionIndex > 0) {
        currentSectionIndex--;
      }
      
      animateSection(currentSectionIndex);
      sections[currentSectionIndex].scrollIntoView({ behavior: 'smooth' });

      setTimeout(enableScroll, 1000);
    });

    let touchStartY = 0;

    window.addEventListener('touchstart', (event) => {
      touchStartY = event.touches[0].clientY;
    });

    window.addEventListener('touchmove', (event) => {
      if (isScrolling) return;
      isScrolling = true;

      let touchEndY = event.touches[0].clientY;

      if (touchStartY > touchEndY + 50 && currentSectionIndex < totalSections - 1) {
        currentSectionIndex++;
      } else if (touchStartY < touchEndY - 50 && currentSectionIndex > 0) {
        currentSectionIndex--;
      }
      
      animateSection(currentSectionIndex);
      sections[currentSectionIndex].scrollIntoView({ behavior: 'smooth' });

      setTimeout(enableScroll, 1000);
    });
  </script>
</body>

</html>