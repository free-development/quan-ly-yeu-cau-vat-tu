/**
 * 
 */
package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import model.CTVatTu;
import util.HibernateUtil;

/**
 * @author QUOI
 *
 */
public class CTVatTuDAO {
	
	private SessionFactory template;  
	private Session session;
	public CTVatTuDAO() {
		template = HibernateUtil.getSessionFactory();
		session = template.openSession();
	}
	public CTVatTu getCTVatTu(final String vtMa) {
		session.beginTransaction();
		
		CTVatTu ctvt = (CTVatTu) session.get(CTVatTu.class, vtMa);
//		session.
		
		session.getTransaction().commit();
		return ctvt;
	}
	public List<CTVatTu> getAllCTVatTu() {
		session.beginTransaction();
		List<CTVatTu> CTVatTuList = (List<CTVatTu>) session.createCriteria(CTVatTu.class).list();
		session.getTransaction().commit();
		return CTVatTuList;
	}
	public void addCTVatTu(CTVatTu ctVatTu){
		session.beginTransaction();
		session.save(ctVatTu);
		session.getTransaction().commit();
	}
	public void updateCTVatTu(CTVatTu ctVatTu){
		session.beginTransaction();
		session.update(ctVatTu);
		session.getTransaction().commit();
	}
	public void deleteCTVatTu(CTVatTu ctVatTu){
		session.beginTransaction();
		session.delete(ctVatTu);
		session.getTransaction().commit();
	}
	public CTVatTu getCTVatTu(final String vtMa, final String nsxMa, final String clMa) {
		session.beginTransaction();
		/*
		Criteria cr = session.createCriteria(CTVatTu.class);
		cr.createAlias("model.NoiSanXuat", "nsx");
		cr.createAlias("model.ChatLuong", "cl");
		cr.createAlias("model.VatTu", "vt");
//		Criterion expVtMa = Restrictions.eq("vtMa", vtMa);
		Criterion expNsxMa = Restrictions.eq("nsx.nsxMa", nsxMa);
		Criterion expClMa = Restrictions.eq("cl.clMa", clMa);
		LogicalExpression andExp = Restrictions.and (expClMa, expNsxMa);
//		andExp = Restrictions.and(andExp, expClMa);
//		CTVatTu ctVatTu = null;
//		cr.add(expVtMa);
		cr.add(andExp);
		CTVatTu ctVatTu =  (CTVatTu) cr.list().get(0);*/
		String sql = "from ctvattu"
				+ " where clma = '"+ clMa +"' and "
				+ "vtma = '" + vtMa +"' and "
				+ "nsxma = '" + nsxMa +"'";
		Query query = session.createQuery(sql);
		CTVatTu ctVatTu =  (CTVatTu) query.list().get(0);
		session.getTransaction().commit();
		return ctVatTu;
	}
}
