package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.DaoAluno;
import modelo.Aluno;

public class AlunoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DaoAluno dao = new DaoAluno();
       
    public AlunoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Aluno aluno = dao.selectById(id);

		ObjectMapper Obj = new ObjectMapper();
		String alunoJsonString = "";
		alunoJsonString = Obj.writeValueAsString(aluno);
		
		PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        out.print(alunoJsonString);
        out.flush();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
