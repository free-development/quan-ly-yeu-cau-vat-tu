/**
 * 
 */
package dao;

import java.util.List;

import model.CTVatTu;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.Restrictions;

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
	public int getCTVatTu(final String vtMa, final String nsxMa, final String clMa) {
		session.beginTransaction();
		Criteria cr = session.createCriteria(CTVatTu.class);
		Criterion expVtMa = Restrictions.eq("vtMa", vtMa);
		Criterion expNsxMa = Restrictions.eq("nsxMa", nsxMa);
		Criterion expClMa = Restrictions.eq("clMa", clMa);
	//	LogicalExpression andExp = Restrictions.and (expVtMa, expNsxma);
//		andExp = Restrictions.and(andExp, expClMa);
//		CTVatTu ctVatTu = null;
		cr.add(expVtMa);
		int l =  cr.list().size();
		session.getTransaction().commit();
		return l;
	}
}
