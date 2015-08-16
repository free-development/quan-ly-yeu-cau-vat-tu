package dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

<<<<<<< HEAD
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import model.CongVan;
import model.File;
=======
import model.CongVan;
import model.DonVi;
import model.TrangThai;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.Restrictions;

import util.DateUtil;
>>>>>>> 6761f32b228d6250a93fed52d7462ad52ab21967
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
<<<<<<< HEAD
=======
<<<<<<< HEAD
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
=======
<<<<<<< HEAD
>>>>>>> origin/master
	public ArrayList<CongVan> getByDate(Date ngaybd, Date ngaykt){
		session.beginTransaction();
		Criteria cr = session.createCriteria(CongVan.class);
		cr.add(Restrictions.between("cvNgayNhan", ngaybd, ngaykt));
		ArrayList<CongVan> congVanList = (ArrayList<CongVan>) cr.list();
		session.getTransaction().commit();
		return congVanList;
	}
	public ArrayList<CongVan> getTrangThai(Date ngaybd, Date ngaykt){
		session.beginTransaction();
		Criteria cr = session.createCriteria(CongVan.class);
		Criterion tt1 = Restrictions.eq("trangThai",new TrangThai("DGQ", ""));
		Criterion tt2 = Restrictions.eq("trangThai",new TrangThai("CGQ", ""));
		LogicalExpression andExp = Restrictions.or(tt1, tt2);
		Criterion ngay = Restrictions.between("cvNgayNhan", ngaybd, ngaykt);
		LogicalExpression andNgay = Restrictions.and(andExp, ngay);
		cr.add(andNgay);
		ArrayList<CongVan> congVanList = (ArrayList<CongVan>) cr.list();
		session.getTransaction().commit();
		return congVanList;
	}
	public ArrayList<CongVan> getTrangThai(String ngaybd, String ngaykt,String dvMa, String ttMa){
		session.beginTransaction();
		Date ngayht = DateUtil.convertToSqlDate(new java.util.Date());
		Criteria cr = session.createCriteria(CongVan.class);
//		Criterion crdv,crtt,ngay;
//		LogicalExpression exp;
//		LogicalExpression andNgay;
//		if (ngaybd == null) 
//		{
//		ngaybd = ngaykt;
//		}
//		if (ngaykt == null)
//		{
//		ngaykt = ngaybd;
//		}
//		if (ngaybd != null || ngaykt != null) 
//		{
//			Criterion ngay = Restrictions.between("cvNgayNhan", DateUtil.parseDate(ngaybd), DateUtil.parseDate(ngaykt));
//		cr.add(ngay);
//		}
	
			if (ttMa != null && !"all".equalsIgnoreCase(ttMa)) {
				Criterion crtt = Restrictions.eq("trangThai",new TrangThai(ttMa));
				cr.add(crtt);
			}
			if (dvMa != null) {
				Criterion crdv =  Restrictions.eq("donVi",new DonVi(dvMa));
				cr.add(crdv);
			}
		
		ArrayList<CongVan> congVanList = (ArrayList<CongVan>) cr.list();
		session.getTransaction().commit();
		return congVanList;
	} 	 	
<<<<<<< HEAD
=======
>>>>>>> 41d3b75f081bea9816ca6aa3bbf97c3c69957a7a
>>>>>>> 6761f32b228d6250a93fed52d7462ad52ab21967
>>>>>>> origin/master
}
