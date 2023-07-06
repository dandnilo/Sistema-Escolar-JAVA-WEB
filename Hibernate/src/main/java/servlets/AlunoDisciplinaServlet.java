package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.DaoAlunoDisciplina;
import modelo.AlunoDisciplina;

public class AlunoDisciplinaServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
	
	private DaoAlunoDisciplina dao = new DaoAlunoDisciplina();
       
    public AlunoDisciplinaServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		AlunoDisciplina ad = dao.selectById(id);
		
		ObjectMapper Obj = new ObjectMapper();
		String adJsonString = "";
		adJsonString = Obj.writeValueAsString(ad);
		
		PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        out.print(adJsonString);
        out.flush();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
