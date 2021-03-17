<%@page import="dto.Address"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.AddressRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<!-- bootstrap라이브러리 연결 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<meta charset="UTF-8">
<title>배송주소리스트</title>
</head>
<body>
 <%
		AddressRepository dao=AddressRepository.getInstance();
        ArrayList<Address> listOfAddresss = dao.getAllAddress();
%>     
      <div class="container">
         <div class="row" align="center">
<table class="table table-hover">
                <tr>
                	<th scope="col">순번</th>
                	<th scope="col">명칭</th>
                	<th scope="col">국가</th>
                	<th scope="col">우편번호</th>
                	<th scope="col">주소</th>
                	<th scope="col">상세주소</th>
                	<th scope="col">참조주소</th>
                </tr>
                <%
                for(int i=0;i<listOfAddresss.size();i++){
			        Address Address = listOfAddresss.get(i);
						%>
						<!-- 개별 상품 속성 출력 -->
                		<tr>
                		    <td scope="row"><%=Address.getSeq()%></td>
                		    <td><%=Address.getName() %></td>
                		    <td><%=Address.getNation()%></td>
                		    <td><%=Address.getZipcode() %></td>
                		    <td><%=Address.getAddress() %></td>
                		    <td><%=Address.getAddressDetail()%></td>
                		    <td><%=Address.getAddressExtra()%></td>
                		    <td><a href="javascript:selectAddress('<%=Address.getName()%>',
                		                                                            '<%=Address.getNation()%>',
                		                                                            '<%=Address.getZipcode() %>',
                		                                                            '<%=Address.getAddress() %>',
                		                                                            '<%=Address.getAddressDetail()%>',
                		                                                            '<%=Address.getAddressExtra()%>'
                		                                                            )" 
                		              class="badge badge-danger">
                		           선택</a>
                		    </td>
                		</tr>
                	<%	
                		}
                %>
            </table>
            <div><a href="javascript:window.open('addAddress.jsp','배송지추가','width=780,height=700');">배송지 추가</a></div>   
      </div>
   </div>
   <script>
   function selectAddress(name, nation, zipcode,address, addressDetail, addressExtra){
	   //alert(document.getElementById("name").value);
	   //팝업창으로 연 부모페이지가 opener
	   opener.frm.name.value=name;
	   opener.frm.country.value=nation;
	   
	   opener.frm.zipcode.value=zipcode;
	   opener.frm.addressName.value=address;
	   opener.frm.addressDetail.value=addressDetail;
	   opener.frm.addressExtra.value=addressExtra; 
	   
	   //오픈된 자신을 닫기
	   self.close();
   }
   </script>
<%--
width : 팝업창 가로길이
height : 팝업창 세로길이
toolbar=no : 단축도구창(툴바) 표시안함
menubar=no : 메뉴창(메뉴바) 표시안함
location=no : 주소창 표시안함
scrollbars=no : 스크롤바 표시안함
status=no : 아래 상태바창 표시안함
resizable=no : 창변형 하지않음
fullscreen=no : 전체화면 하지않음
channelmode=yes : F11 키 기능이랑 같음
left=0 : 왼쪽에 창을 고정(ex. left=30 이런식으로 조절)
top=0 : 위쪽에 창을 고정(ex. top=100 이런식으로 조절)
 --%>