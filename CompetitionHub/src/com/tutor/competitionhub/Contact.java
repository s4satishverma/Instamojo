package com.tutor.competitionhub;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;

/**
 * Servlet implementation class Contact
 */
@WebServlet("/Contact")
public class Contact extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Contact() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 response.setContentType("text/html");
		 PrintWriter out = response.getWriter();
         String name = request.getParameter("name");
         String email = request.getParameter("emaill");
         String message = request.getParameter("message");
         out.println("<script type=\"text/javascript\">");
         out.println("alert('User or password incorrect');");
         out.println("</script>");
         
         boolean flag = Mailer.send("s4satishverma@gmail.com","Mystery@123","elpegverma@gmail.com","Contact Us from Website",name+"_"+email+"_"+message);
		if(flag)
		{
	     out.println("Thanks for your message, We'll contact you shortly");
		 RequestDispatcher rd = request.getRequestDispatcher("/contact.jsp");	
		 rd.forward(request, response);
		}
		else
		{
			out.print("Please try again.");
		}
        //doGet(request, response);
	}

}
