<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="utf-8">
    <title>Send Email</title>
    <link rel="stylesheet" href="assets/stylesheets/main.css">
    <link rel="stylesheet" href="assets/stylesheets/font.css">
    <link rel="stylesheet" href="assets/stylesheets/style.css">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:100,300,400">
  </head>

  <body>

    <!-- Header -->

    <header class="primary-header container group">

      <h1 class="logo">
        <a href="#">Virtual <br> Learning</a>
      </h1>

      <h3 class="tagline">A place to learn</h3>
     <!--
     <nav class="nav primary-nav">
        <ul>
          <li><a href="index.html">Home</a></li>
          <li><a href="speakers.html">Attendance</a></li>
          <li><a href="venue.html">Venue</a></li> 
          <li><a href="register.html">Logout</a></li>
        </ul>
      </nav> 
     -->

    </header>

    <!-- Lead -->

    <section class="row-alt">
      <div class="lead container">

        <h1>Email</h1>

      </div>
    </section>

	<section class="row">
		<form action="email.jsp" method="post" class="smart-green">
		<h1>Send Email 
			<span>Please fill all the texts in the fields.</span>
		</h1>
		<label>
			<span>Your Email :</span>
			<input id="senderemail" type="text" name="sendername" placeholder="Your Valid Email Address" />
		</label>
    
		<label>
			<span>Your Password :</span>
			<input id="pass" type="password" name="pass" placeholder="Your Password" />
		</label>
		
		<label>
			<span>Subject :</span>
			<input id="subject" type="text" name="subject" placeholder="Enter subject" />
		</label>
    
		<label>
			<span>Message :</span>
			<textarea id="message" name="message" placeholder="Your Message to Us"></textarea>
		</label>

		<!-- <label>
			<span>Attachment : &nbsp;</span>
			<input id="attach" type="file" name="attach"/>
		</label>	-->
		
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
			<input type="Submit" class="button" value="Send" /> 
		</label>    
		</form>
	</section>	
<%@ page import="java.util.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page session="true" %>
<%
  int k=0;
  final String id = request.getParameter("sendername");
  final String pass = request.getParameter("pass");
  String sub = request.getParameter("subject");
  String text = request.getParameter("message");
  String option = request.getParameter("selection");
  Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/My_database", "root", "tarun");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select email from student where Sem="+option+"");
rs.last(); 
int total = rs.getRow();
rs.beforeFirst();
String to[] = new String[total];
while(rs.next())
{
    to[k]=rs.getString("email");
    k++;
}
  Properties props = new Properties();  
  props.put("mail.smtp.host", "smtp.gmail.com");   
  props.put("mail.smtp.auth", "true");  
  props.put("mail.smtp.port", "587"); 
  props.put("mail.smtp.starttls.enable", "true");
  props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
  Authenticator auth = new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(id, pass);
			}
		};
Session mailSession = Session.getInstance(props, auth);
try
{
Message msg = new MimeMessage(mailSession);
msg.setFrom(new InternetAddress(id));
InternetAddress[] address = new InternetAddress[to.length];

for(int j = 0; j <total; j++)
{
    address[j] = new InternetAddress(to[j]);
}

msg.setRecipients(Message.RecipientType.TO, address);
msg.setSubject(sub);
msg.setText(text);
// Hand the message to the default transport service
// for delivery. 
Transport.send(msg);

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