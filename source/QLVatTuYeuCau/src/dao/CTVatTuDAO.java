/**
 * 
 */
package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
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
	public CTVatTu getCTVatTuById(final int ctvtId) {
		session.beginTransaction();
		
		
		CTVatTu ctVatTu =  (CTVatTu) session.get(CTVatTu.class, ctvtId);
		session.getTransaction().commit();
		return ctVatTu;
	}
	public CTVatTu getCTVatTu(final String vtMa, final String nsxMa, final String clMa) {
		session.beginTransaction();
		
		Criteria cr = session.createCriteria(CTVatTu.class);
		Criterion expNoiSanXuat = Restrictions.eq("noiSanXuat", new NoiSanXuat(nsxMa));
		Criterion expChatLuong = Restrictions.eq("chatLuong", new ChatLuong(clMa));
		Criterion expVatTu = Restrictions.eq("vatTu", new VatTu(vtMa));
		LogicalExpression andExp = Restrictions.and (expChatLuong, expNoiSanXuat);
		andExp = Restrictions.and(andExp, expChatLuong);
		andExp = Restrictions.and(andExp, expVatTu);
		cr.add(andExp);
		ArrayList<CTVatTu> ctvtList = (ArrayList<CTVatTu>) cr.list();
		
		CTVatTu ctVatTu = null;
		if(ctvtList.size() != 0)
			ctVatTu = ctvtList.get(0);
		session.getTransaction().commit();
		return ctVatTu;
	}
	public ArrayList<CTVatTu> getCTVTu(final String vtMa) {
		session.beginTransaction();
		
		Criteria cr = session.createCriteria(CTVatTu.class);
		
		Criterion expVatTu = Restrictions.eq("vatTu", new VatTu(vtMa));
		
		cr.add(expVatTu);
		
		ArrayList<CTVatTu> ctVatTu =  (ArrayList<CTVatTu>) cr.list();
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
	public HashMap<Integer, CTVatTu> getHashMap() {
		HashMap<Integer, CTVatTu> ctvtHash = new HashMap<Integer, CTVatTu>();
		ArrayList<CTVatTu> ctvtList = (ArrayList<CTVatTu>) getAllCTVatTu();
		for (CTVatTu ctvt : ctvtList) {
			ctvtHash.put(ctvt.getCtvtId(), ctvt);
		}
		return ctvtHash;
	}

	public ArrayList<CTVatTu> search(String vtMa, String vtTen, String nsx, String chatLuong) {
		session.beginTransaction();
		Criteria cr =  session.createCriteria(CTVatTu.class, "ctVatTu");
		/*
		if (vtTen != "")
			cr.setFetchMode("ctVatTu.", mode)
		*/
		if (vtMa != "")
		{	
			Criterion expVatTu = Restrictions.eq("vatTu", new VatTu(vtMa, vtTen));
			cr.add(expVatTu);
		}
		if (nsx != "") {
			Criterion expNsx = Restrictions.eq("noiSanXuat", new NoiSanXuat(nsx));
			cr.add(expNsx);
		}
		if (chatLuong != "") {
			Criterion expChatLuong = Restrictions.eq("chatLuong", new ChatLuong(chatLuong));
			cr.add(expChatLuong);
		}
		ArrayList<CTVatTu> ctVatTuList = (ArrayList<CTVatTu>) cr.list();
		session.getTransaction().commit();
		return ctVatTuList;
	}
<<<<<<< HEAD
=======

>>>>>>> da98c2abc9aea41403cecc84b8718e78685dbd33
	public static void main(String[] args) {
		CTVatTuDAO ct = new CTVatTuDAO();//.getCTVatTu("VT5", "NB", "CL0");
//		System.out.pritnln(ct.getCtvtId());
		//System.out.println(new CTVatTuDAO().getLastInsert());
//		System.out.println(new CTVatTuDAO().search("", "Tru dien", "", "").size());
//		System.out.println(new CTVatTuDAO().search("", "", "", "CL4").size());
//		System.out.println(new CTVatTuDAO().search("", "", "Vn4", "").size());
		CTVatTu l = ct.getCTVatTu("VT4","VN0","CL0");
		//for (CTVatTu vatTu : l) {
			System.out.println(l.getVatTu().getVtMa());
		//}
		
	}
<<<<<<< HEAD
=======

>>>>>>> da98c2abc9aea41403cecc84b8718e78685dbd33
}
