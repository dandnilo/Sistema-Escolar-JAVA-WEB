package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.DaoTurma;
import modelo.Turma;

public class TurmaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DaoTurma dao = new DaoTurma();
       
    public TurmaServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Turma turma = dao.selectById(id);
		
		ObjectMapper Obj = new ObjectMapper();
		String turmaJsonString = "";
		turmaJsonString = Obj.writeValueAsString(turma);
		
		PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        out.print(turmaJsonString);
        out.flush();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
