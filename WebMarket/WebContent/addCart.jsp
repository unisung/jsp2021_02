<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
       //product.jsp에서 id=상품아디로 넘어온 상품id값을 얻기
       String id=request.getParameter("id");
      //id값이 넘어오지 않았으면 null, 아니면 상품id값   " P1235 ".trim() -> "P1235" 공백제거, "      " -> "" ;
      if(id==null || id.trim().equals("")){//상품정보가 없으면,
    	  response.sendRedirect("products.jsp");//상품리스트로 이동 처리
    	  return;//더이상 작업 안함.
      }
      
      //상품정보가 있으면 작업 진행
      //상품처리 객체 얻기
      ProductRepository dao = ProductRepository.getInstance();
      
      //파라미터로 넘어온 id값으로 상품정보 획득
      Product product = dao.getProductById(id);
      //파라미터로 넘어온 id값에 해당하는 상품이 없으면 null
      if(product ==null){
    	  response.sendRedirect("./error/exceptionNoProductId.jsp");
      }
      
      //id값에 해당하는 상품정보 얻기
      //상품들의 전체리스트 dao(ProductRepositroy)로 부터 얻기
      ArrayList<Product> goodsList = dao.getAllProducts();
      //상품정보를 담을 객체 변수 선언
      Product goods = new Product();
      //상품리스트 반복처리, 
      for(int i=0;i<goodsList.size();i++){
    	   goods = goodsList.get(i);//상품정보를 하나씩 꺼내어 저장
    	   if(goods.getProductId().equals(id)){//파라미터로 받은 상품id값과 같은 상품이면
    		   break;//반복 중지
    	   }
      } //goods변수에 상품정보 저장됨.
      System.out.println("상품명: "+goods.getPname());
      
      //
       System.out.println("세션 id: "+session.getId());
      
      //세션으로부터 장바구니가 있는지 여부확인
      ArrayList<Product> list = (ArrayList<Product>)session.getAttribute("cartlist");
     
      //만약 cartlist가 세션에 없으면(처음으로 카트에 담는경우, 재접속한 경우)
      if(list==null){//카트리스트 존재여부 null여부로 확인
    	  list = new ArrayList<Product>();//카트리스트가 없으면 비어있는 카트리스트 생성
    	  session.setAttribute("cartlist", list);//세션에 카트리스트 저장 - 접속한 모든 페이지에서 사용가능
      }
      
      //
      int cnt =0;
      Product goodsQnt = new Product();
      
      //카트리스트에서 상품정보 얻기
      for(int i=0;i<list.size();i++){
    	  goodsQnt = list.get(i);//카트리스트에서 하나씩 꺼내어서 
    	  if(goodsQnt.getProductId().equals(id)){//파라미터값 id값과 같은 상품id인 경우
                cnt++; //장바구니 수량 존재 여부확인 플래그 변수 
    		   int orderQuantity = goodsQnt.getQuantity() + 1;//장바구니에 수량을 1증가 시킴.
    		   goodsQnt.setQuantity(orderQuantity);//증가된 장바구니의 수량을 다시 장바구에 update시킴.
    	  }
      }
      
      //cnt==0인 경우 - 장바구니에 해당 상품이 존재하지않으면
      if(cnt==0){
    	  goods.setQuantity(1);//상품정보에 장바구니 수량값을 1로 설정하고
    	  list.add(goods);//장바구니리스트에 해당상품 추가
      }
      
      //장바구니에 goodsQnt가 있는 index위치
      int index = ((ArrayList<Product>)session.getAttribute("cartlist")).indexOf(goodsQnt);
      if(index!=-1){
      System.out.println("상품명: "+((ArrayList<Product>)session.getAttribute("cartlist")).get(index).getPname());
      System.out.println("상품수량: "+((ArrayList<Product>)session.getAttribute("cartlist")).get(index).getQuantity());
      }
      
      //장바구니에 상품 추가가 끝나면
      //이전의 상품id에 해당하는 상품정보페이지로 이동
      response.sendRedirect("product.jsp?id=" + id);
   
%>