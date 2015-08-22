package dao;

import java.util.ArrayList;
import java.util.List;

import model.ChatLuong;
import model.ChucDanh;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import util.HibernateUtil;

public class ChatLuongDAO {
	
	private SessionFactory template;  
	private Session session;
	public ChatLuongDAO() {
		template = HibernateUtil.getSessionFactory();
		session = template.openSession();
	}
	public ChatLuong getChatLuong(final String clMa) {
		session.beginTransaction();
		
		ChatLuong chatLuong = (ChatLuong) session.get(ChatLuong.class, clMa);
//		session.
		
		session.getTransaction().commit();
		return chatLuong;
	}
	public List<ChatLuong> getAllChatLuong() {
		session.beginTransaction();
		Criteria cr = session.createCriteria(ChatLuong.class);
		Criterion xoaCd = Restrictions.eq("daXoa", 0);
		cr.add(xoaCd);
		ArrayList<ChatLuong> chatLuongList = (ArrayList<ChatLuong>) cr.list(); 
		session.getTransaction().commit();
		return chatLuongList;
	}
	public void addChatLuong(ChatLuong chatLuong){
		session.beginTransaction();
		session.save(chatLuong);
		session.getTransaction().commit();
	}
	public void updateChatLuong(ChatLuong chatLuong){
		session.beginTransaction();
		session.update(chatLuong);
		session.getTransaction().commit();
	}
	public void deleteChatLuong(String clMa){
		session.beginTransaction();
		String sql = "update ChatLuong set daXoa = 1 where clMa = '" + clMa +"'";		
		Query query = session.createQuery(sql);
		query.executeUpdate();
		session.getTransaction().commit();
	}
	public int getChatLuong1(final String clMa)
	{
		session.beginTransaction();
		Criteria cr = session.createCriteria(ChatLuong.class);
		Criterion expClMa=Restrictions.eq("clMa", clMa);
		cr.add(expClMa);
		int l = cr.list().size();
		session.getTransaction().commit();
		return l;
		
	}
	public static void main(String[] args) {
		new ChatLuongDAO().deleteChatLuong("cl5");
	}
}
