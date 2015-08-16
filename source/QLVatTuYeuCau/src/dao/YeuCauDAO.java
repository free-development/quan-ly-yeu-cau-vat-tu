package dao;

import java.util.ArrayList;
import java.util.List;

import javax.management.Query;

import model.YeuCau;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
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

}
