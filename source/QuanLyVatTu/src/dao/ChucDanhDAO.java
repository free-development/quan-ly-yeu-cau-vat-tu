package dao;

import java.util.List;

import model.ChucDanh;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import util.HibernateUtil;

public class ChucDanhDAO {
	
	private SessionFactory template;  
	private Session session;
	public ChucDanhDAO() {
		template = HibernateUtil.getSessionFactory();
		session = template.openSession();
	}
	public ChucDanh getChucDanh(final String clMa) {
		session.beginTransaction();
		
		ChucDanh chucDanh = (ChucDanh) session.get(ChucDanh.class, clMa);
//		session.
		
		session.getTransaction().commit();
		return chucDanh;
	}
	public List<ChucDanh> getAllChucDanh() {
		session.beginTransaction();
		List<ChucDanh> chucDanhList = (List<ChucDanh>) session.createCriteria(ChucDanh.class).list();
		session.getTransaction().commit();
		return chucDanhList;
	}
	public void addChucDanh(ChucDanh chucDanh){
		session.beginTransaction();
		session.save(chucDanh);
		session.getTransaction().commit();
	}
	public void updateChucDanh(ChucDanh chucDanh){
		session.beginTransaction();
		session.update(chucDanh);
		session.getTransaction().commit();
	}
	public void deleteChucDanh(ChucDanh chucDanh){
		session.beginTransaction();
		session.delete(chucDanh);
		session.getTransaction().commit();
	}
	
}
