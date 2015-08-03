package dao;

import java.util.List;

import model.NguoiDung;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import util.HibernateUtil;

public class NguoiDungDAO {
	
	private SessionFactory template;  
	private Session session;
	
	public NguoiDungDAO() {
		template = HibernateUtil.getSessionFactory();
		session = template.openSession();
	}
	
	public NguoiDung getNguoiDung(final String msnv) {
		session.beginTransaction();
		NguoiDung nguoiDung = (NguoiDung) session.get(NguoiDung.class, msnv);
		session.getTransaction().commit();
		return nguoiDung;
	}
	public List<NguoiDung> getAllNguoiDung() {
		session.beginTransaction();
		List<NguoiDung> nguoiDungList = (List<NguoiDung>) session.createCriteria(NguoiDung.class).list();
		session.getTransaction().commit();
		return nguoiDungList;
	}
	public void addNguoiDung(NguoiDung nguoiDung){
		session.beginTransaction();
		session.save(nguoiDung);
		session.getTransaction().commit();
	}
	public void updateNguoiDung(NguoiDung nguoiDung){
		session.beginTransaction();
		session.update(nguoiDung);
		session.getTransaction().commit();
	}
	public void deleteNguoiDung(NguoiDung nguoiDung){
		session.beginTransaction();
		session.delete(nguoiDung);
		session.getTransaction().commit();
	}
	
}
