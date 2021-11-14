<%@ page import="java.sql.*"%>
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
usted no ha ingresado<br/>
<a href="index.jsp">por favor ingrese</a>
<%} else {
%>
Bienvenido <%=session.getAttribute("userid")%>
<a href='salir.jsp'>Salir</a>
<%


try{
	
	String consulta = "";
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cuentas_clientes",
	        "root", "");
	Statement st = con.createStatement();
	ResultSet rs;
	consulta ="select * from usuario" ;
	rs = st.executeQuery(consulta);
	out.println("<a href='admin_nuevo.jsp'>Agregar Nuevo</a>");
	out.println("<table>");
    while(rs.next()){  
          
    	out.println("<tr><td>");
    	out.println(rs.getInt("id"));
    	out.println("</td><td>");
    	out.println(rs.getString("nombre_usuario"));
    	out.println("</td><td>");
    	out.println("Cambiar Clave");
    	out.println("</td><td>");
    	out.println("Eliminar");
    	out.println("</td></tr>");

          
    }
    out.println("</table>");
	
}catch(Exception e){
	out.println(e);
}





    }
%>