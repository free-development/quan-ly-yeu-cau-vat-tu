package dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import model.CongVan;
import model.TrangThai;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.Restrictions;

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
}
