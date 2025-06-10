package com.servlets;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.todo.entities.NoteTaker;
import com.todo.factoryCreater.FactoryProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int noteId = Integer.parseInt(req.getParameter("note_id").trim());
			Session session = FactoryProvider.getFactory().openSession();
			Transaction tns = session.beginTransaction();
			NoteTaker note = session.get(NoteTaker.class, noteId);
			session.delete(note);
			tns.commit();
			session.close();
			resp.sendRedirect("all_notes.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
