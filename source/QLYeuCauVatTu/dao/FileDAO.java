package dao;

import java.util.List;

import model.File;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

import util.HibernateUtil;

public class FileDAO {
	
	private SessionFactory template;  
	private Session session;
	public FileDAO() {
		template = HibernateUtil.getSessionFactory();
		session = template.openSession();
	}
	public File getFile(final int fileId) {
		session.beginTransaction();
		File file = (File) session.get(File.class, fileId);
		session.getTransaction().commit();
		return file;
	}
	public File getByCongVanId(final int cvId) {
		session.beginTransaction();
		File file = (File) session.createCriteria(File.class).add(Restrictions.eq("cvId", cvId)).list().get(0);
		session.getTransaction().commit();
		return file;
	}
	public List<File> getAllFile() {
		session.beginTransaction();
		List<File> fileList = (List<File>) session.createCriteria(File.class).list();
		session.getTransaction().commit();
		return fileList;
	}
	public void addFile(File file){
		session.beginTransaction();
		session.save(file);
		session.getTransaction().commit();
	}
	public void updateFile(File file){
		session.beginTransaction();
		session.update(file);
		session.getTransaction().commit();
	}
	public void deleteFile(File file){
		session.beginTransaction();
		session.delete(file);
		session.getTransaction().commit();
	}
	
}
