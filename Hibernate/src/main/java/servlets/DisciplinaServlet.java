package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.DaoDisciplina;
import modelo.Disciplina;

public class DisciplinaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DaoDisciplina dao = new DaoDisciplina();
       
    public DisciplinaServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Disciplina disciplina = dao.selectById(id);
		
		ObjectMapper Obj = new ObjectMapper();
		String disciplinaJsonString = "";
		disciplinaJsonString = Obj.writeValueAsString(disciplina);
		
		PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        out.print(disciplinaJsonString);
        out.flush();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
