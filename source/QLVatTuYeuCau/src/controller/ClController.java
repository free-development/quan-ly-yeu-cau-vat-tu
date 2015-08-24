package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ChatLuong;
import model.MucDich;
import model.NoiSanXuat;
import model.VaiTro;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import util.JSonUtil;
import dao.ChatLuongDAO;
import dao.MucDichDAO;
import dao.NoiSanXuatDAO;
import dao.VaiTroDAO;

@Controller
public class ClController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int page = 1;
	@RequestMapping("/manageCl")
	public ModelAndView manageCl(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ChatLuongDAO chatLuongDAO = new ChatLuongDAO();
		String action = request.getParameter("action");
		if("AddCl".equalsIgnoreCase(action)) {
			String clMa = request.getParameter("clMa");
			String clTen = request.getParameter("clTen");
			if(new ChatLuongDAO().getChatLuong1(clMa)!=0)
			{
				request.setAttribute("error","Chất lượng đã tồn tại");
				System.out.println("Chất lượng đã tồn tại");
				return new ModelAndView("danh-muc-chat-luong");
			}
			else{
			chatLuongDAO.addChatLuong(new ChatLuong(clMa,clTen,0));
			ArrayList<ChatLuong> chatLuongList =  (ArrayList<ChatLuong>) chatLuongDAO.getAllChatLuong();
			return new ModelAndView("danh-muc-chat-luong", "chatLuongList", chatLuongList);
			}
		}
		if("deleteCl".equalsIgnoreCase(action)) {
			String[] idList = request.getParameterValues("clMa");
			for(String s : idList) {
					chatLuongDAO.deleteChatLuong(s);
			}
			
			ArrayList<ChatLuong> chatLuongList =  (ArrayList<ChatLuong>) chatLuongDAO.getAllChatLuong();
			return new ModelAndView("danh-muc-chat-luong", "chatLuongList", chatLuongList);
		}
		if("manageCl".equalsIgnoreCase(action)) {
			long size = chatLuongDAO.size();
			ArrayList<ChatLuong> chatLuongList =  (ArrayList<ChatLuong>) chatLuongDAO.limit(page, 10);
			request.setAttribute("size", size);
			return new ModelAndView("danh-muc-chat-luong", "chatLuongList", chatLuongList);
		}
		return new ModelAndView("login");
	}

	@RequestMapping(value="/preUpdateCl", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String preUpdateCl(@RequestParam("clMa") String clMa) {
		ChatLuongDAO chatLuongDAO = new ChatLuongDAO();
		ChatLuong cl = chatLuongDAO.getChatLuong(clMa);
		return JSonUtil.toJson(cl);
	}
	@RequestMapping(value="/deleteCl", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String deleteCl(@RequestParam("clMa") String clMa) {
		new ChatLuongDAO().deleteChatLuong(clMa);
		return JSonUtil.toJson(clMa);
	}

	@RequestMapping(value="/addCl", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String addCl(@RequestParam("clMa") String clMa, @RequestParam("clTen") String clTen) {
		String result = "";
		System.out.println("MA: "+clMa);
		if(new ChatLuongDAO().getChatLuong(clMa)==null)
		{
			new ChatLuongDAO().addChatLuong(new ChatLuong(clMa,clTen,0));
			System.out.println("success");
			result = "success";
			
			
		}
		else
		{
			System.out.println("fail");
			result = "fail";
		}
			return JSonUtil.toJson(result);
			
	}
	
	@RequestMapping(value="/updateCl", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String updateCl(@RequestParam("clMaUpdate") String clMaUpdate, @RequestParam("clTenUpdate") String clTenUpdate) {
		System.out.println(clMaUpdate);
		System.out.println(clTenUpdate);
		ChatLuong cl = new ChatLuong(clMaUpdate, clTenUpdate,0);
		new ChatLuongDAO().updateChatLuong(cl);
		return JSonUtil.toJson(cl);
	}
	@RequestMapping(value="/loadPageCl", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String loadPageCl(@RequestParam("pageNumber") String pageNumber) {
		String result = "";
		System.out.println("MA: " + pageNumber);
		ChatLuongDAO clDAO = new ChatLuongDAO();
		int page = Integer.parseInt(pageNumber);
		ArrayList<ChatLuong> clList = (ArrayList<ChatLuong>) clDAO.limit((page -1 ) * 10, 10);
		
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
			return JSonUtil.toJson(clList);
	}
}
