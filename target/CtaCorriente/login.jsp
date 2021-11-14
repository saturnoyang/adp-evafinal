<%@ page import="java.sql.*"%>
<%
    String userName = request.getParameter("uname");
    String password = request.getParameter("password");
    String consulta = "";
    
    if(userName.equals("admin@test") && password.equals("user")  ){
    	out.println("se detecto el admin");
    	session.setAttribute("userid", userName);
    	response.sendRedirect("admin.jsp");
    }
    
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cuentas_clientes",
            "root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    consulta ="select * from usuario where nombre_usuario='" + userName + "' and password='" +password + "'" ;
    rs = st.executeQuery(consulta);
    out.println(consulta);
    
    if (rs.next()) {
        session.setAttribute("userid", userName);
        response.sendRedirect("ingresar.jsp");
    } else {
        out.println("Clave Incorrecta <a href='index.jsp'>intentar de nuevo</a>");
    }
%>