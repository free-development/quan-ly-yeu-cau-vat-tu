package dao;


import java.util.ArrayList;
import java.util.List;

import model.CTVatTu;
import model.VTCongVan;
import model.VaiTro;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import util.HibernateUtil;

public class VaiTroDAO {
	
	private SessionFactory template;  
	private Session session;
	public VaiTroDAO() {
		template = HibernateUtil.getSessionFactory();
		session = template.openSession();
	}
	// trong day phai la kieu int
	public VaiTro getVaiTro(final int vtId) {
		session.beginTransaction();
		
		VaiTro vaiTro = (VaiTro) session.get(VaiTro.class, vtId);
//		session.
		
		session.getTransaction().commit();
		return vaiTro;
	}
	public List<VaiTro> getAllVaiTro() {
		session.beginTransaction();
		List<VaiTro> vaiTroList = (List<VaiTro>) session.createCriteria(VaiTro.class).list();
		session.getTransaction().commit();
		return vaiTroList;
	}
	public void addVaiTro(VaiTro vaiTro){
		session.beginTransaction();
		session.save(vaiTro);
		session.getTransaction().commit();
	}
	public void updateVaiTro(VaiTro vaiTro){
		session.beginTransaction();
		session.update(vaiTro);
		session.getTransaction().commit();
	}
	public void deleteVaiTro(VaiTro vaiTro){
		session.beginTransaction();
		session.delete(vaiTro);
		session.getTransaction().commit();
	}
	public int getVaiTroDAO(final int vtId) {
		session.beginTransaction();
		Criteria cr = session.createCriteria(VaiTro.class);
		Criterion expVtId = Restrictions.eq("vtId", vtId);
		cr.add(expVtId);
		int l =  cr.list().size();
		session.getTransaction().commit();
		return l;
	}
	public ArrayList<VaiTro> toVaiTro(ArrayList<VTCongVan> vtcvList) {
		ArrayList<VaiTro> vaiTroList = new ArrayList<VaiTro>();
		for (VTCongVan vtCongVan : vtcvList) {
			VaiTro vaiTro = getVaiTro(vtCongVan.getVtId());
			vaiTroList.add(vaiTro);
		}
		return vaiTroList;
	}
}
