package dao;

import java.util.ArrayList;
import java.util.List;

import model.ChucDanh;
import model.YeuCau;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import util.HibernateUtil;

public class ChucDanhDAO {
	
	private SessionFactory template;  
	private Session session;
	public ChucDanhDAO() {
		template = HibernateUtil.getSessionFactory();
		session = template.openSession();
	}
	public ChucDanh getChucDanh(final String cdMa) {
		session.beginTransaction();
		ChucDanh chucDanh = (ChucDanh) session.get(ChucDanh.class, cdMa);
		session.getTransaction().commit();
		return chucDanh;
	}
	public List<ChucDanh> getAllChucDanh() {
		session.beginTransaction();
		Criteria cr = session.createCriteria(ChucDanh.class);
		
		Criterion xoaCd = Restrictions.eq("daXoa", 0);
		cr.add(xoaCd);
		ArrayList<ChucDanh> chucDanhList = (ArrayList<ChucDanh>) cr.list(); 
		session.getTransaction().commit();
		return chucDanhList;
	}
	public void addChucDanh(ChucDanh chucDanh){
		session.beginTransaction();
		session.save(chucDanh);
		session.getTransaction().commit();
	}
	public void updateChucDanh(ChucDanh chucDanh){
		session.beginTransaction();
		session.update(chucDanh);
		session.getTransaction().commit();
	}
	public void deleteChucDanh(String cdMa){
		session.beginTransaction();
		String sql = "update ChucDanh set daXoa = 1 where cdMa = '" + cdMa + "'";		
		Query query = session.createQuery(sql);
		query.executeUpdate();
		session.getTransaction().commit();
	}
	public static void main(String[] args) {
		new ChucDanhDAO().deleteChucDanh("cd1");
	}
	
}
