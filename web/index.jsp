<%-- 
    Document   : index
    Created on : 15 Apr, 2021, 4:57:54 PM
    Author     : SHUBHAM
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"  %>



<%
     
    if(request.getParameter("submit")!=null)
    {
        String name=request.getParameter("name");
        String number=request.getParameter("MobileNo");
        String address=request.getParameter("address");
        
//        Connection con;
//        PreparedStatement ps;
//        ResultSet rs;
//        
//        Class.forName("com.mysql.jdbc.Driver");
//        con = DriverManager.getConnection("jdbc:mysql://localhost/shop","root","");
//        ps=con.prepareStatement("insert into customer values(?,?,?)");
        String sql="INSERT INTO customer VALUES(?,?,?)";
        Class.forName("com.mysql.jdbc.Driver");
        java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shop","root","");
        PreparedStatement ps;
        ps = con.prepareStatement(sql);
        
        
       // System.out.println(n+" ROW ADDED");
        ps.setString(1,name);
        ps.setString(2, number);
        ps.setString(3, address);
        int n=ps.executeUpdate();
       
       %>
   
    <script>
        alert("Racord ADDED Sucessfully");
    </script>   

<%    
  }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table {
              font-family: arial, sans-serif;
              border-collapse: collapse;
              width: 100%;
            }

            td, th {
              border: 1px solid #dddddd;
              text-align: left;
              padding: 8px;
            }

            tr:nth-child(even) {
              background-color: #dddddd;
            }
            
            
        </style>
        
        
    </head>
    <body>
        <h1>Customer Registration Form </h1>
        <div class="page1"> 
            <div class="form">
                <form class="card" method="POST" action="#">
                  <label for="fname">First name:</label><br>
                  <input type="text" id="name" name="name" value=""><br>
                  <label for="lname">Mobile No.</label><br>
                  <input type="number" id="mobileNo" name="MobileNo" value=""><br>
                  <label for="lname">Address</label><br>
                  <input type="text" id="address" name="address" value="">
                  <br><br>
                  <input type="submit" id="submit" value="submit" name="submit">
                </form> 
            </div>
            
            <div class="table">
                

            <h2>HTML Table</h2>
            <table>
              <tr>
                <th>Customer Name</th>
                <th>Contact N0.</th>
                <th>Address</th>
                <th>Edit</th>
              </tr>
              
            </table>
                
            </div>
           
        </div>
    </body>
</html>
