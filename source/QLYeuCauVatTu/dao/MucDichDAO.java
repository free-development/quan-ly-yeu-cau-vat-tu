package dao;

import java.util.List;

import model.ChatLuong;
import model.MucDich;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import util.HibernateUtil;

public class MucDichDAO {
	
	private SessionFactory template;  
	private Session session;
	public MucDichDAO() {
		template = HibernateUtil.getSessionFactory();
		session = template.openSession();
	}
	public MucDich getMucDich(final String mdMa) {
		session.beginTransaction();
		
		MucDich mucDich = (MucDich) session.get(MucDich.class, mdMa);
//		session.
		
		session.getTransaction().commit();
		return mucDich;
	}
	public List<MucDich> getAllMucDich() {
		session.beginTransaction();
		List<MucDich> mucDichList = (List<MucDich>) session.createCriteria(MucDich.class).list();
		session.getTransaction().commit();
		return mucDichList;
	}
	public void addMucDich(MucDich mucDich){
		session.beginTransaction();
		session.save(mucDich);
		session.getTransaction().commit();
	}
	public void updateMucDich(MucDich mucDich){
		session.beginTransaction();
		session.update(mucDich);
		session.getTransaction().commit();
	}
	public void deleteMucDich(MucDich mucDich){
		session.beginTransaction();
		session.delete(mucDich);
		session.getTransaction().commit();
	}
	public int getMucDich1(final String mdMa)
	{
		session.beginTransaction();
		Criteria cr = session.createCriteria(MucDich.class);
		Criterion expMdMa=Restrictions.eq("mdMa", mdMa);
		cr.add(expMdMa);
		int l = cr.list().size();
		session.getTransaction().commit();
		return l;
		
	}
}
