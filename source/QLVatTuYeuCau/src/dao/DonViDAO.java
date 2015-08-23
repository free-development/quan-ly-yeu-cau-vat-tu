package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import model.ChatLuong;
import model.DonVi;
import util.HibernateUtil;

public class DonViDAO {
	
	private SessionFactory template;  
	private Session session;
	public DonViDAO() {
		template = HibernateUtil.getSessionFactory();
		session = template.openSession();
	}
	// Get Ä�Æ¡n vá»‹ tá»« mÃ£
	public DonVi getDonVi(final String dvMa) {
		session.beginTransaction();
		
		DonVi donVi = (DonVi) session.get(DonVi.class, dvMa);
//		session.
		
		session.getTransaction().commit();
		return donVi;
	}
	public List<DonVi> getAllDonVi() {
		session.beginTransaction();
		List<DonVi> donViList = (List<DonVi>) session.createCriteria(DonVi.class).list();
		session.getTransaction().commit();
		return donViList;
	}
	
	public List<DonVi> limit(int first, int limit) {
		session.beginTransaction();
		Criteria cr = session.createCriteria(DonVi.class);
		Criterion xoaCd = Restrictions.eq("daXoa", 0);
//		Criterion limitRow = Restrictions.
		cr.add(xoaCd);
		cr.setFirstResult(first);
		cr.setMaxResults(limit);
		ArrayList<DonVi> donViList = (ArrayList<DonVi>) cr.list(); 
		session.getTransaction().commit();
		return donViList;
	}
	public long size() {
		session.beginTransaction();
		String sql = "select count(dvMa) from DonVi";
		Query query =  session.createQuery(sql);
		long size = (long) query.list().get(0);
		session.getTransaction().commit();
		return size;
		
	}
	
	public void addDonVi(DonVi donVi){
		session.beginTransaction();
		session.save(donVi);
		session.getTransaction().commit();
	}
	public void updateDonVi(DonVi donVi){
		session.beginTransaction();
		session.update(donVi);
		session.getTransaction().commit();
	}
	public void deleteDonVi(String dvMa){
		session.beginTransaction();
		//session.delete(donVi);
		String sql = "update DonVi set daXoa = 1 where dvMa = '" + dvMa +"'";		
		Query query = session.createQuery(sql);
		query.executeUpdate();
		session.getTransaction().commit();
	}
	public static void main(String[] args) {
		new DonViDAO().deleteDonVi("SX4");
	}
	
}
