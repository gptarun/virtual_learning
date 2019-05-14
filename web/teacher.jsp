
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
    <!-- Header -->
    <%
        String userid = session.getAttribute("name").toString(); 
        String sCurrentLine="";
    %>
    <%@ page import="java.io.*" %>
    <header class="primary-header container group">

      <h1 class="logo">
        <a href="">Virtual <br> Learning</a>
      </h1>

      <h3 class="tagline">A place to learn</h3>

      <nav class="nav primary-nav">
        <ul>
          <li><a href="profile.jsp" target="_blank">Profile</a></li><!--
          --><li><a href="attendance.jsp" target="_blank">Attendance</a></li><!--
          <li><a href="venue.html">Venue</a></li> --> <!--
          --><li><a href="home.html">Logout</a></li>
        </ul>
      </nav>

    </header>

    <!-- Lead -->

    <section class="row-alt">
      <div class="lead container">

        <h1><%=userid%></h1>

        <p>Welcome, You have no new notifications.</p>

      </div>
    </section>

    <!-- Main content -->

    <section class="row">
      <div class="grid">
        <section class="venue-theatre">
        <form  method="Post">
        <div class="col-1-2">
	<textarea name="Store" id="sta" rows="8" cols="53" wrap="hard"></textarea>
        <h2>
            <input class="kbutton tick" type="button" value="Upload" onclick="changeText();">
            <input class="kbutton tick" type="button" value="Save" onclick="doneText();">
            <input class="kbutton tick" id="reset" type="button" value="Reset">
            <script type="text/javascript">
             document.getElementById('reset').onclick= function() {
             var field= document.getElementById('sta');
             field.value= field.defaultValue;
             };
            </script>
            <%
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
            <%
            /*String sCurrentLine="";
            BufferedReader br = null;
            try {
		br = new BufferedReader(new FileReader("C:/Users/Tarun/Documents/NetBeansProjects/Virtual_Learning/web/test.text"));
		while ((sCurrentLine = br.readLine()) != null) {
		//out.println(sCurrentLine);
		}		
                }
            catch (IOException e) {}*/
            %>
	</h2>
           
          </div>
            <textarea name="Display" id="dta" rows="8" cols="53"  wrap="hard" readonly>&#13;&#10;<%=sCurrentLine%>
		  </textarea>	
            </form>
        </section>
            
        <section class="teaser col-1-3">
          <a class="mybutton" href="searchstudent.jsp" target="_blank">SEARCH STUDENT</a>
        </section><!--

        Schedule

        --><section class="teaser col-1-3">
          <a align="center" class="mybutton" href="https://appear.in/ITroomVC" target="_blank">VIDEO CONFERENCING</a>
        </section><!--

        Venue

        --><section class="teaser col-1-3">
		  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a align="center" class="mybutton" href="email.jsp" target="_blank">SEND EMAIL</a>
        </section>

      </div>
        </section>
          
          <script type="text/javascript">
          var storeval = "";
          function changeText() 
          {
              var disval = "";
              storeval  = document.getElementById('sta').value;
              disval = document.getElementById('dta').value;
              storeval = "\n-> " + storeval + disval ;
              document.getElementById("dta").value = storeval; 
          }
          function doneText()
          {
              window.location.replace("teacher.jsp?mess="+storeval); 
          }
        </script>
        <%
          try {   
          if(request.getParameter("mess") != null)
          {
          String text = request.getParameter("mess");
          text = text + "\n" + sCurrentLine;
          PrintWriter pw = new PrintWriter(new FileOutputStream("C:/Users/Tarun/Documents/NetBeansProjects/Virtual_Learning/web/test.text"));
          pw.println("");
          pw.println(text);
          pw.close();
          }
          } catch(IOException e) {};
          %>
          
<!-- Footer -->

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