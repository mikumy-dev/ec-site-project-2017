package com.shopping.util;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class FileTransferUtil {

	public static String transfer(CommonsMultipartFile file,HttpSession session) {
		// 相对路径
		String relativePath = "userImg/" + new Date().getTime()
				+ file.getOriginalFilename();
		// workspace路径
		String absolutePathWorkspace = "D:/MyEclipse 10/shopping/WebRoot/"
				+ relativePath;
		// 服务器路径
		 String absolutePathServer =
		 session.getServletContext().getRealPath("/")+relativePath;

		File filetoServer = new File(absolutePathServer);
		File filetoWorkSpace = new File(absolutePathWorkspace);

		// 通过CommonsMultipartFile的方法直接写文件
		try {
			file.transferTo(filetoServer);
			file.transferTo(filetoWorkSpace);

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return relativePath;
	}
}
