

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<% 
    if(request.getParameter("submit")!=null)
    {
        String id = request.getParameter("id");
        String name = request.getParameter("cus_name");
        String contact = request.getParameter("con_no");
        String  address= request.getParameter("address");
       
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/shop","root","");
        pst = con.prepareStatement("update customer set cus_name = ?,con_no =?,address= ? where id = ?");
        pst.setString(1, name);
        pst.setString(2, contact);
        pst.setString(3, address);
        pst.setString(4, id);
        pst.executeUpdate();  
        
        %>
        
        <script>   
            alert("Record Updated");           
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
            input[type=text], select, textarea {
            width: 100%; /* Full width */
            padding: 12px; /* Some padding */ 
            border: 1px solid #ccc; /* Gray border */
            border-radius: 4px; /* Rounded borders */
            box-sizing: border-box; /* Make sure that padding and width stays in place */
            margin-top: 6px; /* Add a top margin */
            margin-bottom: 16px; /* Bottom margin */
            resize: vertical /* Allow the user to vertically resize the textarea (not horizontally) */
          }

          /* Style the submit button with a specific background color etc */
          input[type=submit] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
          }

          /* When moving the mouse over the submit button, add a darker green color */
          input[type=submit]:hover {
            background-color: #45a049;
          }

          /* Add a background color and some padding around the form */
          .container {
            border-radius: 5px;
            background-color: #f2f2f2;
            padding: 20px;
          }
        </style>
    </head>
    <body>
        <h1> Update Customer Details </h1>
        <div class="container">
       <form method="POST" action="#">
            
           <%    
                         Connection con;
                        PreparedStatement pst;
                        ResultSet rs;
        
                         Class.forName("com.mysql.jdbc.Driver");
                         con = DriverManager.getConnection("jdbc:mysql://localhost/shop","root","");
                           
                        String id = request.getParameter("id");
                          
                        pst = con.prepareStatement("select * from customer where id = ?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();
                        
                while(rs.next())
                {
                    
                    %>
               <label for="cus_name">Customer Name</label>
               <input type="text" id="cus_name" name="cus_name" placeholder="Customer name..">

               <label for="con_no">Mobile Number</label>
               <input type="text" id="con_no" name="con_no" placeholder="Contact Number">

               <label for="address">Address</label>
               <input type="text" id="address" name="address" placeholder="Address...">
               
               <% } %>
               
               <input type="submit" value="Submit" id="submit" name="submit">
               <p><a href="index.jsp">Click Back</a></p>
          
       </form>
</div>
    </body>
</html>
