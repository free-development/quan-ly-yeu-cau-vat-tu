package dao;

import java.util.List;

import model.NoiSanXuat;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import util.HibernateUtil;

public class NoiSanXuatDAO {
	
	private SessionFactory template;  
	private Session session;
	public NoiSanXuatDAO() {
		template = HibernateUtil.getSessionFactory();
		session = template.openSession();
	}
	public NoiSanXuat getNoiSanXuat(final String nsxMa) {
		session.beginTransaction();
		
		NoiSanXuat noiSanXuat = (NoiSanXuat) session.get(NoiSanXuat.class, nsxMa);
//		session.
		
		session.getTransaction().commit();
		return noiSanXuat;
	}
	public List<NoiSanXuat> getAllNoiSanXuat() {
		session.beginTransaction();
		List<NoiSanXuat> noiSanXuatList = (List<NoiSanXuat>) session.createCriteria(NoiSanXuat.class).list();
		session.getTransaction().commit();
		return noiSanXuatList;
	}
	public void addNoiSanXuat(NoiSanXuat noiSanXuat){
		session.beginTransaction();
		session.save(noiSanXuat);
		session.getTransaction().commit();
	}
	public void updateNoiSanXuat(NoiSanXuat noiSanXuat){
		session.beginTransaction();
		session.update(noiSanXuat);
		session.getTransaction().commit();
	}
	public void deleteNoiSanXuat(NoiSanXuat noiSanXuat){
		session.beginTransaction();
		session.delete(noiSanXuat);
		session.getTransaction().commit();
	}
	
}
