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
import dao.CTVatTuDAO;
import dao.ChatLuongDAO;
import dao.CongVanDAO;
import dao.DonViDAO;
import dao.FileDAO;
import dao.MucDichDAO;
import dao.NoiSanXuatDAO;
import dao.TrangThaiDAO;
import map.siteMap;
import model.CTNguoiDung;
import model.CTVatTu;
import model.ChatLuong;
import model.CongVan;
import model.DonVi;
import model.File;
import model.MucDich;
import model.TrangThai;
import util.DateUtil;
import util.FileUtil;
import util.JSonUtil;
import util.StringUtil;


@Controller
public class CvController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int page = 1;
	private final String tempPath = "D:/Goc Hoc Tap/free-deverlop/Temp/"; 
    private final String pathFile = "D:/Goc Hoc Tap/free-deverlop/File/";
    public ModelAndView getCongvan(TrangThaiDAO trangThaiDAO, CongVanDAO congVanDAO, MucDichDAO mucDichDAO, FileDAO fileDAO, DonViDAO donViDAO, HttpServletRequest request) {
    	ArrayList<CongVan> congVanList = (ArrayList<CongVan>) congVanDAO.getAllCongVan();
		HashMap<Integer, File> fileHash = new HashMap<Integer, File>();
		ArrayList<DonVi> donViList = (ArrayList<DonVi>) donViDAO.getAllDonVi();
		ArrayList<MucDich> mucDichList = (ArrayList<MucDich>) mucDichDAO.getAllMucDich();
		ArrayList<TrangThai> trangThaiList = (ArrayList<TrangThai>) trangThaiDAO.getAllTrangThai();
		for(CongVan congVan : congVanList) {
			int cvId = congVan.getCvId();
			fileHash.put(cvId, fileDAO.getByCongVanId(cvId));
		}
		request.setAttribute("congVanList", congVanList);
		request.setAttribute("fileHash", fileHash);
		request.setAttribute("mucDichList", mucDichList);
		request.setAttribute("donViList", donViList);
		request.setAttribute("trangThaiList", trangThaiList);
		return new ModelAndView(siteMap.congVan);
    }
    
    @RequestMapping("/cvManage")
	public ModelAndView manageCV(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	FileDAO fileDAO = new FileDAO();
    	CongVanDAO congVanDAO = new CongVanDAO();
    	MucDichDAO mucDichDAO =  new MucDichDAO();
    	DonViDAO donViDAO =  new DonViDAO();
    	TrangThaiDAO trangThaiDAO =  new TrangThaiDAO();
		String action = request.getParameter("action");
		if("manageCv".equalsIgnoreCase(action)) {
			System.out.println("OK");
			ArrayList<CongVan> congVanList = (ArrayList<CongVan>) congVanDAO.getAllCongVan();
			HashMap<Integer, File> fileHash = new HashMap<Integer, File>();
			ArrayList<DonVi> donViList = (ArrayList<DonVi>) donViDAO.getAllDonVi();
			ArrayList<MucDich> mucDichList = (ArrayList<MucDich>) mucDichDAO.getAllMucDich();
			System.out.println("OK1");
			for(CongVan congVan : congVanList) {
				int cvId = congVan.getCvId();
				File file = fileDAO.getByCongVanId(cvId);
				fileHash.put(cvId, file);
			}
			System.out.println("OK2");
//			request.setAttribute("congVanList", congVanList);
//			request.setAttribute("fileHash", fileHash);
//			request.setAttribute("mucDichList", mucDichList);
//			request.setAttribute("donViList", donViList);
//			return new ModelAndView(siteMap.congVan);
			return getCongvan(trangThaiDAO, congVanDAO, mucDichDAO, fileDAO, donViDAO, request);
		}
		if("manageCv".equalsIgnoreCase(action)) {
			long size = congVanDAO.size();
			ArrayList<CongVan> congVanList =  (ArrayList<CongVan>) congVanDAO.limit(page, 10);
			request.setAttribute("size", size);
			return new ModelAndView("cong-van", "congVanList", congVanList);
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
    	FileDAO fileDAO = new FileDAO();
    	int cvId = congVanDAO.getLastInsert();
    	int fileId = fileDAO.getLastInsert();
    	MultipartRequest multipartRequest = new MultipartRequest(request, tempPath);
		String action = multipartRequest.getParameter("action");
//		int soDen = Integer.parseInt(multipartRequest.getParameter("soDen"));
		String cvSo = multipartRequest.getParameter("cvSo");
		Date cvNgayGoi = DateUtil.parseDate(multipartRequest.getParameter("ngayGoi"));
		Date cvNgayNhan = DateUtil.parseDate(multipartRequest.getParameter("ngayNhan"));
		String mdMa = multipartRequest.getParameter("mucDich");
		String dvMa = multipartRequest.getParameter("donVi");
		String trichYeu = multipartRequest.getParameter("trichYeu");
		String butPhe = multipartRequest.getParameter("butPhe");
		String moTa = multipartRequest.getParameter("moTa");
		int soDen = congVanDAO.getSoDenMax();
		if (cvNgayNhan.getDate() == 1)
			soDen = 1;
		// upload file
		String fileFullName = "";
		Enumeration<String> listFileName = multipartRequest.getFileNames();		
		String fileName = "";
		while(listFileName.hasMoreElements()) {
			fileFullName = multipartRequest.getFilesystemName(listFileName.nextElement().toString());
			//int i = fileName.lastIndexOf("."); 
			java.io.File file = new java.io.File(tempPath + fileFullName);
			fileName = FileUtil.getNameFile(file);
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
//		java.util.Date.
		congVanDAO.addCongVan(new CongVan (cvId, soDen, cvSo, cvNgayNhan, cvNgayGoi, trichYeu, butPhe, new MucDich(mdMa), new TrangThai("DGQ",""), new DonVi(dvMa),0));
		fileDAO.addFile(new File(pathFile + fileName, moTa, cvId));
    	MucDichDAO mucDichDAO =  new MucDichDAO();
    	DonViDAO donViDAO =  new DonViDAO();
    	TrangThaiDAO trangThaiDAO =  new TrangThaiDAO();
    	return getCongvan(trangThaiDAO, congVanDAO, mucDichDAO, fileDAO, donViDAO, request);
//    	return new ModelAndView("login");
    }
    @RequestMapping(value="/preEditCongVan", method=RequestMethod.POST, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String changePass(@RequestParam("cvId") int cvId) {
    	CongVanDAO congVanDAO = new CongVanDAO();
		System.out.println("OK");
		CongVan congVan = congVanDAO.getCongVan(cvId);
		return JSonUtil.toJson(congVan);
	}
    
	@RequestMapping(value="/deleteCv", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String deleteNsx(@RequestParam("cvId") String cvId) {
		int id = Integer.parseInt(cvId);
		new CongVanDAO().deleteCongVan(id);
	//	return toJson(nsxList);
		return JSonUtil.toJson(cvId);
	}
	
	@RequestMapping(value="/loadPageCv", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String loadPageCv(@RequestParam("pageNumber") String pageNumber) {
		String result = "";
		System.out.println("MA: " + pageNumber);
		CongVanDAO cvDAO = new CongVanDAO();
		int page = Integer.parseInt(pageNumber);
		ArrayList<CongVan> cvList = (ArrayList<CongVan>) cvDAO.limit((page -1 ) * 10, 10);
		
		/*
		if(new NoiSanXuatDAO().getNoiSanXuat(nsxMa)==null)
		{
			new NoiSanXuatDAO().addNoiSanXuat(new NoiSanXuat(nsxMa, nsxTen,0));
			System.out.println("success");
			result = "success";	
		}
		else
		{
			System.out.println("fail");
			result = "fail";
		}
		*/
			return JSonUtil.toJson(cvList);
	}
}
