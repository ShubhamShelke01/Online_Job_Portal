package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.jobDAO;
import com.entity.Jobs;
@WebServlet("/add_job")
public class AddPostServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			String title = req.getParameter("title");
			String location = req.getParameter("location");
			String category = req.getParameter("category");
			String status = req.getParameter("status");
			String desc = req.getParameter("desc");

			Jobs j = new Jobs();
			j.setTitle(title);
			j.setLocation(location);
			j.setCategory(category);
			j.setStatus(status);
			j.setDescription(desc);

			HttpSession session = req.getSession();

			jobDAO dao = new jobDAO(DBConnect.getConn());
			boolean f = dao.addJob(j);
			if (f) 
			{
				session.setAttribute("succMsg", "Job Post Sucessful..");
				resp.sendRedirect("add_job.jsp");
			} else {
				session.setAttribute("succMsg", "Something Wrong On Server");
				resp.sendRedirect("add_job.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
