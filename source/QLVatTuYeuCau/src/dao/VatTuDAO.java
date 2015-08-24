package dao;

import java.util.ArrayList;
import java.util.List;

import model.ChatLuong;
import model.ChucDanh;
import model.VatTu;


import org.hibernate.Criteria;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

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
	public VatTu getVatTuTen(final String vtTen) {
		session.beginTransaction();
		VatTu vatTu = (VatTu) session.get(VatTu.class, vtTen);
		session.getTransaction().commit();
		return vatTu;
	}
	public List<VatTu> getAllVatTu() {
		session.beginTransaction();
		Criteria cr = session.createCriteria(VatTu.class);
		Criterion xoaCd = Restrictions.eq("daXoa", 0);
		cr.add(xoaCd);
		ArrayList<VatTu> vatTuList = (ArrayList<VatTu>) cr.list(); 
		session.getTransaction().commit();
		return vatTuList;
	}
	
	public List<VatTu> limit(int first, int limit) {
		session.beginTransaction();
		Criteria cr = session.createCriteria(VatTu.class);
		Criterion xoaCd = Restrictions.eq("daXoa", 0);
//		Criterion limitRow = Restrictions.
		cr.add(xoaCd);
		cr.setFirstResult(first);
		cr.setMaxResults(limit);
		ArrayList<VatTu> vatTuList = (ArrayList<VatTu>) cr.list(); 
		session.getTransaction().commit();
		return vatTuList;
	}
	public long size() {
		session.beginTransaction();
		String sql = "select count(vtMa) from VatTu";
		Query query =  session.createQuery(sql);
		long size = (long) query.list().get(0);
		session.getTransaction().commit();
		return size;
		
	}
	
	public void addVatTu(VatTu vatTu){
		session.beginTransaction();
		session.save(vatTu);
		session.getTransaction().commit();
	}
	public void addOrUpdateVatTu(VatTu vatTu){
		session.beginTransaction();
		session.saveOrUpdate(vatTu);
		session.getTransaction().commit();
	}
	public void updateVatTu(VatTu vatTu){
		session.beginTransaction();
		session.update(vatTu);
		session.getTransaction().commit();
	}
	public void deleteVatTu(String vtMa){
		session.beginTransaction();
		String sql = "update VatTu set daXoa = 1 where vtMa = '" + vtMa + "'";		
		Query query = session.createQuery(sql);
		query.executeUpdate();
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
public void close() {
	HibernateUtil.shutdown();
}
public ArrayList<VatTu> searchVtTen(String i) {
	session.beginTransaction();

	String sql = "from VatTu where vtTen LIKE :vtTen";
	Query query = session.createQuery(sql);
	query.setParameter("vtTen", i+"%");
	ArrayList<VatTu> list = (ArrayList<VatTu>) query.list();
	
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
 public ArrayList<VatTu> searchVtMa(String i) {
	session.beginTransaction();

	String sql = "from VatTu where vtMa LIKE :vtMa";
	Query query = session.createQuery(sql);
	query.setParameter("vtMa", i+"%");
	ArrayList<VatTu> list = (ArrayList<VatTu>) query.list();
	
	session.getTransaction().commit();
	return list;
}
	public static void main(String[] args) {
		new VatTuDAO().deleteVatTu("vt1");
	}

}
