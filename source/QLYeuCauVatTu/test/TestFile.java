/**
 * 
 */
package test;

import dao.FileDAO;

/**
 * @author quoioln
 *
 */
public class TestFile {
	public static void main(String[] args) {
		System.out.println(new FileDAO().getByCongVanId(1).getDiaChi());
	}

}
