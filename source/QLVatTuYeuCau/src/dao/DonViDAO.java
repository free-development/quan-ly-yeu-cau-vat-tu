package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import model.DonVi;
import util.HibernateUtil;

public class DonViDAO {
	
	private SessionFactory template;  
	private Session session;
	public DonViDAO() {
		template = HibernateUtil.getSessionFactory();
		session = template.openSession();
	}
	// Get Đơn vị từ mã
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
