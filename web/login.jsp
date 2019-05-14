<%-- 
    Document   : login
    Created on : Feb 22, 2016, 1:12:34 PM
    Author     : Tarun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Welcome</title>
    </head>
    <body>
        <%@ page import="java.sql.*" %>
        <%@ page import="javax.sql.*" %>
        <%@ page session="true" %>
        <%
            
            response.setHeader("Pragma","no-cache"); 
            response.setHeader("Cache-Control","no-store"); 
            response.setHeader("Expires","0"); 
            response.setDateHeader("Expires",-1);
            String uid = request.getParameter("id");
            String key = request.getParameter("pass");
            String opt = null;
            String id = null;
            String word = uid.substring(0,4);
            if(word.equals("0105"))
            {
                opt = "Student";
                id = "S_ID";
            }
            else
            {
                opt = "Teacher";
                id = "T_ID";
            }
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/My_database", "root", "tarun");
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select "+id+",Password,F_Name,L_Name from "+opt+" where "+id+"='"+uid+"'");
            //String name = rs.getString(3) + " "+ rs.getString(4);
            session.setAttribute("yourid", uid); 
            session.setAttribute("sopt", opt); 
            session.setAttribute("attr",id); 
            if(rs.next()) 
            {   
                if(rs.getString(2).equals(key)) 
            { 
                String name= rs.getString(3) +" "+ rs.getString(4);
                session.setAttribute("name", name);  
                if(opt.equals("Teacher"))
                {
                    %>
                    <jsp:forward page="teacher.jsp">
                    <jsp:param name="temp" value= "name" />  
                    </jsp:forward>
                    
                    <jsp:forward page="profile.jsp">
                    <jsp:param name="temp" value= "name" />  
                    </jsp:forward>
                    <%
                }
                else
                {%>
                    <jsp:forward page="student.jsp">
                    <jsp:param name="temp" value= "name" />  
                    </jsp:forward>
                    <jsp:forward page="student.jsp">
                    <jsp:param name="temp" value= "yourid" />  
                    </jsp:forward>
                    <jsp:forward page="profile.jsp">
                    <jsp:param name="temp" value= "name" />  
                    </jsp:forward>
                <%}
            } 
            else 
            { 
                out.println("Invalid password try again"); 
            } 
            }
                %>
            <jsp:forward page="profile.jsp">
            <jsp:param name="temp" value= "yourid" />  
            </jsp:forward>
            <jsp:forward page="profile.jsp">
            <jsp:param name="temp" value= "sopt" />  
            </jsp:forward>
            <jsp:forward page="profile.jsp">
            <jsp:param name="temp" value= "attr" />  
            </jsp:forward>
        <%
            rs.close();
            st.close();
            con.close();
        %>   
      
    </body>
</html>
