package dao;

import java.util.List;

import model.ChatLuong;

import org.hibernate.Criteria;
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
		List<ChatLuong> chatLuongList = (List<ChatLuong>) session.createCriteria(ChatLuong.class).list();
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
	public void deleteChatLuong(ChatLuong chatLuong){
		session.beginTransaction();
		session.delete(chatLuong);
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
}
