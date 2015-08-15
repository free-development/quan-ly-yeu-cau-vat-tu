package dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

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
		List<CongVan> congVanList = (List<CongVan>) session.createCriteria(CongVan.class).list();
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
	public void deleteCongVan(CongVan congVan){
		session.beginTransaction();
		session.delete(congVan);
		session.getTransaction().commit();
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
}
