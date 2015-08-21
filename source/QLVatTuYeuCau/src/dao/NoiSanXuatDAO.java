package dao;

import java.util.ArrayList;
import java.util.List;

import model.ChucDanh;
import model.NoiSanXuat;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import util.HibernateUtil;

public class NoiSanXuatDAO {
	
	private SessionFactory template;  
	private Session session;
	public NoiSanXuatDAO() {
		template = HibernateUtil.getSessionFactory();
		session = template.openSession();
	}
	public NoiSanXuat getNoiSanXuat(final String nsxMa) {
		session.beginTransaction();
		
		NoiSanXuat noiSanXuat = (NoiSanXuat) session.get(NoiSanXuat.class, nsxMa);
//		session.
		
		session.getTransaction().commit();
		return noiSanXuat;
	}
	public List<NoiSanXuat> getAllNoiSanXuat() {
		session.beginTransaction();
		Criteria cr = session.createCriteria(NoiSanXuat.class);
		Criterion xoaCd = Restrictions.eq("daXoa", 0);
		cr.add(xoaCd);
		ArrayList<NoiSanXuat> noiSanXuatList = (ArrayList<NoiSanXuat>) cr.list(); 
		session.getTransaction().commit();
		return noiSanXuatList;
	}
	public void addNoiSanXuat(NoiSanXuat noiSanXuat){
		session.beginTransaction();
		session.save(noiSanXuat);
		session.getTransaction().commit();
	}
	public void updateNoiSanXuat(NoiSanXuat noiSanXuat){
		session.beginTransaction();
		session.update(noiSanXuat);
		session.getTransaction().commit();
	}
	public void deleteNoiSanXuat(String nsxMa){
		session.beginTransaction();
		String sql = "update NoiSanXuat set daXoa = 1 where nsxMa = '" + nsxMa + "'";		
		Query query = session.createQuery(sql);
		query.executeUpdate();
		session.getTransaction().commit();
	}
	public static void main(String[] args) {
		new NoiSanXuatDAO().deleteNoiSanXuat("Vn5");
	}
	
}
