package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.todo.entities.NoteTaker;
import com.todo.factoryCreater.FactoryProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SaveNoteServlet")
public class SaveNoteServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String title = req.getParameter("title");
			String content = req.getParameter("content");

			NoteTaker note = new NoteTaker(title, content, new Date());

			System.out.println(note.getId() + " : " + note.getTitle());

			// TODO:- HIbernate save() operation.
			Session session = FactoryProvider.getFactory().openSession();
			Transaction tns = session.beginTransaction();

			session.persist(note);
			tns.commit();
			session.close();
			
			resp.setContentType("text/html");
			PrintWriter writer = resp.getWriter();
			writer.println("<h1 style='text-align:center'>Note is added successfully..</h1>");
			writer.println("<h1 style='text-align:center'><a href='all_notes.jsp'>View all notes.</a></h1>");
			

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
