

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

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.liferay.portal.kernel.upload.UploadPortletRequest;
import com.liferay.portal.kernel.util.ParamUtil;

import java.util.List;

/**
 * Servlet implementation class ReadExcel
 */
@WebServlet("/ReadExcel")
public class ReadExcel extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int BUFFER_SIZE = 4096;
	String filePath = "/quoioln/home";
	String pathTemp = "/home/quoioln";
	private boolean isMultipart;
   private int maxFileSize = 50 * 1024;
   private int maxMemSize = 4 * 1024;
   private File file ;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReadExcel() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tempPath = request.getParameter("file");
		String path = tempPath.replace("\\", "/");
		System.out.println(request.getParameter("file"));
		System.out.println(request.getParameter("name"));
		//String path = tempPath.replace("\\", "/");
		/*
		PrintWriter out = response.getWriter();
		
		response.setContentType("text/html");
		
		System.out.println(path);
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		//ServletFileUpload upload = new ServletFileUpload(factory);
		List fileItems;
		try{ 
		      // Parse the request to get file items.
		     	fileItems = upload.parseRequest(request);
			
		      // Process the uploaded file items
		      Iterator i = fileItems.iterator();

		      out.println("<html>");
		      out.println("<head>");
		      out.println("<title>Servlet upload</title>");  
		      out.println("</head>");
		      out.println("<body>");
		      String fileName =""; 
		      while ( i.hasNext () ) 
		      {
		         FileItem fi = (FileItem)i.next();
		         if ( !fi.isFormField () )	
		         {
		            // Get the uploaded file parameters
		            String fieldName = fi.getFieldName();
		            fileName = fi.getName();
		            System.out.println("truoc khi cat" + fileName +"****");
		            String contentType = fi.getContentType();
		            boolean isInMemory = fi.isInMemory();
		            long sizeInBytes = fi.getSize();
		            // Write the file
		            /*
		            if( fileName.lastIndexOf("\\") >= 0 ){
		               file = new File( filePath + fileName.substring( fileName.lastIndexOf("\\"))) ;
		            }else{
		               file = new File( filePath + 
		               fileName.substring(fileName.lastIndexOf("\\")+1)) ;
		            }
		            fi.write( file ) ;
		            out.println("Uploaded Filename: " + fileName + "<br>");
		            
		         }
		      }
			*/
		isMultipart = ServletFileUpload.isMultipartContent(request);
	      response.setContentType("text/html");
	      java.io.PrintWriter out = response.getWriter( );
	      if( !isMultipart ){
	         out.println("<html>");
	         out.println("<head>");
	         out.println("<title>Servlet upload</title>");  
	         out.println("</head>");
	         out.println("<body>");
	         out.println("<p>No file uploaded</p>"); 
	         out.println("</body>");
	         out.println("</html>");
	         return;
	      }
	      DiskFileItemFactory factory = new DiskFileItemFactory();
	      // maximum size that will be stored in memory
	      factory.setSizeThreshold(maxMemSize);
	      // Location to save data that is larger than maxMemSize.
	      factory.setRepository(new File("c:\\temp"));

	      // Create a new file upload handler
	      ServletFileUpload upload = new ServletFileUpload(factory);
	      // maximum file size to be uploaded.
	      upload.setSizeMax( maxFileSize );

	      try{ 
		      // Parse the request to get file items.
		      List fileItems = upload.parseRequest(request);
			
		      // Process the uploaded file items
		      Iterator i = fileItems.iterator();
	
		      out.println("<html>");
		      out.println("<head>");
		      out.println("<title>Servlet upload</title>");  
		      out.println("</head>");
		      out.println("<body>");
		      File file = new File("temp");
		      file.createNewFile();
		      //FileOutputStream file = new FileOutputStream("temp");
		      FileItem fi = (FileItem)i.next();
//		      fi.g
		      fi.write(file);
		      //file.write();
		      //file.
		      /*
		      while ( i.hasNext () ) 
		      {
		         
		         if ( !fi.isFormField () )	
		         {
		            // Get the uploaded file parameters
		            String fieldName = fi.getFieldName();
		            String fileName = fi.getName();
		            String contentType = fi.getContentType();
		            boolean isInMemory = fi.isInMemory();
		            long sizeInBytes = fi.getSize();
		            // Write the file
		           
		            fi.write( file ) ;
		            out.println("Uploaded Filename: " + fileName + "<br>");
		         }
		      }*/
			//System.out.println(fileName);
			//FileInputStream file1 = new FileInputStream(source);
			HSSFWorkbook wb = new HSSFWorkbook(new FileInputStream(file));
			 
			HSSFSheet sheet=wb.getSheetAt(0);
			HSSFRow row; 
			HSSFCell cell;
	 		Iterator rows = sheet.rowIterator();
	 		
	 		
	 		while (rows.hasNext())
			{
				row=(HSSFRow) rows.next();
				Iterator cells = row.cellIterator();
			
				while (cells.hasNext())
				{
					cell=(HSSFCell) cells.next();
			
					if (cell.getCellType() == HSSFCell.CELL_TYPE_STRING)
					{
						System.out.print(cell.getStringCellValue()+" ");
					}
					else if(cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC)
					{
						System.out.print(cell.getNumericCellValue()+" ");
					}
					else
					{
						//U Can Handel Boolean, Formula, Errors
					}
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		isMultipart = ServletFileUpload.isMultipartContent(request);
	      response.setContentType("text/html");
	      java.io.PrintWriter out = response.getWriter( );
//	      System.out.println(request.getParameter("name"));
//	      UploadPortletRequest uploadRequest = PortalUtil.getUploadPortletRequest(request);
//	      String email = ParamUtil.getString(request, "name");
//	      MultiPartFormData multipartData =  new MultiPartFormData();
//	      System.out.println(multipartData.getParameter("name"));
	      if( !isMultipart ){
	         out.println("<html>");
	         out.println("<head>");
	         out.println("<title>Servlet upload</title>");  
	         out.println("</head>");
	         out.println("<body>");
	         out.println("<p>No file uploaded</p>"); 
	         out.println("</body>");
	         out.println("</html>");
	         return;
	      }
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
	
		      out.println("<html>");
		      out.println("<head>");
		      out.println("<title>Servlet upload</title>");  
		      out.println("</head>");
		      out.println("<body>");
		      File file = new File("temp.xls");
//		      file.createNewFile();
		      //FileOutputStream file = new FileOutputStream("temp");
		      FileItem fi = (FileItem)i.next();
//		      fi.g
		      fi.write(file);
		      //file.write();
		      //file.
		      /*
		      while ( i.hasNext () ) 
		      {
		         
		         if ( !fi.isFormField () )	
		         {
		            // Get the uploaded file parameters
		            String fieldName = fi.getFieldName();
		            String fileName = fi.getName();
		            String contentType = fi.getContentType();
		            boolean isInMemory = fi.isInMemory();
		            long sizeInBytes = fi.getSize();
		            // Write the file
		           
		            fi.write( file ) ;
		            out.println("Uploaded Filename: " + fileName + "<br>");
		         }
		      }*/
			//System.out.println(fileName);
			//FileInputStream file1 = new FileInputStream(source);
			HSSFWorkbook wb = new HSSFWorkbook(new FileInputStream(file));
			 
			HSSFSheet sheet=wb.getSheetAt(0);
			HSSFRow row; 
			HSSFCell cell;
	 		Iterator rows = sheet.rowIterator();
	 		
	 		
	 		while (rows.hasNext())
			{
				row=(HSSFRow) rows.next();
				Iterator cells = row.cellIterator();
			
				while (cells.hasNext())
				{
					cell=(HSSFCell) cells.next();
			
					if (cell.getCellType() == HSSFCell.CELL_TYPE_STRING)
					{
						System.out.print(cell.getStringCellValue()+" ");
					}
					else if(cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC)
					{
						System.out.print(cell.getNumericCellValue()+" ");
					}
					else
					{
						//U Can Handel Boolean, Formula, Errors
					}
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
