package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.CongVanDAO;
import dao.DonViDAO;
import dao.FileDAO;
import map.siteMap;
import model.CongVan;
import model.File;


@Controller
public class CvController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    @RequestMapping("/cvManage")
	public ModelAndView manageCV(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		DonViDAO donViDAO = new DonViDAO();
    	FileDAO fileDAO = new FileDAO();
		
		String action = request.getParameter("action");
		if("manageCv".equals(action)) {
			ArrayList<CongVan> congVanList = (ArrayList<CongVan>) new CongVanDAO().getAllCongVan();
			HashMap<Integer, File> fileHash = new HashMap<Integer, File>();
			for(CongVan congVan : congVanList) {
				int cvId = congVan.getCvId();
				fileHash.put(cvId, fileDAO.getByCongVanId(cvId));
			}
			request.setAttribute("congvanList", congVanList);
			request.setAttribute("fileHash", fileHash);
			return new ModelAndView(siteMap.congVan);
		}
		return new ModelAndView("login");
	}

}
