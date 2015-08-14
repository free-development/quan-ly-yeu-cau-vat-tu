package controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;

import dao.CTNguoiDungDAO;
import dao.CongVanDAO;
import dao.DonViDAO;
import dao.FileDAO;
import dao.MucDichDAO;
import map.siteMap;
import model.CTNguoiDung;
import model.CongVan;
import model.DonVi;
import model.File;
import model.MucDich;
import model.TrangThai;
import util.DateUtil;
import util.FileUtil;
import util.StringUtil;


@Controller
public class CvController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String tempPath = "/home/quoioln/study/java/FileUpload/Temp/"; 
    private final String pathFile = "/home/quoioln/study/java/FileUpload/File/";
    
    public ModelAndView getCongvan(CongVanDAO congVanDAO, MucDichDAO mucDichDAO, FileDAO fileDAO, DonViDAO donViDAO, HttpServletRequest request) {
    	ArrayList<CongVan> congVanList = (ArrayList<CongVan>) congVanDAO.getAllCongVan();
		HashMap<Integer, File> fileHash = new HashMap<Integer, File>();
		ArrayList<DonVi> donViList = (ArrayList<DonVi>) donViDAO.getAllDonVi();
		ArrayList<MucDich> mucDichList = (ArrayList<MucDich>) mucDichDAO.getAllMucDich();
		for(CongVan congVan : congVanList) {
			int cvId = congVan.getCvId();
			fileHash.put(cvId, fileDAO.getByCongVanId(cvId));
		}
		request.setAttribute("congVanList", congVanList);
		request.setAttribute("fileHash", fileHash);
		request.setAttribute("mucDichList", mucDichList);
		request.setAttribute("donViList", donViList);
		return new ModelAndView(siteMap.congVan);
    }
    
    @RequestMapping("/cvManage")
	public ModelAndView manageCV(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	FileDAO fileDAO = new FileDAO();
    	CongVanDAO congVanDAO = new CongVanDAO();
    	MucDichDAO mucDichDAO =  new MucDichDAO();
    	DonViDAO donViDAO =  new DonViDAO();
		String action = request.getParameter("action");
		if("manageCv".equalsIgnoreCase(action)) {
			ArrayList<CongVan> congVanList = (ArrayList<CongVan>) congVanDAO.getAllCongVan();
			HashMap<Integer, File> fileHash = new HashMap<Integer, File>();
			ArrayList<DonVi> donViList = (ArrayList<DonVi>) donViDAO.getAllDonVi();
			ArrayList<MucDich> mucDichList = (ArrayList<MucDich>) mucDichDAO.getAllMucDich();
			for(CongVan congVan : congVanList) {
				int cvId = congVan.getCvId();
				fileHash.put(cvId, fileDAO.getByCongVanId(cvId));
			}
//			request.setAttribute("congVanList", congVanList);
//			request.setAttribute("fileHash", fileHash);
//			request.setAttribute("mucDichList", mucDichList);
//			request.setAttribute("donViList", donViList);
//			return new ModelAndView(siteMap.congVan);
			return getCongvan(congVanDAO, mucDichDAO, fileDAO, donViDAO, request);
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
//		if("addCv".equalsIgnoreCase(action))
		return new ModelAndView("login");
	}
    @RequestMapping("addCongVan")
    public ModelAndView addCV(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    	request.ge
    	CongVanDAO congVanDAO = new CongVanDAO();
    	MultipartRequest multipartRequest = new MultipartRequest(request, tempPath);
		String action = multipartRequest.getParameter("action");
		int soDen = Integer.parseInt(multipartRequest.getParameter("soDen"));
		String cvSo = multipartRequest.getParameter("cvSo");
		Date cvNgayGoi = DateUtil.parseDate(multipartRequest.getParameter("ngayGoi"));
		Date cvNgayNhan = DateUtil.parseDate(multipartRequest.getParameter("ngayNhan"));
		String mdMa = multipartRequest.getParameter("mucDich");
		String dvMa = multipartRequest.getParameter("donVi");
		String trichYeu = multipartRequest.getParameter("trichYeu");
		String butPhe = multipartRequest.getParameter("butPhe");
		
		// upload file
		Enumeration<String> listFileName = multipartRequest.getFileNames();		
		while(listFileName.hasMoreElements()) {
			String fileFullName = multipartRequest.getFilesystemName(listFileName.nextElement().toString());
			//int i = fileName.lastIndexOf("."); 
			java.io.File file = new java.io.File(tempPath + fileFullName);
			String fileName = FileUtil.getNameFile(file);
			String fileExtension = FileUtil.getExtension(file);
			if(fileExtension.length() > 0) {
				 fileName = fileName + "-" + soDen + "." + fileExtension;
			 } else {
				 fileName = fileName + "-" + soDen;
			 }
				
			file.renameTo(new java.io.File(pathFile + fileName));
			
		}
//		new CongVan(cvId, soDen, cvNgayNhan, cvSo, cvNgayDi, trichYeu, butPhe, mucDich, trangThai, donVi)
		System.out.println(dvMa);
		congVanDAO.addCongVan(new CongVan(1, cvNgayNhan, cvSo, cvNgayGoi, trichYeu, butPhe, new MucDich(mdMa), new TrangThai("DGQ",""), new DonVi(dvMa)));
		FileDAO fileDAO = new FileDAO();
    	MucDichDAO mucDichDAO =  new MucDichDAO();
    	DonViDAO donViDAO =  new DonViDAO();
    	return getCongvan(congVanDAO, mucDichDAO, fileDAO, donViDAO, request);
//    	return new ModelAndView("login");
    }
    @RequestMapping(value="/preEditCongVan", method=RequestMethod.POST, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String changePass(@RequestParam("cvId") String cvId) {

		System.out.println("OK");
		String result = "";
		if (new CTNguoiDungDAO().login(msnv, StringUtil.encryptMD5(passOld))) {
			new CTNguoiDungDAO().updateCTNguoiDung(new CTNguoiDung(msnv, StringUtil.encryptMD5(passNew)));
			result = "success";
		}
		else 
			result = "fail";
		return result;
	}
}
