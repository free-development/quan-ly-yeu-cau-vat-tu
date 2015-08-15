package dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import model.CongVan;
import model.File;
import util.HibernateUtil;

public class CongVanDAO {
	
	private SessionFactory template;  
	private Session session;
	public CongVanDAO() {
		template = HibernateUtil.getSessionFactory();
		session = template.openSession();
	}
	public CongVan getCongVan(final int cvId) {
		session.beginTransaction();
		CongVan congVan = (CongVan) session.get(CongVan.class, cvId);
		session.getTransaction().commit();
		return congVan;
	}
	public List<CongVan> getAllCongVan() {
		session.beginTransaction();
		Criteria cr = session.createCriteria(CongVan.class);
		cr.add(Restrictions.eq("daXoa", 0));
		List<CongVan> congVanList = (List<CongVan>) cr.list();
		session.getTransaction().commit();
		return congVanList;
	}
	public void addCongVan(CongVan congVan){
		session.beginTransaction();
		session.save(congVan);
		session.getTransaction().commit();
	}
	public void updateCongVan(CongVan congVan){
		session.beginTransaction();
		session.update(congVan);
		session.getTransaction().commit();
	}
	public void deleteCongVan(int cvId){
		session.beginTransaction();
//		session.delete(congVan);
		String hql = "UPDATE CongVan set daXoa = 1 "  + 
	             "WHERE cvId = :cvId";
		Query query = session.createQuery(hql);
		query.setParameter("cvId", cvId);
		int result = query.executeUpdate();
		session.getTransaction().commit();
	}
	public int getLastInsert() {
		session.beginTransaction();
		Criteria cr =  session.createCriteria(File.class).setProjection(Projections.max("cvId"));// max("ctvtId"));
		Integer idOld =  (Integer) cr.list().get(0);
		int id = 0;
		if (idOld != null)
			id += idOld + 1;
		else
			id++;
		
		session.getTransaction().commit();
		return id;
	}
	public int getSoDenMax() {
		session.beginTransaction();
		Criteria cr =  session.createCriteria(CongVan.class).setProjection(Projections.max("soDen"));// max("ctvtId"));
		Integer idOld =  (Integer) cr.list().get(0);
		int soDen = 0;
		if (idOld != null)
			soDen += idOld + 1;
		else
			soDen++;
		
		session.getTransaction().commit();
		return soDen;
	}
}
