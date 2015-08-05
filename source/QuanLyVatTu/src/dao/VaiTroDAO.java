package dao;


import java.util.List;

import model.VaiTro;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import util.HibernateUtil;

public class VaiTroDAO {
	
	private SessionFactory template;  
	private Session session;
	public VaiTroDAO() {
		template = HibernateUtil.getSessionFactory();
		session = template.openSession();
	}
	// trong day phai la kieu int
	public VaiTro getVaiTro(final int vtId) {
		session.beginTransaction();
		
		VaiTro vaiTro = (VaiTro) session.get(VaiTro.class, vtId);
//		session.
		
		session.getTransaction().commit();
		return vaiTro;
	}
	public List<VaiTro> getAllVaiTro() {
		session.beginTransaction();
		List<VaiTro> vaiTroList = (List<VaiTro>) session.createCriteria(VaiTro.class).list();
		session.getTransaction().commit();
		return vaiTroList;
	}
	public void addVaiTro(VaiTro vaiTro){
		session.beginTransaction();
		session.save(vaiTro);
		session.getTransaction().commit();
	}
	public void updateVaiTro(VaiTro vaiTro){
		session.beginTransaction();
		session.update(vaiTro);
		session.getTransaction().commit();
	}
	public void deleteVaiTro(VaiTro vaiTro){
		session.beginTransaction();
		session.delete(vaiTro);
		session.getTransaction().commit();
	}
	
}
