/**
 * 
 */
package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import model.CTVatTu;
import model.ChatLuong;
import model.NoiSanXuat;
import model.VatTu;
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
	public CTVatTu getCTVatTu(final String ctVatTu) {
		session.beginTransaction();
		
		CTVatTu ctvt = (CTVatTu) session.get(CTVatTu.class, ctVatTu);
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
	public CTVatTu getCTVatTu(final VatTu vatTu, final NoiSanXuat noiSanXuat, final ChatLuong chatLuong) {
		session.beginTransaction();
		
		Criteria cr = session.createCriteria(CTVatTu.class);
		Criterion expNoiSanXuat = Restrictions.eq("noiSanXuat", noiSanXuat);
		Criterion expChatLuong = Restrictions.eq("chatLuong", chatLuong);
		Criterion expVatTu = Restrictions.eq("vatTu", vatTu);
		LogicalExpression andExp = Restrictions.and (expChatLuong, expNoiSanXuat);
		andExp = Restrictions.and(andExp, expChatLuong);
		andExp = Restrictions.and(andExp, expVatTu);
		cr.add(andExp);
		
		CTVatTu ctVatTu =  (CTVatTu) cr.list().get(0);
		session.getTransaction().commit();
		return ctVatTu;
	}
	public int getLastInsert() {
		session.beginTransaction();
		Criteria cr =  session.createCriteria(CTVatTu.class).setProjection(Projections.max("ctvtId"));// max("ctvtId"));
		Integer idOld =  (Integer) cr.list().get(0);
		int id = 0;
		if (idOld != null)
			id += idOld + 1;
		else
			id++;
		
		session.getTransaction().commit();
		return id;
	}
<<<<<<< HEAD
	public HashMap<Integer, CTVatTu> getHashMap() {
		HashMap<Integer, CTVatTu> ctvtHash = new HashMap<Integer, CTVatTu>();
		ArrayList<CTVatTu> ctvtList = (ArrayList<CTVatTu>) getAllCTVatTu();
		for (CTVatTu ctvt : ctvtList) {
			ctvtHash.put(ctvt.getCtvtId(), ctvt);
		}
		return ctvtHash;
=======
	public static void main(String[] args) {
//		CTVatTu ct = new CTVatTuDAO().getCTVatTu(new VatTu("666"), new NoiSanXuat("666"), new ChatLuong("666"));
		System.out.println(new CTVatTuDAO().getLastInsert());
>>>>>>> 41d3b75f081bea9816ca6aa3bbf97c3c69957a7a
	}
}
