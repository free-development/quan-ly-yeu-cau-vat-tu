/**
 * 
 */
package test;

import java.sql.Date;

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
//
<<<<<<< HEAD
		ChatLuong chatLuong = new ChatLuong("CL4", "Tot");
		NoiSanXuat nsx = new NoiSanXuat("Vn4", "Viet Nam");
		VatTu vatTu = new VatTu("VT4", "Tru dien", "cai");
		CTVatTu ctVatTu = new CTVatTu(1,vatTu, nsx, chatLuong, 0, 0);

=======
//		ChatLuong chatLuong = new ChatLuong("CL4", "Tot");
//		NoiSanXuat nsx = new NoiSanXuat("Vn4", "Viet Nam");
//		VatTu vatTu = new VatTu("VT4", "Tru dien", "cai");
//		CTVatTu ctVatTu = new CTVatTu(1,vatTu, nsx, chatLuong, 0, 0);
		
		ChatLuong chatLuong = new ChatLuong("CL0", "Tot TotS");
		NoiSanXuat nsx = new NoiSanXuat("Vn0", "Viet Nam");
		VatTu vatTu = new VatTu("VT0", "Tru dien", "cai");
		CTVatTu ctVatTu = new CTVatTu(3, vatTu, nsx, chatLuong, 0, 0);
>>>>>>> 0b9431d5bf5d4f7e65aee0512507e4f7e01bd00c
		
		chatLuongDAO.addChatLuong(chatLuong);
		noiSanXuatDAO.addNoiSanXuat(nsx);
		vatTuDAO.addVatTu(vatTu);
		ctVatTuDAO.addCTVatTu(ctVatTu);
		
<<<<<<< HEAD
		DonVi donVi = new DonVi("SX4", "Don vi 1", "0736864271", "quoi@gmail.com", "Can Tho");
		MucDich mucDich = new MucDich("SC4", "Sua chua lon");
		File file = new File("~/study/linux command", "File hoc linux command can ban", 1);
		CongVan congVan = new CongVan(id, DateUtil.convertToSqlDate(new java.util.Date()), "123", DateUtil.convertToSqlDate(new java.util.Date()), "Khong co trich yeu", "Khong co bu phe", mucDich, new TrangThai("DGQ", "Dang giai quyet"), donVi,0);
		
		donViDAO.addDonVi(donVi);
		mucDichDAO.addMucDich(mucDich);
		
		
		new CongVanDAO().addCongVan(congVan);
		fileDAO.addFile(file);
		
		YeuCau yeuCau = new YeuCau(id, ctVatTu, 50, 0);
//		DonVi donVi = new DonVi("SX7", "Don vi 1", "0737874271", "quoi@gmail.com", "Can Tho");
//		MucDich mucDich = new MucDich("SC7", "Sua chua lon");
//		File file = new File("~/study/linux command", "File hoc linux command can ban", 1);
=======
//		DonVi donVi = new DonVi("SX4", "Don vi 1", "0736864271", "quoi@gmail.com", "Can Tho");
//		MucDich mucDich = new MucDich("SC4", "Sua chua lon");
//		File file = new File("~/study/linux command", "File hoc linux command can ban", 1);
//		CongVan congVan = new CongVan(1, DateUtil.convertToSqlDate(new java.util.Date()), "123", DateUtil.convertToSqlDate(new java.util.Date()), "Khong co trich yeu", "Khong co bu phe", mucDich, new TrangThai("DGQ", "Dang giai quyet"), donVi,0);
//		
		
		
		//YeuCau yeuCau = new YeuCau(id, ctVatTu, 50, 0);
		DonVi donVi = new DonVi("SX0", "Don vi 3", "0977874271", "tien@gmail.com", "Can Tho");
		MucDich mucDich = new MucDich("SC0", "Sua chua lon");
		File file = new File("~/study/linux command", "File hoc linux command can ban", 1);
<<<<<<< HEAD
		CongVan congVan = new CongVan(1, DateUtil.convertToSqlDate(new java.util.Date()), "123", 
				DateUtil.convertToSqlDate(new java.util.Date()), "Khong co trich yeu", "Khong co but phe", mucDich, 
				new TrangThai("DGQ", "Dang giai quyet"), donVi);
=======
		CongVan congVan = new CongVan(4, DateUtil.convertToSqlDate(new java.util.Date()), "123", DateUtil.convertToSqlDate(new java.util.Date()), "Khong co trich yeu", "Khong co bu phe", mucDich, new TrangThai("CGQ", "Chua giai quyet"), donVi,0);
>>>>>>> 0b9431d5bf5d4f7e65aee0512507e4f7e01bd00c
//		CongVan congVan = new CongVan(1, DateUtil.convertToSqlDate(new java.util.Date()), "123", 
//				DateUtil.convertToSqlDate(new java.util.Date()), "Khong co trich yeu", "Khong co but phe", mucDich, 
//				new TrangThai("DGQ", "Dang giai quyet"), donVi);
		//CongVan congVan = new CongVan(1, DateUtil.convertToSqlDate(new java.util.Date()), "123", DateUtil.convertToSqlDate(new java.util.Date()), "Khong co trich yeu", "Khong co bu phe", mucDich, new TrangThai("DGQ", "Dang giai quyet"), donVi);
<<<<<<< HEAD
//		new MucDichDAO().addMucDich(mucDich);
//		new DonViDAO().addDonVi(donVi);
//		new CongVanDAO().addCongVan(congVan);
//		new FileDAO().addFile(file);
		
		//YeuCau yeuCau = new YeuCau(1, ctVatTu, 70, 0);
=======
		
//		donViDAO.addDonVi(donVi);
//		mucDichDAO.addMucDich(mucDich);
//		
//		
//		new CongVanDAO().addCongVan(congVan);
//		fileDAO.addFile(file);
		
>>>>>>> 0825d2661c0f54be164273816ac732fe8306c897
		new MucDichDAO().addMucDich(mucDich);
		new DonViDAO().addDonVi(donVi);
		new CongVanDAO().addCongVan(congVan);
		new FileDAO().addFile(file);
		
		YeuCau yeuCau = new YeuCau(3, ctVatTu, 90, 0);

>>>>>>> 0b9431d5bf5d4f7e65aee0512507e4f7e01bd00c
		new YeuCauDAO().addYeuCau(yeuCau);
		
		
	}

}
