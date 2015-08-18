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
//		ChatLuong chatLuong = new ChatLuong("CL4", "Tot");
//		NoiSanXuat nsx = new NoiSanXuat("Vn4", "Viet Nam");
//		VatTu vatTu = new VatTu("VT4", "Tru dien", "cai");
//		CTVatTu ctVatTu = new CTVatTu(1,vatTu, nsx, chatLuong, 0, 0);
//		ChatLuong chatLuong = new ChatLuong("CL4", "Tot");
//		NoiSanXuat nsx = new NoiSanXuat("Vn4", "Viet Nam");
//		VatTu vatTu = new VatTu("VT4", "Tru dien", "cai");
//		CTVatTu ctVatTu = new CTVatTu(1,vatTu, nsx, chatLuong, 0, 0);
		
		ChatLuong chatLuong = new ChatLuong("CL5", "Tot");
		NoiSanXuat nsx = new NoiSanXuat("Vn5", "Viet Nam");
		VatTu vatTu = new VatTu("VT5", "Tru dien", "cai");
		CTVatTu ctVatTu = new CTVatTu(5, vatTu, nsx, chatLuong, 0, 0);
		
		chatLuongDAO.addChatLuong(chatLuong);
		noiSanXuatDAO.addNoiSanXuat(nsx);
		vatTuDAO.addVatTu(vatTu);
		ctVatTuDAO.addCTVatTu(ctVatTu);
		
		DonVi donVi = new DonVi("SX5", "Don vi 1", "0999894991", "tien@gmail.com", "Can Tho");
		MucDich mucDich = new MucDich("SC5", "Sua chua lon");
		File file = new File("~/study/linux command", "File hoc linux command can ban", 1);
		CongVan congVan = new CongVan(9, DateUtil.convertToSqlDate(new java.util.Date()), "193", DateUtil.convertToSqlDate(new java.util.Date()), "Khong co trich yeu", "Khong co bu phe", mucDich, new TrangThai("CGQ", "Chua giai quyet"), donVi,0);
		
		donViDAO.addDonVi(donVi);
		mucDichDAO.addMucDich(mucDich);
		
		
		new CongVanDAO().addCongVan(congVan);
		fileDAO.addFile(file);
		
		
		YeuCau yeuCau = new YeuCau(id, ctVatTu, 80, 0);

		new YeuCauDAO().addYeuCau(yeuCau);
		
		
	}

}
