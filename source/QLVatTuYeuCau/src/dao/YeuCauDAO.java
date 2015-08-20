package dao;

import java.util.ArrayList;
import java.util.List;

import javax.management.Query;

import model.CTVatTu;
import model.YeuCau;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import util.HibernateUtil;

public class YeuCauDAO {
	
	private SessionFactory template;  
	private Session session;
	public YeuCauDAO() {
		template = HibernateUtil.getSessionFactory();
		session = template.openSession();
	}
	public YeuCau getYeuCau(final int cvId) {
		session.beginTransaction();
		
		YeuCau YeuCau = (YeuCau) session.get(YeuCau.class, cvId);
//		session.
		
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
	public void deleteYeuCau(YeuCau yeuCau){
		session.beginTransaction();
		session.delete(yeuCau);
		session.getTransaction().commit();
	}
//	public int getYeuCau1(final String clMa)
//	{
//		session.beginTransaction();
//		Criteria cr = session.createCriteria(YeuCau.class);
//		Criterion expClMa=Restrictions.eq("clMa", clMa);
//		cr.add(expClMa);
//		int l = cr.list().size();
//		session.getTransaction().commit();
//		return l;
//		
//	}

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
	public ArrayList<YeuCau> getVTThieu() {
		session.beginTransaction();
		Criteria cr = session.createCriteria(YeuCau.class);
		Criterion xoaYc = Restrictions.eq("daXoa", 0);
		cr.add(xoaYc);
		ArrayList<YeuCau> yeuCauList = (ArrayList<YeuCau>) cr.list(); 
		session.getTransaction().commit();
		return yeuCauList;
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
		cr.add(expCv);
		cr.add(expCtvt);
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
		if (yeuCau == null)
			yeuCau = new YeuCau(cvId, new CTVatTu(ctvtId), soLuong, 0,0);
		else {
			int soLuongOld = yeuCau.getYcSoLuong();
			soLuong += soLuongOld;
			yeuCau.setYcSoLuong(soLuong);
		}
		addOrUpdateYeuCau(yeuCau);
		int ycId = getLastInsert()-1;
		yeuCau.setYcId(ycId);
		return yeuCau;
	}
}
