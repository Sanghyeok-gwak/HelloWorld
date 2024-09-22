<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style> 
    @import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css');

.JJIMList {
        display: flex;

      }

      .JJIMList-side {
        width: 15%;
        display: flex;
        flex-direction: column;
      }

      .JJIMList-side-user {
        height: 50%;
      }

      .JJIMList-side-btn {
        height: 50%;
      }

      .JJIMList-list {
        width: 85%;
        margin-left: 20px;
        border-left: 1px solid lightgrey;
        padding-left: 20px;
      }

      .JJIMList-list-text-box {
        display: flex;
        justify-content: space-between;
      }

      .mb-3 a {
        color: black;
      }

      .JJIMList-list-main-item {
        flex-grow: 1;
        padding-left: 20px;
      }

      .product-card {
        border: 1px solid #ddd;
        border-radius: 10px;
        display: flex;
        overflow: hidden;
        position: relative;
        /* Add this */
        width: 900px;
        height: 230px;
      }

      .product-card img {
        width: 40%;
        height: auto;
        object-fit: cover;
      }

      .product-card .card-body {
        padding: 15px;
        width: 60%;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
      }

      .product-card .btn {
        width: auto;
        font-size: 14px;
        padding: 5px 10px;
        margin-top: 10px;
        align-self: flex-end;
      }

      /* Heart Icon Styles */
      .heart {
        position: absolute;
        top: 10px;
        /* Adjust as needed */
        right: 10px;
        /* Adjust as needed */
        color: red;
        font-size: 24px;
        cursor: pointer;
      }

      .pagination {
        justify-content: center;
      }

      .pagination .page-link {
        font-size: 22px;
        /* 버튼의 텍스트 크기 */
      }

      .pagination .page-item.active .page-link {
        background-color: #007AFF;
        /* 활성화된 버튼 배경색 */
        border-color: #007AFF;
        /* 활성화된 버튼 테두리 색상 */
        color: white;
        /* 활성화된 버튼의 텍스트 색상 */
      }

      .pagination .page-link:hover {
        background-color: #0056b3;
        /* 버튼 호버 시 배경색 */
        color: white;
        /* 버튼 호버 시 텍스트 색상 */
      }

      .product-font {

        text-decoration: none !important;
        color: black;
      }

      .product-font :hover {
        color: #007AFF;
      }

      .list-main {
        display: flex;
        align-items: center;
        justify-content: center;
      }

      .content-2 {
        flex-grow: 1;
        padding: 15px;
      }


      .content p {
        font-size: 16px;
        margin-bottom: 20px;
      }
      .correction tr td h5 a {
        text-decoration: none !important;
        color: black;
      }
      .correction tr td h5 a:hover {
        color: #007AFF;
      }

      .correction {
        width: 100%;
        border-collapse: collapse;
      }
      .correction
      th,
      td {
        border: 1px solid lightgray;
        padding: 10px;
        text-align: center;
      }
      .correction
      th {
        background-color: #ffffff;
      }

      .actions {
        text-align: center;
      }

      .modal-footer {
        display: block;
      }
      .list-main {
        display: flex;
        align-items: center;
        justify-content: center;
      }

      .content-2 {
        text-align: center;
        margin: 300px;
        color: lightgray;
      }

      .content-2 p {
        font-size: 16px;
        margin-bottom: 20px;
      }
    </style>
    <!-- 찜하기(하트) 활성화 하는 부분 -->
    <script>
      function run() {
        if (confirm('리뷰 내용을 삭제하시겠습니까?') == true) {
          document.run.submit();
        } else {
          return false;
        }
      }
    </script>
