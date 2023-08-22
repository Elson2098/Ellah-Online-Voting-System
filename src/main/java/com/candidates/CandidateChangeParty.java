package com.candidates;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class CandidateChangeParty
 */
@WebServlet("/CandidateChangeParty")
public class CandidateChangeParty extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CandidateChangeParty() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cparty = request.getParameter("cparty");
		String party = request.getParameter("party");
		String confparty = request.getParameter("confparty");
		String pass = "";
		HttpSession session = request.getSession();
		try {
			Connection con = DatabaseConnection.getConnection();
			Statement statement = con.createStatement();
			ResultSet resultset = statement.executeQuery("select candidate_party_name from tblcandidate where candidate_party_name='" + cparty+ "' and candidate_name='" + session.getAttribute("candidate_name") + "'");
			if (resultset.next()) {
				pass = resultset.getString(1);
			}
			if (equals(confparty)) {
				if (pass.equals(cparty)) {
					int i = statement.executeUpdate("update tblcandidate set candidate_party_name='" + party + "' where candidate_name='" + session.getAttribute("candidate_name") + "root");
					String message = "Party changed successfully.";
					session.setAttribute("party-change-success", message);
					response.sendRedirect("candidate-change-partyname.jsp");
				} else {
					String message = "Old party doesn't match.";
					session.setAttribute("party-change-fail", message);
					response.sendRedirect("candidate-change-partyname.jsp");
				}
			} else {
				String message = "New party and confirmed party doesn't match.";
				session.setAttribute("party-not-match", message);
				response.sendRedirect("candidate-change-partyname.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

