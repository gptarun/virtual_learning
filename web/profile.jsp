<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="utf-8">
    <title>Profile</title>
    <link rel="stylesheet" href="assets/stylesheets/main.css">
    <link rel="stylesheet" href="assets/stylesheets/font.css">
    <link rel="stylesheet" href="assets/stylesheets/style.css">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:100,300,400">
        <script type="text/javascript">
        function enableThis() 
        { 
          document.getElementById("fname").disabled=false;
          document.getElementById("lname").disabled=false;
          document.getElementById("dept").disabled=false;
          document.getElementById("mail").disabled=false;
          document.getElementById("cno").disabled=false;
        }     
        function updateThis() 
        {
        
         var m = ""; 
         document.getElementById("fname").disabled=true;
         document.getElementById("lname").disabled=true;
         document.getElementById("dept").disabled=true;
         document.getElementById("mail").disabled=true;
         document.getElementById("cno").disabled=true;
         m = document.getElementById("fname").value;
         m = m + " " +document.getElementById("lname").value;
         m = m + " " +document.getElementById("dept").value;
         m = m + " " +document.getElementById("cno").value;
         m = m + " " +document.getElementById("mail").value;
         window.location.replace("profile.jsp?mess="+m); 
        }
         
       
    </script>
  </head>

  <body>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
    <%@ page session="true" %>
    <%String userid = session.getAttribute("name").toString(); 
    String id = session.getAttribute("yourid").toString(); 
    String attr = session.getAttribute("attr").toString();
    String sopt = session.getAttribute("sopt").toString(); 
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/My_database", "root", "tarun");
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from "+sopt+" where "+attr+"='"+id+"'");   
    String queryString = "update "+sopt+" set F_Name=?,L_Name=?,Department=?,Contact_No=?,Email=? where "+attr+" ='"+id+"'";
    PreparedStatement pstatement = con.prepareStatement(queryString);
    %>
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

        <h1>Your Profile</h1>

        <p>Teacher who love teaching, teach children&#8217;s to love learning</p>

      </div>
    </section>

    <!-- Main content -->

    <section class="row">
      <div class="grid">

        <!-- Vikas Singh -->

        <section class="speaker">

          <div class="col-2-3">

            <h2><%=userid%></h2>
            <h5>OIST, BHOPAL</h5>
            
            <%
            if(rs.next())
            {
            %>
            <table width="500" class="table1" align="left">
			<col width=35% />
			<col width=65% />
            
			<tr>
                 <th scope="row">ID</th>
                 <td><%=rs.getString(1)%></td>
            </tr>
			<tr>
                <th scope="row">First Name</th>
                <td><input type="text" id="fname" style="border: none; background-color: transparent;text-align: center;" size="20" value="<%=rs.getString("F_Name")%>" disabled="true"></td>
            </tr>
			<tr>
                <th scope="row">Last Name</th>
                <td><input type="text" id="lname" style="border: none; background-color: transparent;text-align: center;" size="20" value="<%=rs.getString("L_Name")%>" disabled="true"></td>
            </tr>
            
			<tr>
                <th scope="row">Department</th>
                <td><input type="text" id="dept" style="border: none; background-color: transparent;text-align: center;" size="20" value="<%=rs.getString("Department")%>" disabled="true"></td>
            </tr>
			<tr>
                <th scope="row">Contact Number</th>
                <td><input type="text" id="cno" style="border: none; background-color: transparent;text-align: center;" size="20" value="<%=rs.getString("Contact_No")%>" disabled="true"></td>
            </tr>
			<tr>
                <th scope="row">Email</th>
                <td><input type="text" id="mail" style="border: none; background-color: transparent;text-align: center;" size="50" value="<%=rs.getString("Email")%>" disabled="true"></td>
                
            </tr> 
			<% 
                if(sopt.equals("Student"))
                {
            %>
			<tr>
                <th scope="row">Attendance</th>
                <td><%=rs.getString("Attendance")%></td>
            </tr>
            <%
                }
            %>
          </table>
                <%
            }
                %>
		  
		  <input class="action-button shadow animate green" type="submit" value="Edit" onClick="enableThis();">
		  <input class="action-button shadow animate green" type="submit" value="Save" onClick="updateThis();">

        </div><!--

          --><aside class="col-1-3">
            <div class="speaker-info">

              <img src="assets/images/profile/<%=id%>.jpg">

              <ul>
                <li><a href="https://www.facebook.com" target="_blank">Join me on fb</a></li>
              </ul>

            </div>
          </aside>

        </section>
	</section>	
        <% 
        String message = request.getParameter("mess");
        try
        {
            String td[] = message.split(" ");
            String fname= td[0];
            String lname= td[1];
            String dept=td[2];
            String cno=td[3];
            String email=td[4];
            pstatement.setString(1, fname);
            pstatement.setString(2, lname);
            pstatement.setString(3, dept);
            pstatement.setString(4, cno);
            pstatement.setString(5, email);
            pstatement.executeUpdate();
            }
        catch(Exception e){}
        %>

    <!-- Footer -->

   <footer class="primary-footer container group">

      <small>&copy;&nbsp;Vikas Singh</small>

      <nav class="nav">
        <ul>
          <li>Contact Us : vikas.singh707@gmail.com</a></li>
        </ul>
      </nav>

    </footer>

        <%
            rs.close();
            st.close();
            con.close();
        %>   
  </body>
</html>