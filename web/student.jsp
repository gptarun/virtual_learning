<%-- 
    Document   : student
    Created on : Mar 12, 2016, 1:25:02 PM
    Author     : Tarun
--%>

<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="utf-8">
    <title>Home Page</title>
    <link rel="stylesheet" href="assets/stylesheets/main.css">
    <link rel="stylesheet" href="assets/stylesheets/font.css">
    <link rel="stylesheet" href="assets/stylesheets/style.css">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:100,300,400">
  </head>

  <body>
    <%String userid = session.getAttribute("name").toString(); 
    String id = session.getAttribute("yourid").toString(); %>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
    <%@ page import="java.io.*" %>
    <!-- Header -->

    <header class="primary-header container group">

      <h1 class="logo">
        <a href="#">Virtual <br> Learning</a>
      </h1>

      <h3 class="tagline">A place to learn</h3>
	  <nav class="nav primary-nav">
        <ul>
          <li><a href="profile.jsp" target="_blank">Profile</a></li><!--
          --><li><a href="https://appear.in/ITroomVC" target="_blank">Join Video</a></li><!--
          --><li><a href="home.html">Logout</a></li>
        </ul>
      </nav>

    </header>
    <%
            String att="";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/My_database", "root", "tarun");
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select Attendance from Student where S_ID = '"+id+"'");
            if(rs.next())
            {
              att = rs.getString(1);  
            }
    
            String sCurrentLine="";
            BufferedReader br = new BufferedReader(new FileReader("C:/Users/Tarun/Documents/NetBeansProjects/Virtual_Learning/web/test.text"));
            try {
             StringBuilder sb = new StringBuilder();
             String line = br.readLine();
             while (line != null) {
             sb.append(line);
             sb.append("\n");
             line = br.readLine();
             }
             sCurrentLine = sb.toString();
            } finally {
              br.close();
              }
            %>
<!-- Lead -->

    <section class="row-alt">
      <div class="lead container">

        <h1><%=userid%></h1>

        <p>Children&#8217;s must be taught how to think, not what to think.</p>

      </div>
    </section>

    <!-- Main content -->

    <section class="row">
      <div class="grid">

        <!-- Vikas Singh -->

        <section class="speaker">

          <div class="col-2-3">

            <h2>Welcome</h2>
            <h5>Your Attendance : <%=att%>%</h5>
            <form action="student.jsp" method="POST">	
            <textarea name="abc" rows="8" cols="53" wrap="hard" readonly><%=sCurrentLine%></textarea>
		  <h2>
			<input class="kbutton tick" type="submit" value="Refresh">
                  </h2>
            </form>     
        </div><!--

          --><aside class="col-1-3">
            <div class="speaker-info">

              <img src="assets/images/profile/<%=id%>.jpg">

              <ul>
                <li><a href="https://www.gmail.com" target="_blank">OPEN MAILS</a></li>
              </ul>

            </div>
          </aside>

        </section>
	</section>	

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