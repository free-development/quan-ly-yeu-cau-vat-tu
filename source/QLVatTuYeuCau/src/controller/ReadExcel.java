package controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import map.siteMap;
import model.CTVatTu;
import model.ChatLuong;
import model.NoiSanXuat;
import model.VatTu;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.liferay.portal.kernel.upload.UploadPortletRequest;
import com.liferay.portal.kernel.util.ParamUtil;

import dao.CTVatTuDAO;
import dao.ChatLuongDAO;
import dao.NoiSanXuatDAO;
import dao.VatTuDAO;

import java.util.List;

/**
 * Servlet implementation class ReadExcel
 */
@Controller
public class ReadExcel extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int BUFFER_SIZE = 4096;
	String filePath = "E:/import";
	String pathTemp = "E:";
	private boolean isMultipart;
   private int maxFileSize = 100 * 1024;
   private int maxMemSize = 50 * 1024;
   private File file ;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
   @RequestMapping("/readExcel")
	protected ModelAndView readExcel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		isMultipart = ServletFileUpload.isMultipartContent(request);
	      response.setContentType("text/html");
	      java.io.PrintWriter out = response.getWriter( );
	      
	      DiskFileItemFactory factory = new DiskFileItemFactory();
	      // maximum size that will be stored in memory
	      factory.setSizeThreshold(maxMemSize);
	      // Location to save data that is larger than maxMemSize.
	      factory.setRepository(new File(pathTemp));

	      // Create a new file upload handler
	      ServletFileUpload upload = new ServletFileUpload(factory);
	      // maximum file size to be uploaded.
	      upload.setSizeMax( maxFileSize );
	  	
	      try{ 
		      // Parse the request to get file items.
		      List fileItems = upload.parseRequest(request);
			
		      // Process the uploaded file items
		      Iterator i = fileItems.iterator();
	
		      File file = new File("temp.xls");

		      FileItem fi = (FileItem)i.next();
//		      fi.g
		      fi.write(file);

				HSSFWorkbook wb = new HSSFWorkbook(new FileInputStream(file));
				 
				HSSFSheet sheet=wb.getSheetAt(0);
				HSSFRow row; 
				HSSFCell cell;
		 		Iterator rows = sheet.rowIterator();
		 		
		 		//boolean dem = false;
		 		int j = 0;
		 		while (rows.hasNext() )
				{
		 			
	 				row=(HSSFRow) rows.next();
	 				j++;
		 			if (j == 1) 
		 				continue;
					Iterator cells = row.cellIterator();
					
					int count = 0;
					String vtMa = "";	
					///Mã VT	Tên vật tư 	ĐVT	MãNSX	Nơi sản xuất	Mã CL	Chất lượng	Số lượng	Định mức
					String vtTen = "";
					String dvt = "";
					String nsxMa = "";	
					String nsxTen = "";	
					String clMa = "";	
					String clTen = "";	
					double soLuong = 0;
					double dinhMuc = 0;
					while (cells.hasNext())
					{
						cell = (HSSFCell) cells.next();
						if (cell.getCellType() == HSSFCell.CELL_TYPE_STRING)
						{
							//System.out.print(cell.getStringCellValue()+"\t");
							switch(count) {
							 	case 0: vtMa = cell.getStringCellValue();break;
							 	case 1: vtTen = cell.getStringCellValue();break;
							 	case 2: dvt = cell.getStringCellValue();break;
							 	case 3: nsxMa = cell.getStringCellValue();break;
							 	case 4: nsxTen = cell.getStringCellValue();break;
							 	case 5: clMa = cell.getStringCellValue();break;
							 	case 6: clTen = cell.getStringCellValue();break;
							}
						}
						else if(cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC)
						{
							//System.out.print(cell.getNumericCellValue()+" ");
							switch(count) {
//								case 0: vtMa = cell.getNumericCellValue()+ "";break;
//								case 5: clMa = cell.getNumericCellValue() + "";break;
							 	case 7: soLuong = cell.getNumericCellValue();break;
							 	case 8: dinhMuc = cell.getNumericCellValue();break;
							}
						}
						else
						{
							//U Can Handel Boolean, Formula, Errors
						}
						//System.out.println();
						count++;
					}
					System.out.println(vtMa);
					System.out.println(vtTen);
					System.out.println(dvt);
					System.out.println(nsxMa);
					System.out.println(nsxTen);
					System.out.println(clMa);
					System.out.println(clTen);
					System.out.println(dinhMuc);
					System.out.println(soLuong);
					VatTuDAO vtDAO = new VatTuDAO();				
					NoiSanXuatDAO nsxDAO = new NoiSanXuatDAO();
					ChatLuongDAO clDAO = new ChatLuongDAO();
					CTVatTuDAO ctvtDAO = new CTVatTuDAO();
					
					vtDAO.addOrUpdateVatTu(new VatTu(vtMa, vtTen, dvt, 0));				
					nsxDAO.addOrUpdateNoiSanXuat(new NoiSanXuat(nsxMa, nsxTen, 0));
					clDAO.addOrUpdateChatLuong(new ChatLuong(clMa, clTen, 0));
					CTVatTu ctvtCheck = ctvtDAO.getCTVatTu(vtMa, nsxMa, clMa);
					if (ctvtCheck == null) {
						int idCtvt =  ctvtDAO.getLastInsert();
						ctvtDAO.addCTVatTu(new CTVatTu(new VatTu(vtMa), new NoiSanXuat(nsxMa), new ChatLuong(clMa), (int) dinhMuc, (int)soLuong, 0));
					} else {
						int idCtvt = ctvtCheck.getCtvtId();
						ctvtDAO.updateCTVatTu(new CTVatTu(idCtvt, new VatTu(vtMa), new NoiSanXuat(nsxMa), new ChatLuong(clMa), (int) dinhMuc, (int)soLuong, 0));
					}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	      
	      
	      return new ModelAndView(siteMap.ctVatu);
	     
	}

}
