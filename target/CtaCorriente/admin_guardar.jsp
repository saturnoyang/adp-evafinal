<%@ page import="java.sql.*"%>
<%
    String userName = request.getParameter("uname");
    String password = request.getParameter("password");
    String consulta = "";    
   
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cuentas_clientes",
            "root", "");
    
    consulta = "INSERT INTO usuario( nombre_usuario, password) VALUES ('" + userName + "','" +password + "')"; 
    
    Statement st = con.createStatement();
    int i = st.executeUpdate(consulta);

    
    if (i > 0 ) {        
        response.sendRedirect("admin.jsp");
    } else {
        out.println("error al agregar, intentar de nuevo <a href='admin_nuevo.jsp'>volver</a>");
    }
%>