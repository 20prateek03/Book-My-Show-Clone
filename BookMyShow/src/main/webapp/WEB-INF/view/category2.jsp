<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
   <%@page import="java.sql.*" %>
    
   <jsp:include page="index_header1.jsp" />
   
<!-- <html lang="en"><!doctype html> -->
<head>
   <!-- Required meta tags -->
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   <title>CATEGORIES</title>
   <style media="screen">
      :root {
      --gradient: linear-gradient(to left top, #DD2476 10%, #FF512F 90%) !important;
      }
      body {
      background: white !important;
      }
      .card {
      background: #222;
      border: 1px solid #dd2476;
      color: rgba(250, 250, 250, 0.8);
      margin-bottom: 2rem;
      }
      .card-text{
      overflow: hidden;
      text-overflow: ellipsis;
      display: -webkit-box;
      -webkit-line-clamp: 3;
      line-clamp: 3;
      -webkit-box-orient: vertical;
      }
      .btn {
      border: 5px solid;
      border-image-slice: 1;
      background: var(--gradient) !important;
      -webkit-background-clip: text !important;
      -webkit-text-fill-color: transparent !important;
      border-image-source:  var(--gradient) !important;
      text-decoration: none;
      transition: all .4s ease;
      }
      .btn:hover, .btn:focus {
      background: var(--gradient) !important;
      -webkit-background-clip: none !important;
      -webkit-text-fill-color: #fff !important;
      border: 5px solid #fff !important;
      box-shadow: #222 1px 0 10px;
      text-decoration: underline;
      }
      .modal-header,
      h4,
      .close {
      background-color: #2d2d30;
      color: lightgray !important;
      text-align: center;
      font-size: 30px;
      box-sizing: initial;
      }
      .modal-header {
      border-top-right-radius: 15px;
      border-top-left-radius: 15px;
      }
      .modal-body {
      color: purple;
      padding: 17px 15px;
      border-radius: 5px;
      padding: 20px;
      width:auto;
      height: auto;
      margin: auto;
      }
      .modal-content {
      border-radius: 15px;
      }
      input[type=text], select, textarea {
      width: 100%;
      padding: 12px;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
      margin-top: 6px;
      margin-bottom: 16px;
      resize: vertical;
      }
      input[type=email]{
      width: 100%;
      padding: 12px;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
      margin-top: 6px;
      margin-bottom: 16px;
      resize: vertical;
      }
      input[type=date]{
      width: 100%;
      padding: 12px;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
      margin-top: 6px;
      margin-bottom: 16px;
      resize: vertical;
      }
      .row a {
      color: #000000;
      }
      .row a:hover {
      color: #dbe6f7;
      background-image: linear-gradient(to  bottom right, #000000 , #b671bc);
      }
   </style>
   <style>
      .google-map {
      padding-bottom: 50%;
      position: relative;
      }
      .google-map iframe {
      height: 100%;
      width: 100%;
      left: 0;
      top: 0;
      position: absolute;
      }
   </style>
   <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
   
   
   
   
   
</head>
<!-- <body> -->
<!-- nav in left -->
<body>

<br><br><br>
<div class="row" style="background-image: linear-gradient(to bottom, #f5f1f6, #59cbc7 , #f5f1f6)">
	
   <div class="nav flex-column nav-pills" id="nav-tab" role="tablist" aria-orientation="vertical">
      <a class="nav-item nav-link" id="nav-romatic-tab" data-toggle="tab" href="#nav-romatic" role="tab" aria-controls="nav-romatic" aria-selected="false"> &nbsp Romantic</a>
      <a class="nav-item nav-link" id="nav-horor-tab" data-toggle="tab" href="#nav-horor" role="tab" aria-controls="nav-horor" aria-selected="false"> &nbsp Horror</a>
      <a class="nav-item nav-link" id="nav-thriler-tab" data-toggle="tab" href="#nav-thriler" role="tab" aria-controls="nav-thriler" aria-selected="false"> &nbsp Thriller</a>
     
      <a class="nav-item nav-link" id="nav-scfi-tab" data-toggle="tab" href="#nav-scfi" role="tab" aria-controls="nav-scfi" aria-selected="false"> &nbsp Sci - Fi</a>
      <a class="nav-item nav-link" id="nav-cmic-tab" data-toggle="tab" href="#nav-cmic" role="tab" aria-controls="nav-cmic" aria-selected="false"> &nbsp Comedy</a>
       <a class="nav-item nav-link" id="nav-actin-tab" data-toggle="tab" href="#nav-actin" role="tab" aria-controls="nav-actin" aria-selected="false"> &nbsp Action</a>
     
   </div>
   <div class="col" style="background-image: linear-gradient(to  bottom right, #000000 , #b671bc)">
      <div class="tab-content" id="nav-tabContent">
         <!-- Romantic -->
         
         <div class="tab-pane fade" id="nav-romatic" role="tabpanel" aria-labelledby="nav-romatic-tab">
            Romantic
            <div class="container mx-auto mt-4">
               <div class="row" style="margin-left: 5%;">
               <% 
        String MovieId = null;
        String Category = null;
        String MovieName=null;
        //String Image=null;
        String ActorName=null;
        String ActressName=null;
        String DirectorName=null;

 Connection conn = null;
 PreparedStatement pstm = null;
 ResultSet rs = null;
 try {
	 
		String url="jdbc:mysql://localhost:3306/Customer";
		String uid="root";
		String upass="Prateek@352";
		conn=DriverManager.getConnection(url,uid,upass);
  
pstm = conn.prepareStatement("select * from movie where category ='romantic'");
rs = pstm.executeQuery();

while (rs.next()) {
MovieId=rs.getString(1);
MovieName=rs.getString(7);
//Image=rs.getString(3);
//Quantity=rs.getInt(6);
//Price=rs.getDouble(4);
ActorName=rs.getString(2);
ActressName=rs.getString(3);
DirectorName=rs.getString(5);
%>
               
                  <div class="col-sm">
                     <div class="card" style="width: 19rem;">
                        <img src=<%="images/"+rs.getString(6) %> class="card-img-top" alt="..." style="height:270px">
                        <div class="card-body">
                           <h5 class="card-title">Movie Name: <%=MovieName %></h5>
                           <h5 class="card-title">Actor: <%=ActorName %></h5>
                           <h5 class="card-title">Actress: <%=ActressName %></h5>
                           <h5 class="card-title">Director Name: <%=DirectorName %></h5>
                           <p class="card-text"></p>
                           <a href="https://youtu.be/x60tMH7Pz9s?si=R-nQOdjgBCb-wg-N" class="btn" onclick="login_first()" >Trailer</a>
                          
                           <a href="bookingseat" class="btn" onclick="login_first()" > &nbsp&nbsp&nbsp Book Now</a>
                        </div>
                     </div>
                  </div>
                  <%}

} catch (Exception e) {
}

%>
                  </div>
                  </div>
                  </div>
                       <!-- Horror -->
         
         <div class="tab-pane fade" id="nav-horor" role="tabpanel" aria-labelledby="nav-horor-tab">
            Horror
            <div class="container mx-auto mt-4">
               <div class="row" style="margin-left: 5%;">
               <% 
        String MovieId2 = null;
        String Category2 = null;
        String MovieName2=null;
        //String Image=null;
        String ActorName2=null;
        String ActressName2=null;
        String DirectorName2=null;

 Connection conn2 = null;
 PreparedStatement pstm2 = null;
 ResultSet rs2 = null;
 try {
	 
		String url="jdbc:mysql://localhost:3306/Customer";
		String uid="root";
		String upass="Prateek@352";
		conn=DriverManager.getConnection(url,uid,upass);
  
pstm = conn.prepareStatement("select * from movie where category ='horror'");
rs = pstm.executeQuery();

while (rs.next()) {
MovieId=rs.getString(1);
MovieName=rs.getString(7);
//Image=rs.getString(3);
//Quantity=rs.getInt(6);
//Price=rs.getDouble(4);
ActorName=rs.getString(2);
ActressName=rs.getString(3);
DirectorName=rs.getString(5);
%>
               
                  <div class="col-sm">
                     <div class="card" style="width: 18rem;">
                        <img src=<%="images/"+rs.getString(6) %> class="card-img-top" alt="..." style="height:170px">
                        <div class="card-body">
                           <h5 class="card-title">Movie Name: <%=MovieName %></h5>
                           <h5 class="card-title">Actor: <%=ActorName %></h5>
                           <h5 class="card-title">Actress: <%=ActressName %></h5>
                           <h5 class="card-title">Director Name: <%=DirectorName %></h5>
                           
                           <p class="card-text"></p>
                          <a href="#" class="btn" onclick="login_first()" >Trailer</a>
                           <a href="bookingseat" class="btn" onclick="login_first()" >Book Now</a>
                        </div>
                     </div>
                  </div>
                  <%}

} catch (Exception e) {
}

%>
                  </div>
                  </div>
                  </div>
     <!-- Thriller -->
         
         <div class="tab-pane fade" id="nav-thriler" role="tabpanel" aria-labelledby="nav-thriler-tab">
            Thriller
            <div class="container mx-auto mt-4">
               <div class="row" style="margin-left: 5%;">
               <% 
        String MovieId3 = null;
        String Category3 = null;
        String MovieName3=null;
        //String Image=null;
        String ActorName3=null;
        String ActressName3=null;
        String DirectorName3=null;

 Connection conn3 = null;
 PreparedStatement pstm3 = null;
 ResultSet rs3 = null;
 try {
	 
		String url="jdbc:mysql://localhost:3306/Customer";
		String uid="root";
		String upass="Prateek@352";
		conn=DriverManager.getConnection(url,uid,upass);
  
pstm = conn.prepareStatement("select * from movie where category ='thriller'");
rs = pstm.executeQuery();

while (rs.next()) {
MovieId=rs.getString(1);
MovieName=rs.getString(7);
//Image=rs.getString(3);
//Quantity=rs.getInt(6);
//Price=rs.getDouble(4);
ActorName=rs.getString(2);
ActressName=rs.getString(3);
DirectorName=rs.getString(5);
%>
               
                  <div class="col-sm">
                     <div class="card" style="width: 18rem;">
                        <img src=<%="images/"+rs.getString(6) %> class="card-img-top" alt="..." style="height:170px">
                        <div class="card-body">
                          <h5 class="card-title">Movie Name: <%=MovieName %></h5>
                           <h5 class="card-title">Actor: <%=ActorName %></h5>
                           <h5 class="card-title">Actress: <%=ActressName %></h5>
                           <h5 class="card-title">Director Name: <%=DirectorName %></h5>
                           
                           <p class="card-text"></p>
                           <a href="https://youtu.be/Yxe-mIVIwM4?si=-l_ktpuxrCB5xFPh" class="btn" onclick="login_first()" >Trailer</a>
                           <a href="bookingseat" class="btn" onclick="login_first()" >Book Now</a>
                        </div>
                     </div>
                  </div>
                  <%}

} catch (Exception e) {
}

%>
                  </div>
                  </div>
                  </div>
<!-- SciFi -->
         
         <div class="tab-pane fade" id="nav-scfi" role="tabpanel" aria-labelledby="nav-scfi-tab">
            Sci Fi
            <div class="container mx-auto mt-4">
               <div class="row" style="margin-left: 5%;">
               <% 
        String MovieId4 = null;
        String Category4 = null;
        String MovieName4=null;
        //String Image=null;
        String ActorName4=null;
        String ActressName4=null;
        String DirectorName4=null;

 Connection conn4 = null;
 PreparedStatement pstm4 = null;
 ResultSet rs4 = null;
 try {
	 
		String url="jdbc:mysql://localhost:3306/Customer";
		String uid="root";
		String upass="Prateek@352";
		conn=DriverManager.getConnection(url,uid,upass);
  
pstm = conn.prepareStatement("select * from movie where category ='scifi'");
rs = pstm.executeQuery();

while (rs.next()) {
MovieId=rs.getString(1);
MovieName=rs.getString(7);
//Image=rs.getString(3);
//Quantity=rs.getInt(6);
//Price=rs.getDouble(4);
ActorName=rs.getString(2);
ActressName=rs.getString(3);
DirectorName=rs.getString(5);
%>
               
                  <div class="col-sm">
                     <div class="card" style="width: 18rem;">
                        <img src=<%="images/"+rs.getString(6) %> class="card-img-top" alt="..." style="height:170px">
                        <div class="card-body">
                           <h5 class="card-title">Movie Name: <%=MovieName %></h5>
                           <h5 class="card-title">Actor: <%=ActorName %></h5>
                           <h5 class="card-title">Actress: <%=ActressName %></h5>
                           <h5 class="card-title">Director Name: <%=DirectorName %></h5>
                           
                           <p class="card-text"></p>
                           <a href="https://youtu.be/OiTiKOy59o4?si=dMGa23kDEXKaaeC9" class="btn" onclick="login_first()" >Trailer</a>
                           <a href="bookingseat" class="btn" onclick="login_first()" >Book Now</a>
                        </div>
                     </div>
                  </div>
                  <%}

} catch (Exception e) {
}

%>
                  </div>
                  </div>
                  </div>


<!-- Comedy -->
         
         <div class="tab-pane fade" id="nav-cmic" role="tabpanel" aria-labelledby="nav-cmic">
            Comedy
            <div class="container mx-auto mt-4">
               <div class="row" style="margin-left: 5%;">
               <% 
        String MovieId5 = null;
        String Category5 = null;
        String MovieName5=null;
        //String Image=null;
        String ActorName5=null;
        String ActressName5=null;
        String DirectorName5=null;

 Connection conn5 = null;
 PreparedStatement pstm5 = null;
 ResultSet rs5 = null;
 try {
	 
		String url="jdbc:mysql://localhost:3306/Customer";
		String uid="root";
		String upass="Prateek@352";
		conn=DriverManager.getConnection(url,uid,upass);
  
pstm = conn.prepareStatement("select * from movie where category ='comedy'");
rs = pstm.executeQuery();

while (rs.next()) {
MovieId=rs.getString(1);
MovieName=rs.getString(7);
//Image=rs.getString(3);
//Quantity=rs.getInt(6);
//Price=rs.getDouble(4);
ActorName=rs.getString(2);
ActressName=rs.getString(3);
DirectorName=rs.getString(5);
%>
               
                  <div class="col-sm">
                     <div class="card" style="width: 18rem;">
                        <img src=<%="images/"+rs.getString(6) %> class="card-img-top" alt="..." style="height:170px">
                        <div class="card-body">
                           <h5 class="card-title">Movie Name: <%=MovieName %></h5>
                           <h5 class="card-title">Actor: <%=ActorName %></h5>
                           <h5 class="card-title">Actress: <%=ActressName %></h5>
                           <h5 class="card-title">Director Name: <%=DirectorName %></h5>
                           
                           <p class="card-text"></p>
                           <a href="#" class="btn" onclick="login_first()" >Trailer</a>
                          <a href="bookingseat" class="btn" onclick="login_first()" >Book Now</a>
                        </div>
                     </div>
                  </div>
                  <%}

} catch (Exception e) {
}

%>
                  </div>
                  </div>
                  </div>


<!-- Action -->
         
         <div class="tab-pane fade" id="nav-actin" role="tabpanel" aria-labelledby="nav-actin">
            Comic
            <div class="container mx-auto mt-4">
               <div class="row" style="margin-left: 5%;">
               <% 
        String MovieId6 = null;
        String Category6 = null;
        String MovieName6=null;
        //String Image=null;
        String ActorName6=null;
        String ActressName6=null;
        String DirectorName6=null;

 Connection conn6 = null;
 PreparedStatement pstm6 = null;
 ResultSet rs6 = null;
 try {
	 
		String url="jdbc:mysql://localhost:3306/Customer";
		String uid="root";
		String upass="Prateek@352";
		conn=DriverManager.getConnection(url,uid,upass);
  
pstm = conn.prepareStatement("select * from movie where category ='action'");
rs = pstm.executeQuery();

while (rs.next()) {
MovieId=rs.getString(1);
MovieName=rs.getString(7);
//Image=rs.getString(3);
//Quantity=rs.getInt(6);
//Price=rs.getDouble(4);
ActorName=rs.getString(2);
ActressName=rs.getString(3);
DirectorName=rs.getString(5);
%>
               
                  <div class="col-sm">
                     <div class="card" style="width: 18rem;">
                        <img src=<%="images/"+rs.getString(6) %> class="card-img-top" alt="..." style="height:170px">
                        <div class="card-body">
                           <h5 class="card-title">Movie Name: <%=MovieName %></h5>
                           <h5 class="card-title">Actor: <%=ActorName %></h5>
                           <h5 class="card-title">Actress: <%=ActressName %></h5>
                           <h5 class="card-title">Director Name: <%=DirectorName %></h5>
                           
                           <p class="card-text"></p>
                           <a href="https://youtu.be/6amIq_mP4xM?si=E9LzLfhd2TbThySj" class="btn" onclick="login_first()" >Trailer</a>
                           
                           <a href="bookingseat" class="btn" onclick="login_first()" >Book Now</a>
                        </div>
                     </div>
                  </div>
                  <%}

} catch (Exception e) {
}

%>
                  </div>
                  </div>
                  </div>
                  
                  
   
                  </body>
                