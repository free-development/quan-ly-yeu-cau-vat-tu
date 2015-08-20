/**
 * 
 */
package test;

import java.sql.Date;

import controller.CvController;
import model.CTVatTu;
import model.ChatLuong;
import model.CongVan;
import model.DonVi;
import model.File;
import model.MucDich;
import model.NoiSanXuat;
import model.TrangThai;
import model.VatTu;
import model.YeuCau;
import util.DateUtil;
import dao.CTVatTuDAO;
import dao.ChatLuongDAO;
import dao.CongVanDAO;
import dao.DonViDAO;
import dao.FileDAO;
import dao.MucDichDAO;
import dao.NoiSanXuatDAO;
import dao.VatTuDAO;
import dao.YeuCauDAO;

/**
 * @author camnh_000
 *
 */
public class TestYeuCAU {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		CTVatTuDAO ctVatTuDAO = new CTVatTuDAO();
		ChatLuongDAO chatLuongDAO = new ChatLuongDAO();
		NoiSanXuatDAO noiSanXuatDAO = new NoiSanXuatDAO();
		VatTuDAO vatTuDAO = new VatTuDAO();
		MucDichDAO mucDichDAO = new MucDichDAO();
		DonViDAO donViDAO = new DonViDAO();
		FileDAO fileDAO = new FileDAO();
		int id = ctVatTuDAO.getLastInsert(); 
<<<<<<< HEAD
		 
		//int idCv = new CongVanDAO().getLastInsert(); 


		ChatLuong chatLuong = new ChatLuong("CL4", "Tot");
		ChatLuong chatLuong5 = new ChatLuong("CL5", "Tot");
		ChatLuong chatLuong8 = new ChatLuong("CL8", "Tot TotS");
		ChatLuong chatLuong0 = new ChatLuong("CL0", "Tot TotS");
		
		NoiSanXuat nsx = new NoiSanXuat("Vn4", "Viet Nam");
		NoiSanXuat nsx5 = new NoiSanXuat("Vn5", "Viet Nam");
		NoiSanXuat nsx9 = new NoiSanXuat("Vn9", "Viet Nam");
		NoiSanXuat nsx0 = new NoiSanXuat("Vn0", "Viet Nam");
		
		
		VatTu vatTu = new VatTu("VT4", "Tru dien", "cai");
		VatTu vatTu5 = new VatTu("VT5", "Tru dien", "cai");
		VatTu vatTu9 = new VatTu("VT9", "Tru dien", "cai");
		VatTu vatTu0 = new VatTu("VT0", "Tru dien", "cai");
		
		CTVatTu ctVatTu = new CTVatTu(id,vatTu5, nsx, chatLuong, 0, 0);
		id = ctVatTuDAO.getLastInsert(); 
		CTVatTu ctVatTu5 = new CTVatTu(id, vatTu9, nsx, chatLuong, 0, 0);
		id = ctVatTuDAO.getLastInsert(); 
		CTVatTu ctVatTu9 = new CTVatTu(id, vatTu0, nsx, chatLuong, 0, 0);
		id = ctVatTuDAO.getLastInsert(); 
		CTVatTu ctVatTu3 = new CTVatTu(id, vatTu, nsx, chatLuong, 0, 0);

		chatLuongDAO.addChatLuong(chatLuong);
		chatLuongDAO.addChatLuong(chatLuong5);
		chatLuongDAO.addChatLuong(chatLuong8);
		chatLuongDAO.addChatLuong(chatLuong0);
=======


		ChatLuong chatLuong = new ChatLuong("CL0", "Tot TotS");
		NoiSanXuat nsx = new NoiSanXuat("Vn0", "Viet Nam");
		VatTu vatTu = new VatTu("VT0", "Tru dien", "cai");
		CTVatTu ctVatTu = new CTVatTu(3, vatTu, nsx, chatLuong, 0, 0);

		chatLuongDAO.addChatLuong(chatLuong);
		noiSanXuatDAO.addNoiSanXuat(nsx);
		vatTuDAO.addVatTu(vatTu);
		ctVatTuDAO.addCTVatTu(ctVatTu);
		

		DonVi donVi = new DonVi("SX5", "Don vi 1", "0999894991", "tien@gmail.com", "Can Tho");
		MucDich mucDich = new MucDich("SC5", "Sua chua lon");

		File file = new File("~/study/linux command", "File hoc linux command can ban", 1);
		CongVan congVan = new CongVan(9, DateUtil.convertToSqlDate(new java.util.Date()), "193", DateUtil.convertToSqlDate(new java.util.Date()), "Khong co trich yeu", "Khong co bu phe", mucDich, new TrangThai("CGQ", "Chua giai quyet"), donVi,0);
>>>>>>> 96df0ef224a4023d8f44259795924128d787bad3
		
		noiSanXuatDAO.addNoiSanXuat(nsx);
		noiSanXuatDAO.addNoiSanXuat(nsx5);
		noiSanXuatDAO.addNoiSanXuat(nsx9);
		noiSanXuatDAO.addNoiSanXuat(nsx0);
		
		vatTuDAO.addVatTu(vatTu);
		vatTuDAO.addVatTu(vatTu0);
		vatTuDAO.addVatTu(vatTu5);
		vatTuDAO.addVatTu(vatTu9);
		
