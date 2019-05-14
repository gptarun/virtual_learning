<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="utf-8">
    <title>Search Student</title>
    <link rel="stylesheet" href="assets/stylesheets/main.css">
	<link rel="stylesheet" href="assets/stylesheets/style.css">
    <link rel="stylesheet" href="assets/stylesheets/font.css">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:100,300,400">
  </head>

  <body>

    <!-- Header -->

    <header class="primary-header container group">

      <h1 class="logo">
        <a href="#">Virtual <br> Learning</a>
      </h1>

      <h3 class="tagline">A place to learn</h3>

    </header>

    <!-- Lead -->

    <section class="row-alt">
      <div class="lead container">

        <h1>Search Student</h1>

      </div>
    </section>
	
	<section class="row">
		<form action="" method="post" class="smart-green">
		<h1>Search Student 
		</h1>
		<label>
			<span>Enter Enrollment Number :</span>
			<input id="search" type="text" name="search" placeholder="Enter Valid Enrollment Number" />
     
		</label>
                <label>
			<span>&nbsp;</span> 
			<input type="Submit" class="button" value="Search"/> 
		</label>
		</form>	
        <%@ page import="java.sql.*" %>
        <%@ page import="javax.sql.*" %>
        <%
          String sid=null;
          Class.forName("com.mysql.jdbc.Driver");
          Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/My_database", "root", "tarun");
          Statement st=con.createStatement();
          String roll = request.getParameter("search");
          ResultSet rs=st.executeQuery("select S_ID,F_Name,L_name,Attendance,Department,Contact_No,Email from student where S_ID='"+roll+"'");
          
         //ab tr--->td dalna hai
               
		
         if(rs.next()) 
            {
                sid = rs.getString("S_ID");
                if(roll.equals(sid))
               {%>
               
                <table class="table1" align="center">
			<col width=40% />
			<col width=60% />
            
			<tr>
                 <th scope="row">Student ID</th>
                 <td><%=rs.getString("S_ID")%></td>
                </tr>
			<tr>
                <th scope="row">First Name</th>
                <td><%=rs.getString("F_Name")%></td>
                </tr>
			<tr>
                <th scope="row">Last Name</th>
                <td><%=rs.getString("L_Name")%></td>
                </tr>
			<tr>
                <th scope="row">Attendance</th>
                <td><%=rs.getString("Attendance")%></td>
                </tr>
			<tr>
                <th scope="row">Department</th>
                <td><%=rs.getString("Department")%></td>
                </tr>
			<tr>
                <th scope="row">Contact Number</th>
                <td><%=rs.getString("Contact_no")%></td>
                </tr>
			<tr>
                <th scope="row">Email</th>
                <td><%=rs.getString("Email")%></td>
                </tr> 
			
                </table>
		<section class="teaser temp">
		<input class="action-button shadow animate green" type="submit" value="PRINT" onclick="window.print()">
                </section> 
	</section>
               <% }
                else
                {
                out.println("invalid roll no");
                }
               
             }       
           
            rs.close();
            st.close();
            con.close();
            %>
         
    <!-- Footer -->

    </section>
    <footer class="primary-footer container group">

      <small>&copy;&nbsp;Tarun Gupta</small>

      <nav class="nav">
        <ul>
          <li>Contact Us : tarung1201@gmail.com</a></li>
        </ul>
      </nav>

    </footer>
    </body>
</html>
