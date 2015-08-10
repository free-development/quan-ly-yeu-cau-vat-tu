/**
 * 
 */
package test;

import dao.CongVanDAO;
import dao.DonViDAO;
import dao.FileDAO;
import dao.MucDichDAO;
import model.CongVan;
import model.DonVi;
import model.File;
import model.MucDich;
import model.TrangThai;
import util.DateUtil;

/**
 * @author quoioln
 *
 */
public class TestCongVan {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		DonVi donVi = new DonVi("SX1", "Don vi 1", "0736864271", "quoi@gmail.com", "Can Tho");
		MucDich mucDich = new MucDich("SCL", "Sua chua lon");
		File file = new File("~/study/linux command", "File hoc linux command can ban", 1);
//		FileDAO
		CongVan congVan = new CongVan(1, DateUtil.convertToSqlDate(new java.util.Date()), "123", DateUtil.convertToSqlDate(new java.util.Date()), "Khong co trich yeu", "Khong co bu phe", mucDich, new TrangThai("DGQ", "Dang giai quyet"), donVi);
		new DonViDAO().addDonVi(donVi);
		new MucDichDAO().addMucDich(mucDich);
		new CongVanDAO().addCongVan(congVan);
		new FileDAO().addFile(file);
	}

}
