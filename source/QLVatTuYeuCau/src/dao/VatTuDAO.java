package dao;

import java.util.ArrayList;
import java.util.List;

import model.VatTu;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import util.HibernateUtil;

public class VatTuDAO {
	
	private SessionFactory template;  
	private Session session;
	public VatTuDAO() {
		template = HibernateUtil.getSessionFactory();
		session = template.openSession();
	}
	public VatTu getVatTu(final String vtMa) {
		session.beginTransaction();
		VatTu vatTu = (VatTu) session.get(VatTu.class, vtMa);
		session.getTransaction().commit();
		return vatTu;
	}
	public List<VatTu> getAllVatTu() {
		session.beginTransaction();
		List<VatTu> vatTuList = (List<VatTu>) session.createCriteria(VatTu.class).list();
		session.getTransaction().commit();
		return vatTuList;
	}
	public void addVatTu(VatTu vatTu){
		session.beginTransaction();
		session.save(vatTu);
		session.getTransaction().commit();
	}
	public void updateVatTu(VatTu vatTu){
		session.beginTransaction();
		session.update(vatTu);
		session.getTransaction().commit();
	}
	public void deleteVatTu(VatTu vatTu){
		session.beginTransaction();
		session.delete(vatTu);
		session.getTransaction().commit();
	}


public ArrayList<String> startWith(String i) {
		session.beginTransaction();

		String sql = "select vtTen from VatTu where vtTen LIKE :vtTen";
		Query query = session.createQuery(sql);
		query.setParameter("vtTen", i+"%");
		ArrayList<String> list = (ArrayList<String>) query.list();
		
		session.getTransaction().commit();
		return list;
	}
public ArrayList<String> startWithMa(String i) {
	session.beginTransaction();

	String sql = "select vtMa from VatTu where vtMa LIKE :vtMa";
	Query query = session.createQuery(sql);
	query.setParameter("vtMa", i+"%");
	ArrayList<String> list = (ArrayList<String>) query.list();
	
	session.getTransaction().commit();
	return list;
}
}