<body>
<%@ include file="/views/common/header.jsp" %>

	   <section>
      <div class="JJIMList">
        <div class="JJIMList-side">
          <div class="JJIMList-side-user">
            <div class="card mb-4">
              <div class="card-body">
                <h5 class="card-title">이준님<br>WELCOME</h5>
                <p class="card-text">
                <h5><a href="#" style="color: gray; text-decoration-line: none;">내정보 관리<i class="fa-solid fa-play">
                </h5></i></a></p>
                <p>
                <h5>적립금 0P</h5>
                </p>
              </div>
            </div>
          </div>
          <div class="JJIMList-side-btn">
            <div class="card">
              <div class="card-body" style="padding-bottom: 5px;">
                <ul class="list-unstyled">
                  <li class="mb-3">
                    <a href="#">
                      <h5>예약 / 결제</h5>
                    </a>
                  </li>
                  <li class="mb-3">
                    <a href="#">
                      <h5>찜</h5>
                    </a>
                  </li>
                  <li class="mb-3">
                    <a href="#">
                      <h5>리뷰</h5>
                    </a>
                  </li>
                  <li class="mb-3">
                    <a href="#">
                      <h5>고객센터</h5>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="JJIMList-list">
          <div class="JJIMList-list-text-box">
            <div class="JJIMList-list-text">
              <span style="font-size: 24px;">내가 작성한 리뷰</span>
            </div>

          </div>
          <hr>
          <div class="JJIMList-list-main-item">
            <!-- 여기채우세요 -->
             <div class="list-main">
               <!-- <div class="content-2">
                <p>
                <h5>리뷰 내용이 없습니다</h5>
                <i class="fa-solid fa-circle-exclamation" style="font-size: 100px;"></i>
                </p>
                
              </div>    -->
           
            <!-- table start -->
             <div class="content" style="width: 100%; margin-bottom: 16px;">
              <table border="1" class="correction">
                <tr>
                  <th>항목</th>
                  <th colspan="4" style="width: 200px;">이용하신 상품명</th>
                  <th>수정/삭제</th>
                </tr>
                <tr>
                  <td>1</td>
                  <td colspan="4" style="width: 200px;">
                    <h5><a href="#">유럽4국, 대한항공, 프라하 시내호텔 2연박 포함 전일정 4성, 프라하 필스너 양조장 레스토랑</a></h5>
                  </td>
                  <td class="actions">
                    <button type="button" class="btn" data-toggle="modal" data-target="#myModal">
                      <i class="fa-solid fa-pen" alt="수정"></i>
                    </button>

                    <div class="modal" id="myModal">
                      <div class="modal-dialog">
                        <div class="modal-content">

                          <div class="modal-header">
                            <h4 class="modal-title">가족 첫 패키지 여행 성공적</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                          </div>

                          <div class="modal-body">
                            후기가 좋은 이유를 알겠네요. 더운 날씨에 잠깐의 이동도 힘들고 짜증 날 수 있는데 패키지여서 짧은 시간에
                            관광지 다 볼 수 있어서 좋았어요
                          </div>

                          <div class="modal-footer">
                            <button type="button" id="btn-1" class="btn" data-dismiss="modal">수정하기</button>
                          </div>

                        </div>
                      </div>
                    </div>
                    <button id="delete" onclick="run();" style="border:none; background-color: #ffffff;"> <i
                        class="fa-solid fa-trash-can" alt="삭제"></i></button>
                  </td>
                </tr>
                <tr>
                  <td>2</td>
                  <td colspan="4" style="width: 200px;">
                    <h5><a href="#" >유럽4국, 대한항공, 프라하 시내호텔 2연박 포함 전일정 4성, 프라하 필스너 양조장 레스토랑</a></h5>
                  </td>
                  <td class="actions">
                    <button type="button" class="btn" data-toggle="modal" data-target="#myModal">
                      <i class="fa-solid fa-pen" alt="수정"></i>
                    </button>

                    <div class="modal" id="myModal">
                      <div class="modal-dialog">
                        <div class="modal-content">

                          <div class="modal-header">
                            <h4 class="modal-title">가족 첫 패키지 여행 성공적</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                          </div>

                          <div class="modal-body">
                            후기가 좋은 이유를 알겠네요. 더운 날씨에 잠깐의 이동도 힘들고 짜증 날 수 있는데 패키지여서 짧은 시간에
                            관광지 다 볼 수 있어서 좋았어요
                          </div>

                          <div class="modal-footer">
                            <button type="button" id="btn-1" class="btn" data-dismiss="modal">수정하기</button>
                          </div>

                        </div>
                      </div>
                    </div>
                    <button id="delete" onclick="run();" style="border:none; background-color: #ffffff;"> <i
                        class="fa-solid fa-trash-can" alt="삭제"></i></button>
                  </td>
                </tr>
                <tr>
                  <td>3</td>
                  <td colspan="4" style="width: 200px;">
                    <h5><a href="#">유럽4국, 대한항공, 프라하 시내호텔 2연박 포함 전일정 4성, 프라하 필스너 양조장 레스토랑</a></h5>
                  </td>
                  <td class="actions">
                    <button type="button" class="btn" data-toggle="modal" data-target="#myModal">
                      <i class="fa-solid fa-pen" alt="수정"></i>
                    </button>

                    <div class="modal" id="myModal">
                      <div class="modal-dialog">
                        <div class="modal-content">

                          <div class="modal-header">
                            <h4 class="modal-title">가족 첫 패키지 여행 성공적</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                          </div>

                          <div class="modal-body">
                            후기가 좋은 이유를 알겠네요. 더운 날씨에 잠깐의 이동도 힘들고 짜증 날 수 있는데 패키지여서 짧은 시간에
                            관광지 다 볼 수 있어서 좋았어요
                          </div>

                          <div class="modal-footer">
                            <button type="button" id="btn-1" class="btn" data-dismiss="modal">수정하기</button>
                          </div>

                        </div>
                      </div>
                    </div>
                    <button id="delete" onclick="run();" style="border:none; background-color: #ffffff;"> <i
                        class="fa-solid fa-trash-can" alt="삭제"></i></button>
                  </td>
                </tr>
                <tr>
                  <td>4</td>
                  <td colspan="4" style="width: 200px;">
                    <h5><a href="#">유럽4국, 대한항공, 프라하 시내호텔 2연박 포함 전일정 4성, 프라하 필스너 양조장 레스토랑</a></h5>
                  </td>
                  <td class="actions">
                    <button type="button" class="btn" data-toggle="modal" data-target="#myModal">
                      <i class="fa-solid fa-pen" alt="수정"></i>
                    </button>

                    <div class="modal" id="myModal">
                      <div class="modal-dialog">
                        <div class="modal-content">

                          <div class="modal-header">
                            <h4 class="modal-title">가족 첫 패키지 여행 성공적</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                          </div>

                          <div class="modal-body">
                            후기가 좋은 이유를 알겠네요. 더운 날씨에 잠깐의 이동도 힘들고 짜증 날 수 있는데 패키지여서 짧은 시간에
                            관광지 다 볼 수 있어서 좋았어요
                          </div>

                          <div class="modal-footer">
                            <button type="button" id="btn-1" class="btn" data-dismiss="modal">수정하기</button>
                          </div>

                        </div>
                      </div>
                    </div>
                    <button id="delete" onclick="run();" style="border:none; background-color: #ffffff;"> <i
                        class="fa-solid fa-trash-can" alt="삭제"></i></button>
                  </td>
                </tr>
                <tr>
                  <td>5</td>
                  <td colspan="4" style="width: 200px;">
                    <h5><a href="#">유럽4국, 대한항공, 프라하 시내호텔 2연박 포함 전일정 4성, 프라하 필스너 양조장 레스토랑</a></h5>
                  </td>
                  <td class="actions">
                    <button type="button" class="btn" data-toggle="modal" data-target="#myModal">
                      <i class="fa-solid fa-pen" alt="수정"></i>
                    </button>

                    <div class="modal" id="myModal">
                      <div class="modal-dialog">
                        <div class="modal-content">

                          <div class="modal-header">
                            <h4 class="modal-title">가족 첫 패키지 여행 성공적</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                          </div>

                          <div class="modal-body">
                            후기가 좋은 이유를 알겠네요. 더운 날씨에 잠깐의 이동도 힘들고 짜증 날 수 있는데 패키지여서 짧은 시간에
                            관광지 다 볼 수 있어서 좋았어요
                          </div>

                          <div class="modal-footer">
                            <button type="button" id="btn-1" class="btn" data-dismiss="modal">수정하기</button>
                          </div>

                        </div>
                      </div>
                    </div>
                    <button id="delete" onclick="run();" style="border:none; background-color: #ffffff;"> <i
                        class="fa-solid fa-trash-can" alt="삭제"></i></button>
                  </td>
                </tr>
                <tr>
                  <td>6</td>
                  <td colspan="4" style="width: 200px;">
                    <h5><a href="#">유럽4국, 대한항공, 프라하 시내호텔 2연박 포함 전일정 4성, 프라하 필스너 양조장 레스토랑</a></h5>
                  </td>
                  <td class="actions">
                    <button type="button" class="btn" data-toggle="modal" data-target="#myModal">
                      <i class="fa-solid fa-pen" alt="수정"></i>
                    </button>

                    <div class="modal" id="myModal">
                      <div class="modal-dialog">
                        <div class="modal-content">

                          <div class="modal-header">
                            <h4 class="modal-title">가족 첫 패키지 여행 성공적</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                          </div>

                          <div class="modal-body">
                            후기가 좋은 이유를 알겠네요. 더운 날씨에 잠깐의 이동도 힘들고 짜증 날 수 있는데 패키지여서 짧은 시간에
                            관광지 다 볼 수 있어서 좋았어요
                          </div>

                          <div class="modal-footer">
                            <button type="button" id="btn-1" class="btn" data-dismiss="modal">수정하기</button>
                          </div>

                        </div>
                      </div>
                    </div>
                    <button id="delete" onclick="run();" style="border:none; background-color: #ffffff;"> <i
                        class="fa-solid fa-trash-can" alt="삭제"></i></button>
                  </td>
                </tr>
                <tr>
                  <td>7</td>
                  <td colspan="4" style="width: 200px;">
                    <h5><a href="#">유럽4국, 대한항공, 프라하 시내호텔 2연박 포함 전일정 4성, 프라하 필스너 양조장 레스토랑</a></h5>
                  </td>
                  <td class="actions">
                    <button type="button" class="btn" data-toggle="modal" data-target="#myModal">
                      <i class="fa-solid fa-pen" alt="수정"></i>
                    </button>

                    <div class="modal" id="myModal">
                      <div class="modal-dialog">
                        <div class="modal-content">

                          <div class="modal-header">
                            <h4 class="modal-title">가족 첫 패키지 여행 성공적</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                          </div>

                          <div class="modal-body">
                            후기가 좋은 이유를 알겠네요. 더운 날씨에 잠깐의 이동도 힘들고 짜증 날 수 있는데 패키지여서 짧은 시간에
                            관광지 다 볼 수 있어서 좋았어요
                          </div>

                          <div class="modal-footer">
                            <button id="delete" onclick="run();" style="border:none; background-color: #ffffff;"> <i
                                class="fa-solid fa-trash-can" alt="삭제"></i></button>
                          </div>

                        </div>
                      </div>
                    </div>
                    </button>

                    <div class="modal" id="myModal">
                      <div class="modal-dialog">
                        <div class="modal-content">

                          <div class="modal-header">
                            <h4 class="modal-title">가족 첫 패키지 여행 성공적</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                          </div>

                          <div class="modal-body">
                            후기가 좋은 이유를 알겠네요. 더운 날씨에 잠깐의 이동도 힘들고 짜증 날 수 있는데 패키지여서 짧은 시간에
                            관광지 다 볼 수 있어서 좋았어요
                          </div>

                          <div class="modal-footer">
                            <button type="button" id="btn-1" class="btn" data-dismiss="modal">수정하기</button>
                          </div>

                        </div>
                      </div>
                    </div>
                    <button id="delete" onclick="run();" style="border:none; background-color: #ffffff;"> <i
                        class="fa-solid fa-trash-can" alt="삭제"></i></button>
                  </td>
                </tr>
                <tr>
                  <td>8</td>
                  <td colspan="4" style="width: 200px;">
                    <h5><a href="#">유럽4국, 대한항공, 프라하 시내호텔 2연박 포함 전일정 4성, 프라하 필스너 양조장 레스토랑</a></h5>
                  </td>
                  <td class="actions">
                    <button type="button" class="btn" data-toggle="modal" data-target="#myModal">
                      <i class="fa-solid fa-pen" alt="수정"></i>
                    </button>

                    <div class="modal" id="myModal">
                      <div class="modal-dialog">
                        <div class="modal-content">

                          <div class="modal-header">
                            <h4 class="modal-title">가족 첫 패키지 여행 성공적</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                          </div>

                          <div class="modal-body">
                            후기가 좋은 이유를 알겠네요. 더운 날씨에 잠깐의 이동도 힘들고 짜증 날 수 있는데 패키지여서 짧은 시간에
                            관광지 다 볼 수 있어서 좋았어요
                          </div>

                          <div class="modal-footer">
                            <button type="button" id="btn-1" class="btn" data-dismiss="modal">수정하기</button>
                          </div>

                        </div>
                      </div>
                    </div>
                    <button id="delete" onclick="run();" style="border:none; background-color: #ffffff;"> <i
                        class="fa-solid fa-trash-can" alt="삭제"></i></button>
                  </td>
                </tr>
                <tr>
                  <td>9</td>
                  <td colspan="4" style="width: 200px;">
                    <h5><a href="#">유럽4국, 대한항공, 프라하 시내호텔 2연박 포함 전일정 4성, 프라하 필스너 양조장 레스토랑</a></h5>
                  </td>
                  <td class="actions">
                    <button type="button" class="btn" data-toggle="modal" data-target="#myModal">
                      <i class="fa-solid fa-pen" alt="수정"></i>
                    </button>

                    <div class="modal" id="myModal">
                      <div class="modal-dialog">
                        <div class="modal-content">

                          <div class="modal-header">
                            <h4 class="modal-title">가족 첫 패키지 여행 성공적</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                          </div>

                          <div class="modal-body">
                            후기가 좋은 이유를 알겠네요. 더운 날씨에 잠깐의 이동도 힘들고 짜증 날 수 있는데 패키지여서 짧은 시간에
                            관광지 다 볼 수 있어서 좋았어요
                          </div>

                          <div class="modal-footer">
                            <button type="button" id="btn-1" class="btn" data-dismiss="modal">수정하기</button>
                          </div>

                        </div>
                      </div>
                    </div>
                    <button id="delete" onclick="run();" style="border:none; background-color: #ffffff;"> <i
                        class="fa-solid fa-trash-can" alt="삭제"></i></button>
                  </td>
                </tr>
                <tr>
                  <td>10</td>
                  <td colspan="4" style="width: 200px;">
                    <h5><a href="#">유럽4국, 대한항공, 프라하 시내호텔 2연박 포함 전일정 4성, 프라하 필스너 양조장 레스토랑</a></h5>
                  </td>
                  <td class="actions">
                    <button type="button" class="btn" data-toggle="modal" data-target="#myModal">
                      <i class="fa-solid fa-pen" alt="수정"></i>
                    </button>

                    <div class="modal" id="myModal">
                      <div class="modal-dialog">
                        <div class="modal-content">

                          <div class="modal-header">
                            <h4 class="modal-title">가족 첫 패키지 여행 성공적</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                          </div>

                          <div class="modal-body">
                            후기가 좋은 이유를 알겠네요. 더운 날씨에 잠깐의 이동도 힘들고 짜증 날 수 있는데 패키지여서 짧은 시간에
                            관광지 다 볼 수 있어서 좋았어요
                          </div>

                          <div class="modal-footer">
                            <button type="button" id="btn-1" class="btn" data-dismiss="modal">수정하기</button>
                          </div>

                        </div>
                      </div>
                    </div>
                    <button id="delete" onclick="run();" style="border:none; background-color: #ffffff;"> <i
                        class="fa-solid fa-trash-can" alt="삭제"></i></button>
                  </td>
                </tr>
              </table>

            </div>
          </div>
 <div aria-label="Page navigation">
        <ul class="pagination">
          <li class="page-item">
            <a class="page-link" href="#" aria-label="Previous">
              <span aria-hidden="true">&laquo;</span>
            </a>
          </li>
          <li class="page-item active">
            <a class="page-link" href="#">1</a>
          </li>
          <li class="page-item">
            <a class="page-link" href="#">2</a>
          </li>
          <li class="page-item">
            <a class="page-link" href="#">3</a>
          </li>
          <li class="page-item">
            <a class="page-link" href="#">4</a>
          </li>
          <li class="page-item">
            <a class="page-link" href="#" aria-label="Next">
              <span aria-hidden="true">&raquo;</span>
            </a>
          </li>
        </ul>
      </div> 

        </div>
      </div>
    </div>
  </section>
            <%@ include file="/views/common/footer.jsp" %>
  
</body>
</html>