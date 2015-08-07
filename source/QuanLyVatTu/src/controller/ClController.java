package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ChatLuong;
import model.NoiSanXuat;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import util.JSonUtil;
import dao.ChatLuongDAO;
import dao.NoiSanXuatDAO;

@Controller
public class ClController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@RequestMapping("/manageCl")
	public ModelAndView manageCl(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ChatLuongDAO chatLuongDAO = new ChatLuongDAO();
		String action = request.getParameter("action");
		if("AddCl".equalsIgnoreCase(action)) {
			String clMa = request.getParameter("clMa");
			String clTen = request.getParameter("clTen");
			
			chatLuongDAO.addChatLuong(new ChatLuong(clMa,clTen));
			ArrayList<ChatLuong> chatLuongList =  (ArrayList<ChatLuong>) chatLuongDAO.getAllChatLuong();
			return new ModelAndView("danh-muc-chat-luong", "chatLuongList", chatLuongList);
		}
		if("deleteCl".equalsIgnoreCase(action)) {
			String[] idList = request.getParameterValues("clMa");
			for(String s : idList) {
					chatLuongDAO.deleteChatLuong(chatLuongDAO.getChatLuong(s));
			}
			
			ArrayList<ChatLuong> chatLuongList =  (ArrayList<ChatLuong>) chatLuongDAO.getAllChatLuong();
			return new ModelAndView("danh-muc-chat-luong", "chatLuongList", chatLuongList);
		}
		return new ModelAndView("login");
	}

	@RequestMapping(value="/preEditCl", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String preEditCl(@RequestParam("clMa") String clMa) {
		ChatLuongDAO chatLuongDAO = new ChatLuongDAO();
		ChatLuong cl = chatLuongDAO.getChatLuong(clMa);
		return JSonUtil.toJson(cl);
	}
	@RequestMapping(value="/deleteCl", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String deleteCl(@RequestParam("clMa") String clMa) {
		new ChatLuongDAO().deleteChatLuong(new ChatLuongDAO().getChatLuong(clMa));
		return JSonUtil.toJson(clMa);
	}
}
