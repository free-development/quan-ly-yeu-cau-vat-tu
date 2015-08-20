/**
 * 
 */
package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import model.VTCongVan;
import util.HibernateUtil;

/**
 * @author quoioln
 *
 */
public class VTCongVanDAO {
	private SessionFactory template;  
	private Session session;
	public VTCongVanDAO() {
		template = HibernateUtil.getSessionFactory();
		session = template.openSession();
	}
//	public VTCongVan getVTCongVan(final int vtId) {
//		session.beginTransaction();
//		VTCongVan VTCongVan = (VTCongVan) session.get(VTCongVan.class, vtId);
//		session.getTransaction().commit();
//		return VTCongVan;
//	}
	public List<VTCongVan> getAllVTCongVan() {
		session.beginTransaction();
		List<VTCongVan> vtCongVanList = (List<VTCongVan>) session.createCriteria(VTCongVan.class).list();
		session.getTransaction().commit();
		return vtCongVanList;
	}
	public void addVTCongVan(VTCongVan vtCongVan){
		session.beginTransaction();
		session.save(vtCongVan);
		session.getTransaction().commit();
	}
	public void updateVTCongVan(VTCongVan vtCongVan){
		session.beginTransaction();
		session.update(vtCongVan);
		session.getTransaction().commit();
	}
	public void deleteVTCongVan(VTCongVan vtCongVan){
		session.beginTransaction();
		session.delete(vtCongVan);
		session.getTransaction().commit();
	}
	public ArrayList<VTCongVan> getVTCongVan(int cvId, String msnv) {
		session.beginTransaction();
		Criteria cr = session.createCriteria(VTCongVan.class);
		Criterion expCv = Restrictions.eq("cvId", cvId);
//		Criterion expNd = Restrictions.eq("msnv", msnv);
		cr.add(expCv);
//		cr.add(expNd);
		ArrayList<VTCongVan> vtCongVanList = (ArrayList<VTCongVan>) cr.list();
		session.getTransaction().commit();
		return vtCongVanList;
	}
//	public ArrayList<VTCongVan> groupByMsnv() {
//		
//	}
}
