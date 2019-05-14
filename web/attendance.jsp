<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="utf-8">
    <title>Attendance</title>
    <link rel="stylesheet" href="assets/stylesheets/main.css">
    <link rel="stylesheet" href="assets/stylesheets/font.css">
    <link rel="stylesheet" href="assets/stylesheets/style.css">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:100,300,400">
    <script type="text/javascript">
        function enableThis() 
        { 
         var rowCount = document.getElementById('mytable').rows.length;
         for (var i = 1; i <= rowCount; i++)
         {
          var id = "id"+i; 
          document.getElementById(id).disabled=false;
         }
        }     
        function updateThis() 
        { 
         var rowCount = document.getElementById('mytable').rows.length;
         var tdata = new Array(rowCount);
         var m = "";
         for (var i = 1; i <= rowCount; i++)
         {
         var id = "id"+i; 
         document.getElementById(id).disabled=true;
         tdata[i] = document.getElementById(id).value;
         m = m + tdata[i]+" ";
         window.location.replace("attendance.jsp?mess="+m); 
         }
         
       }
    </script>
  </head>

  <body>
      <%@ page import="java.sql.*" %>
      <%@ page import="javax.sql.*" %>
      <%@ page import = "java.util.Map" %>

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

        <h1>Attendance Menu</h1>

        <p>You can see and edit student&#8217;s attendance from here.</p>

      </div>
    </section>
    <section class="row">
		<form action="" method="post" class="smart-green">
		<h1>View Attendance 
		</h1>
		<label>
			<span>Semester :</span><select name="selection">
                        <option value="null">No selection</option>
			<option value="1">Semester 1st</option>
			<option value="2">Semester 2nd</option>
			<option value="3">Semester 3rd</option>
			<option value="4">Semester 4th</option>
			<option value="5">Semester 5th</option>
			<option value="6">Semester 6th</option>
			<option value="7">Semester 7th</option>
			<option value="8">Semester 8th</option>
			</select>
		</label>
		<label>
			<span>&nbsp;</span> 
			<input type="submit" class="button" value="Search" /> 
		</label>
		</form>	
<%
          int x=1;  
          String att = null;  
          String id = null;
          int no=3;
          
          String option = request.getParameter("selection");
          Class.forName("com.mysql.jdbc.Driver");
          Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/My_database", "root", "tarun");
          Statement st=con.createStatement();
          ResultSet rs=st.executeQuery("select S_ID,F_Name,L_name,Attendance from student where Sem='"+option+"'");
          String queryString = "update student set Attendance = ? where S_ID =?";
          PreparedStatement pstatement = con.prepareStatement(queryString);
          String attendance[] = new String[10]; 
%>
         
    <section class="row">
		<table width="500" class="table1" align="center" id="mytable">
			<col width=15% />
			<col width=35% />
            <col width=35% />
			<col width=30% />
			<tr>
                 <th scope="row">S. No</th>
                 <th scope="row">Enrollment No</th>
		 <th scope="row">Name</th>
		 <th scope="row">Attendance</th>
            </tr>
            <%
            while(rs.next())
            {
                id = "id"+x;
            %>
		<tr>
                <td><%=x%></td>
                <td><%=rs.getString("S_ID")%></td>
            	<td><%=rs.getString("F_Name")+" "+rs.getString("L_Name")%></td>
                <td><input type="text" id="<%=id%>" name="att" size="3" value="<%=rs.getString("Attendance")%>" disabled="true" ></td> 
                </tr>
                
            <%
            attendance[x]=rs.getString("Attendance");
            x++;
            }
            %>
            
        </table>
        
	<section class="teaser temp2">
        <input class="action-button shadow animate green" type="submit" value="Edit" onClick="enableThis();">
        <input class="action-button shadow animate green" type="submit" value="Update" onClick="updateThis();">
        <% 
        String sid = null;
        String message = request.getParameter("mess");
        try
        {
            String td[] = message.split(" ");
            //NOTE: but not sure... ek prob if number of student is greater den 9 since it will become 2 digit
            for(int i=0;i<td.length;i++)
            {
            sid = "0105IT12111"+no;
            att = td[i];
            pstatement.setString(1, att);
            pstatement.setString(2, sid);
            pstatement.executeUpdate();
            no++;
            }
        }
        catch(Exception e){}
        %>
        </section>
       
	</section>
        <%
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