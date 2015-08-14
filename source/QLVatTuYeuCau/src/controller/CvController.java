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
import util.FileUtil;


@Controller
public class CvController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    @RequestMapping("/cvManage")
	public ModelAndView manageCV(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	FileDAO fileDAO = new FileDAO();
		String action = request.getParameter("action");
		if("manageCv".equalsIgnoreCase(action)) {
			ArrayList<CongVan> congVanList = (ArrayList<CongVan>) new CongVanDAO().getAllCongVan();
			HashMap<Integer, File> fileHash = new HashMap<Integer, File>();
			for(CongVan congVan : congVanList) {
				int cvId = congVan.getCvId();
				File file = fileDAO.getByCongVanId(cvId);
				fileHash.put(cvId, file);
			}
			request.setAttribute("congVanList", congVanList);
			request.setAttribute("fileHash", fileHash);
			return new ModelAndView(siteMap.congVan);
		}
		if("download".equals(action)) {
			try {
				int cvId = Integer.parseInt(request.getParameter("file"));
				model.File f = fileDAO.getByCongVanId(cvId);
				java.io.File file = new java.io.File(f.getDiaChi());
				return new ModelAndView(siteMap.fileDownload, "file", file);
				
			} catch (NumberFormatException e){
				System.out.println("Cannot convert to int");
			}
		}
		return new ModelAndView("login");
	}

}
