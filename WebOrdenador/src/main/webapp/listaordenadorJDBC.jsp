<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="es.curso.negocio.Ordenador"%>
<%@ page import="es.curso.repositories.OrdenadorRepository"%>
<%@ page import="es.curso.repositories.jdbc.OrdenadorRepositoryJDBC"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listado de ordenadores</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>

	<h1>Ordenadores</h1>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

	<div class="container">


		<%
		OrdenadorRepository repo = new OrdenadorRepositoryJDBC();
		List<Ordenador> lista = null;

		if (request.getParameter("orden") != null) {
			out.println("Ordenado por " + request.getParameter("orden"));
			lista = repo.buscarTodosOrdenados(request.getParameter("orden"));
		} else {

			out.println("Lista sin ordenar");
			lista = repo.buscarTodos();
		}
		%>

		<h1>Listado de ordenadores</h1>
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th><a href="?orden=marca"> Marca</a></th>
					<th><a href="?orden=precio">Precio</a></th>
					<th>Borrar</th>
				</tr>
			</thead>


			<%
			for (Ordenador e : lista) {
			%>
			<tr>
				<td><%=e.getMarca()%></td>
				<td><%=e.getPrecio()%></td>
				<td><a class="btn btn-secondary"
					href="?comando=borrarordenador&id=<%=e.getMarca()%>"> Borrar</a></td>
			</tr>
			<%
			}
			%>
		</table>
		<a href="?comando=formularioordenador"> Insertar ordenador</a>
</body>
</html>