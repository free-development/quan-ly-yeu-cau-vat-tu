package dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;



import model.CTVatTu;
import model.CongVan;
import model.DonVi;
import model.TrangThai;
import model.YeuCau;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import util.DateUtil;
import util.HibernateUtil;

public class YeuCauDAO {
	
	private SessionFactory template;  
	private Session session;
	public YeuCauDAO() {
		template = HibernateUtil.getSessionFactory();
		session = template.openSession();
	}
	public YeuCau getYeuCau(final int ycId) {
		session.beginTransaction();
		YeuCau YeuCau = (YeuCau) session.get(YeuCau.class, ycId);
		session.getTransaction().commit();
		return YeuCau;
	}
	public List<YeuCau> getAllYeuCau() {
		session.beginTransaction();
		List<YeuCau> yeuCauList = (List<YeuCau>) session.createCriteria(YeuCau.class).list();
		session.getTransaction().commit();
		return yeuCauList;
	}
	public void addYeuCau(YeuCau yeuCau){
		session.beginTransaction();
		session.save(yeuCau);
		session.getTransaction().commit();
	}
	
	public void updateYeuCau(YeuCau yeuCau){
		session.beginTransaction();
		session.update(yeuCau);
		session.getTransaction().commit();
	}
	public void deleteYeuCau(int ycId){
		session.beginTransaction();
		// Cach 1 dung giong nhu Statement
		String sql = "update YeuCau set daXoa = 1 where ycId = " + ycId ;		
		Query query = session.createQuery(sql);
		query.executeUpdate();
		
		/*
		 Cach 2 dung giong nhu Prepare statement
			 String sql = "update YeuCau set daXoa = 1 where ycId = :ycId";
			Query query = session.createQuery(sql);
			query.setParameter("ycId", 1);
			query.executeUpdate();
			session.getTransaction().commit();
		 */
		
		session.getTransaction().commit();
	}

	public ArrayList<YeuCau> getByCvId(int cvId) {
			session.beginTransaction();
			Criteria cr = session.createCriteria(YeuCau.class);
			Criterion expCv = Restrictions.eq("cvId", cvId);
			Criterion xoaYc = Restrictions.eq("daXoa", 0);
			LogicalExpression andExp = Restrictions.and(expCv, xoaYc);
			cr.add(andExp);
			ArrayList<YeuCau> yeuCauList = (ArrayList<YeuCau>) cr.list(); 
			session.getTransaction().commit();
			return yeuCauList;
	}
	public long sizeByCongVan(int cvId) {
		session.beginTransaction();
		Criteria cr = session.createCriteria(YeuCau.class);
		Criterion expCv = Restrictions.eq("cvId", cvId);
		Criterion xoaYc = Restrictions.eq("daXoa", 0);
		LogicalExpression andExp = Restrictions.and(expCv, xoaYc);
		cr.add(andExp);
		long size = (long) cr.setProjection(Projections.rowCount()).uniqueResult();
		session.getTransaction().commit();
		return size;
}
	public ArrayList<YeuCau> getVTThieu() {
		session.beginTransaction();
		Criteria cr = session.createCriteria(YeuCau.class);
		Criterion xoaYc = Restrictions.eq("daXoa", 0);
		cr.add(xoaYc);
		ArrayList<YeuCau> yeuCauList = (ArrayList<YeuCau>) cr.list(); 
		session.getTransaction().commit();
		return yeuCauList;
	}
	
	public List<YeuCau> limitByIdCv(int cvId, int first, int limit) {
		/*
		session.beginTransaction();
		Criteria cr = session.createCriteria(YeuCau.class);
		Criterion xoaCd = Restrictions.eq("daXoa", 0);
//		Criterion limitRow = Restrictions.
		cr.add(xoaCd);
		cr.setFirstResult(first);
		cr.setMaxResults(limit);
		ArrayList<YeuCau> yeuCauList = (ArrayList<YeuCau>) cr.list(); 
		session.getTransaction().commit();
		return yeuCauList;
		*/
		session.beginTransaction();
		Criteria cr = session.createCriteria(YeuCau.class);
		Criterion expCv = Restrictions.eq("cvId", cvId);
		Criterion xoaYc = Restrictions.eq("daXoa", 0);
		LogicalExpression andExp = Restrictions.and(expCv, xoaYc);
		cr.add(andExp);
		cr.setFirstResult(first); 
		cr.setMaxResults(limit);
		ArrayList<YeuCau> yeuCauList = (ArrayList<YeuCau>) cr.list(); 
		session.getTransaction().commit();
		return yeuCauList;
	}
	
	public long size (ArrayList<CongVan> congVanList) {
		long size = 0;
		for (CongVan congVan : congVanList) {
			long tempSize = sizeByCongVan(congVan.getCvId());
			size += tempSize;
		}
		return size;
	}
	public ArrayList<YeuCau> getByDaXoa() {
		session.beginTransaction();
		Criteria cr = session.createCriteria(YeuCau.class);
		Criterion xoaYC = Restrictions.eq("daXoa", 0);
		cr.add(xoaYC);
		ArrayList<YeuCau> yeuCauList = (ArrayList<YeuCau>) cr.list(); 
		session.getTransaction().commit();
		return yeuCauList;
	}
	
	public void addOrUpdateYeuCau(YeuCau yeuCau){
		session.beginTransaction();
		session.saveOrUpdate(yeuCau);
		session.getTransaction().commit();
	}
	
	// get so luong yeu by 
	public YeuCau getYeuCau(final int cvId, final int ctvtId) {
		session.beginTransaction();
		Criteria cr = session.createCriteria(YeuCau.class);
		Criterion expCv = Restrictions.eq("cvId", cvId);
		Criterion expCtvt = Restrictions.eq("ctVatTu", new CTVatTu(ctvtId));
		Criterion expDaXoa= Restrictions.eq("daXoa", 0);
		cr.add(expCv);
		cr.add(expCtvt);
		cr.add(expDaXoa);
		ArrayList<YeuCau> ycList  = (ArrayList<YeuCau>) cr.list();
		YeuCau yeuCau = null;
		if (ycList.size() != 0)
			yeuCau = (YeuCau) cr.list().get(0);
		
		session.getTransaction().commit();
		return yeuCau;
	}
	
	
	
	public int getLastInsert() {
		session.beginTransaction();
		Criteria cr =  session.createCriteria(YeuCau.class).setProjection(Projections.max("ycId"));
		Integer idOld =  (Integer) cr.list().get(0);
		int id = 0;
		if (idOld != null)
			id += idOld + 1;
		else
			id++;
		
		session.getTransaction().commit();
		return id;
	}
	
	public YeuCau addSoLuong(final int cvId, final int ctvtId, int soLuong) {
		YeuCau yeuCau = getYeuCau(cvId, ctvtId);
		if (yeuCau == null) {
			yeuCau = new YeuCau(cvId, new CTVatTu(ctvtId), soLuong, 0,0);
			addYeuCau(yeuCau);
			int ycId = getLastInsert()-1;
			yeuCau = new YeuCauDAO().getYeuCau(ycId);
		}
		else {
			int soLuongOld = yeuCau.getYcSoLuong();
			soLuong += soLuongOld;
			yeuCau.setYcSoLuong(soLuong);
			updateYeuCau(yeuCau);
		}
		return yeuCau;
	}
	public static void main(String[] args) {
		ArrayList<CongVan> congVanList = new CongVanDAO().getTrangThai("", "", null, null);
		System.out.println(new YeuCauDAO().size(congVanList));
	}
}