		ctVatTuDAO.addCTVatTu(ctVatTu9);
		ctVatTuDAO.addCTVatTu(ctVatTu5);
		ctVatTuDAO.addCTVatTu(ctVatTu3);
		ctVatTuDAO.addCTVatTu(ctVatTu);
		
<<<<<<< HEAD
		DonVi donVi5 = new DonVi("SX5", "Don vi 1", "0999894991", "tien@gmail.com", "Can Tho");
		DonVi donVi4 = new DonVi("SX4", "Don vi 1", "0736864271", "quoi@gmail.com", "Can Tho");
		
		MucDich mucDich5 = new MucDich("SC5", "Sua chua lon");
		MucDich mucDich4 = new MucDich("SC4", "Sua chua lon");
		mucDichDAO.addMucDich(mucDich4);
		mucDichDAO.addMucDich(mucDich5);
		
		donViDAO.addDonVi(donVi5);
		donViDAO.addDonVi(donVi4);
	
			CongVan congVan9 = new CongVan(9, DateUtil.convertToSqlDate(new java.util.Date()), "193", DateUtil.convertToSqlDate(new java.util.Date()), "Khong co trich yeu", "Khong co bu phe", mucDich5, new TrangThai("DGQ", "Chua giai quyet"), donVi5,0);
			CongVan congVan1 = new CongVan(8, DateUtil.convertToSqlDate(new java.util.Date()), "193", DateUtil.convertToSqlDate(new java.util.Date()), "Khong co trich yeu", "Khong co bu phe", mucDich5, new TrangThai("DGQ", "Chua giai quyet"), donVi5,0);
			CongVan congVan2 = new CongVan(7, DateUtil.convertToSqlDate(new java.util.Date()), "193", DateUtil.convertToSqlDate(new java.util.Date()), "Khong co trich yeu", "Khong co bu phe", mucDich5, new TrangThai("DGQ", "Chua giai quyet"), donVi5,0);
			CongVan congVan3 = new CongVan(6, DateUtil.convertToSqlDate(new java.util.Date()), "193", DateUtil.convertToSqlDate(new java.util.Date()), "Khong co trich yeu", "Khong co bu phe", mucDich5, new TrangThai("DGQ", "Chua giai quyet"), donVi5,0);
			
		new CongVanDAO().addCongVan(congVan1);
		int idCv = new CongVanDAO().getLastInsert();
		File file = new File("~/study/linux command", "File hoc linux command can ban", idCv);
		new FileDAO().addFile(file);
		
		new CongVanDAO().addCongVan(congVan2);
		idCv = new CongVanDAO().getLastInsert();
		File file2 = new File("~/study/linux command", "File hoc linux command can ban", idCv);
		new FileDAO().addFile(file2);
		
		new CongVanDAO().addCongVan(congVan3);
		idCv = new CongVanDAO().getLastInsert();
		File file3 = new File("~/study/linux command", "File hoc linux command can ban", idCv);
		new FileDAO().addFile(file2);
		
		new CongVanDAO().addCongVan(congVan9);
		idCv = new CongVanDAO().getLastInsert();
		File file4 = new File("~/study/linux command", "File hoc linux command can ban", idCv);
		new FileDAO().addFile(file4);
		
		
		YeuCau yeuCau1 = new YeuCau(1, ctVatTu, 80, 0);
		YeuCau yeuCau2 = new YeuCau(1, ctVatTu5, 80, 0);
		YeuCau yeuCau3 = new YeuCau(1, ctVatTu9, 80, 0);
		YeuCau yeuCau4 = new YeuCau(1, ctVatTu3, 80, 0);
		new YeuCauDAO().addYeuCau(yeuCau1);
		new YeuCauDAO().addYeuCau(yeuCau2);
		new YeuCauDAO().addYeuCau(yeuCau3);
		new YeuCauDAO().addYeuCau(yeuCau4);
//
//		YeuCau yeuCau2 = new YeuCau(id, ctVatTu5, 50, 0);
//		DonVi donVi = new DonVi("SX9", "Don vi 3", "0977874271", "tien@gmail.com", "Can Tho");
//		MucDich mucDich = new MucDich("SC7", "Sua chua lon");
//		File file1 = new File("~/study/linux command", "File hoc linux command can ban", 1);
//
//		CongVan congVan4 = new CongVan(4, DateUtil.convertToSqlDate(new java.util.Date()), "123", DateUtil.convertToSqlDate(new java.util.Date()), "Khong co trich yeu", "Khong co bu phe", mucDich, new TrangThai("CGQ", "Chua giai quyet"), donVi,0);
//
//		new MucDichDAO().addMucDich(mucDich);
//		new DonViDAO().addDonVi(donVi);
//		new CongVanDAO().addCongVan(congVan);
//		new FileDAO().addFile(file);
//		
////		YeuCau yeuCau = new YeuCau(3, ctVatTu, 90, 0);
//		YeuCau yeuCau3 = new YeuCau(id, ctVatTu, 90, 0);
//
//		new YeuCauDAO().addYeuCau(yeuCau);
//		
=======

		
		YeuCau yeuCau = new YeuCau(id, ctVatTu, 80, 0);


		new MucDichDAO().addMucDich(mucDich);
		new DonViDAO().addDonVi(donVi);
		new CongVanDAO().addCongVan(congVan);
		new FileDAO().addFile(file);
	

		new YeuCauDAO().addYeuCau(yeuCau);
		
>>>>>>> 96df0ef224a4023d8f44259795924128d787bad3
		
	}

}
