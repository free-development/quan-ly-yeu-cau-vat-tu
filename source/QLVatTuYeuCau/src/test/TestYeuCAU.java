/**
 * 
 */
package test;

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
//
		ChatLuong chatLuong = new ChatLuong("CL1", "Tot");
		NoiSanXuat nsx = new NoiSanXuat("Vn", "Viet Nam");
		VatTu vatTu = new VatTu("VT1", "Tru dien", "cai");
		CTVatTu ctVatTu = new CTVatTu(vatTu, nsx, chatLuong, 0, 0);
		
		chatLuongDAO.addChatLuong(chatLuong);
		noiSanXuatDAO.addNoiSanXuat(nsx);
		vatTuDAO.addVatTu(vatTu);
		ctVatTuDAO.addCTVatTu(new CTVatTu(vatTu, nsx, chatLuong, 0, 0));
		
		DonVi donVi = new DonVi("SX1", "Don vi 1", "0736864271", "quoi@gmail.com", "Can Tho");
		MucDich mucDich = new MucDich("SCL", "Sua chua lon");
		File file = new File("~/study/linux command", "File hoc linux command can ban", 1);
		CongVan congVan = new CongVan(1, DateUtil.convertToSqlDate(new java.util.Date()), "123", DateUtil.convertToSqlDate(new java.util.Date()), "Khong co trich yeu", "Khong co bu phe", mucDich, new TrangThai("DGQ", "Dang giai quyet"), donVi);
		new CongVanDAO().addCongVan(congVan);
		
		YeuCau yeuCau = new YeuCau(1, ctVatTu, 50, 0);
		new YeuCauDAO().addYeuCau(yeuCau);
		
		
	}

}
