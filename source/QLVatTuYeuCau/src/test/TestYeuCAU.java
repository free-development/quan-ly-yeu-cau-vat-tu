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

		 
		//int idCv = new CongVanDAO().getLastInsert(); 


		ChatLuong chatLuong = new ChatLuong("CL4", "Tot",0);
		ChatLuong chatLuong5 = new ChatLuong("CL5", "Tot",0);
		ChatLuong chatLuong8 = new ChatLuong("CL8", "Tot TotS",0);
		ChatLuong chatLuong0 = new ChatLuong("CL0", "Tot TotS",0);
		

		NoiSanXuat nsx = new NoiSanXuat("Vn4", "Viet Nam",0);
		NoiSanXuat nsx5 = new NoiSanXuat("Vn5", "Viet Nam",0);
		NoiSanXuat nsx9 = new NoiSanXuat("Vn9", "Viet Nam",0);
		NoiSanXuat nsx0 = new NoiSanXuat("Vn0", "Viet Nam",0);
		
		
		VatTu vatTu = new VatTu("VT4", "Tru dien", "cai",0);
		VatTu vatTu5 = new VatTu("VT5", "Tru dien", "cai",0);
		VatTu vatTu9 = new VatTu("VT9", "Tru dien", "cai",0);
		VatTu vatTu0 = new VatTu("VT0", "Tru dien", "cai",0);

//		NoiSanXuat nsx = new NoiSanXuat("Vn4", "Viet Nam");
//		NoiSanXuat nsx5 = new NoiSanXuat("Vn5", "Viet Nam");
//		NoiSanXuat nsx9 = new NoiSanXuat("Vn9", "Viet Nam");
//		NoiSanXuat nsx0 = new NoiSanXuat("Vn0", "Viet Nam");
//		

		
//		VatTu vatTu = new VatTu("VT4", "Tru dien", "cai");
//		VatTu vatTu5 = new VatTu("VT5", "Tru dien", "cai");
//		VatTu vatTu9 = new VatTu("VT9", "Tru dien", "cai");
//		VatTu vatTu0 = new VatTu("VT0", "Tru dien", "cai");
//		
//		CTVatTu ctVatTu = new CTVatTu(id,vatTu5, nsx, chatLuong, 0, 0);
//		id = ctVatTuDAO.getLastInsert(); 
//		CTVatTu ctVatTu5 = new CTVatTu(id, vatTu9, nsx, chatLuong, 0, 0);
//		id = ctVatTuDAO.getLastInsert(); 
//		CTVatTu ctVatTu9 = new CTVatTu(id, vatTu0, nsx, chatLuong, 0, 0);
//		id = ctVatTuDAO.getLastInsert(); 
//		CTVatTu ctVatTu3 = new CTVatTu(id, vatTu, nsx, chatLuong, 0, 0);

		chatLuongDAO.addChatLuong(chatLuong);
		chatLuongDAO.addChatLuong(chatLuong5);
		chatLuongDAO.addChatLuong(chatLuong8);
		chatLuongDAO.addChatLuong(chatLuong0);



		

		chatLuongDAO.addChatLuong(chatLuong);
		//noiSanXuatDAO.addNoiSanXuat(nsx);
//		vatTuDAO.addVatTu(vatTu);
		//ctVatTuDAO.addCTVatTu(ctVatTu);
		

		

		MucDich mucDich = new MucDich("SC5", "Sua chua lon",0);

		//MucDich mucDich = new MucDich("SC5", "Sua chua lon");


		File file = new File("~/study/linux command", "File hoc linux command can ban", 1);
		
		
//		noiSanXuatDAO.addNoiSanXuat(nsx);
//		noiSanXuatDAO.addNoiSanXuat(nsx5);
//		noiSanXuatDAO.addNoiSanXuat(nsx9);
//		noiSanXuatDAO.addNoiSanXuat(nsx0);
		
//		vatTuDAO.addVatTu(vatTu);
//		vatTuDAO.addVatTu(vatTu0);
//		vatTuDAO.addVatTu(vatTu5);
//		vatTuDAO.addVatTu(vatTu9);
		
//		ctVatTuDAO.addCTVatTu(ctVatTu9);
//		ctVatTuDAO.addCTVatTu(ctVatTu5);
//		ctVatTuDAO.addCTVatTu(ctVatTu3);
//		ctVatTuDAO.addCTVatTu(ctVatTu);

		
		

		MucDich mucDich5 = new MucDich("SC5", "Sua chua lon",0);
		MucDich mucDich4 = new MucDich("SC4", "Sua chua lon",0);
		mucDichDAO.addMucDich(mucDich4);
		mucDichDAO.addMucDich(mucDich5);

//		MucDich mucDich5 = new MucDich("SC5", "Sua chua lon");
//		MucDich mucDich4 = new MucDich("SC4", "Sua chua lon");
//		mucDichDAO.addMucDich(mucDich4);
//		mucDichDAO.addMucDich(mucDich5);

		
		
	
		
			
		
		int idCv = new CongVanDAO().getLastInsert();
		
		new FileDAO().addFile(file);
		
		
		idCv = new CongVanDAO().getLastInsert();
		File file2 = new File("~/study/linux command", "File hoc linux command can ban", idCv);
		new FileDAO().addFile(file2);
		
		
		idCv = new CongVanDAO().getLastInsert();
		File file3 = new File("~/study/linux command", "File hoc linux command can ban", idCv);
		new FileDAO().addFile(file2);
		
		
		idCv = new CongVanDAO().getLastInsert();
		File file4 = new File("~/study/linux command", "File hoc linux command can ban", idCv);
		new FileDAO().addFile(file4);
		
		
		
		
//
		YeuCau yeuCau2 = new YeuCau(id, ctVatTu5, 50, 50, 0);
		DonVi donVi = new DonVi("SX9", "Don vi 3", "0977874271", "tien@gmail.com", "Can Tho",0);
		MucDich mucDich2 = new MucDich("SC7", "Sua chua lon",0);
		File file1 = new File("~/study/linux command", "File hoc linux command can ban", 1);

		CongVan congVan4 = new CongVan(4, DateUtil.convertToSqlDate(new java.util.Date()), "123", DateUtil.convertToSqlDate(new java.util.Date()), "Khong co trich yeu", "Khong co bu phe", mucDich, new TrangThai("CGQ", "Chua giai quyet"), donVi,0);
		CongVan congVan5 = new CongVan(5, DateUtil.convertToSqlDate(new java.util.Date()), "123", DateUtil.convertToSqlDate(new java.util.Date()), "Khong co trich yeu", "Khong co bu phe", mucDich2, new TrangThai("DGQ", "Dang giai quyet"), donVi,0);
		
		new MucDichDAO().addMucDich(mucDich2);
		new DonViDAO().addDonVi(donVi);
		new CongVanDAO().addCongVan(congVan4);
		new FileDAO().addFile(file);
		
		
		

		new YeuCauDAO().addYeuCau(yeuCau2);
		


		
		


		//new MucDichDAO().addMucDich(mucDich);
		
		
		new FileDAO().addFile(file);
	

		
	}

}
