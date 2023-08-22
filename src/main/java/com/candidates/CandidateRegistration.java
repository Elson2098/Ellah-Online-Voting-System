package com.candidates;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class CandidateRegistration
 */
@WebServlet("/CandidateRegistration")
public class CandidateRegistration extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private final String UPLOAD_DIRECTORY = "C:\\Users\\ELSON\\eclipse-workspace\\ElsonVotingSystem\\src\\main\\webapp\\uploads";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				String c_id = request.getParameter("candidate_id");
				String cname = request.getParameter("candidate_name");
				String cemail = request.getParameter("candidate_email");
				String cmobile = request.getParameter("candidate_mobile");
				String cstudy_year = request.getParameter("candidate_study_year");
				String party_name = request.getParameter("candidate_party_name");
				String party_logo_name = request.getParameter("candidate_party_logo_name");
				String party_logo = request.getParameter("candidate_party_logo");
				String cstatus = request.getParameter("status");
				String username = request.getParameter("uname");
				String password = request.getParameter("upass");
				HttpSession hs = request.getSession();
				

				for (FileItem item : multiparts) {
					if (!item.isFormField()) {
						party_logo_name = new File(item.getName()).getName();
						item.write(new File(UPLOAD_DIRECTORY + File.separator + party_logo_name));

						FileItem candidate_id = (FileItem) multiparts.get(0);
						c_id = candidate_id.getString();

						FileItem candidate_name = (FileItem) multiparts.get(1);
						cname = candidate_name.getString();

						FileItem candidate_email = (FileItem) multiparts.get(2);
						cemail = candidate_email.getString();

						FileItem candidate_mobile = (FileItem) multiparts.get(3);
						cmobile = candidate_mobile.getString();

						FileItem candidate_study_year = (FileItem) multiparts.get(4);
						cstudy_year = candidate_study_year.getString();

						FileItem candidate_party_name = (FileItem) multiparts.get(5);
						party_name = candidate_party_name.getString();
					}
				}
				try {
					String candidate_party_logo = UPLOAD_DIRECTORY + party_logo_name;
					String status = "Pending";
					int i = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblcandidate(candidate_id,candidate_name,candidate_email,candidate_mobile,candidate_study_year,candidate_party_name,candidate_party_logo_name,candidate_party_logo,status,uname,upass)values('"+c_id+"','"+cname+"','"+cemail+"','"+cmobile+"','"+cstudy_year+"','"+party_name+"','"+party_logo_name+"','"+party_logo+"','"+status+"','"+username+"','"+password+"')");
					if (i > 0) {
						String success = "Candidate resitration successfully.";
						session.setAttribute("success-message", success);
						response.sendRedirect("candidate-registration.jsp");
					}

				} catch (Exception e) {
					e.printStackTrace();
				}
			} catch (Exception ex) {
				request.setAttribute("message", "Medical Prescription Upload Failed due to " + ex);
			}

		} else {
			request.setAttribute("message", "Sorry this code only handles file upload request");
		}

	}
}
