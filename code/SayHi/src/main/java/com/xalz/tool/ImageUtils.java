package com.xalz.tool;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

/**
 * 图片工具类
 * 
 * @author gzlx
 *
 */
public class ImageUtils {
	/**
	 * 上传图片
	 * 
	 * @param request
	 * @param book
	 * @param pictureFile
	 * @throws IOException
	 */
	public static String upload(HttpServletRequest request, MultipartFile pictureFile) throws IOException {
		// 保存数据库的路径
		String sqlPath = null;
		// 定义文件保存的本地路径
		String localPath = "D:\\File\\";
		// 定义 文件名
		String filename = null;
		if (!pictureFile.isEmpty()) {
			// 生成uuid作为文件名称
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			// 获得文件类型（可以判断如果不是图片，禁止上传）
			String contentType = pictureFile.getContentType();
			// 获得文件后缀名
			String suffixName = contentType.substring(contentType.indexOf("/") + 1);
			// 得到 文件名
			filename = uuid + "." + suffixName;
			// 文件保存路径
			pictureFile.transferTo(new File(localPath + filename));
		}
		// 把图片的相对路径保存至数据库
		if (filename == null)
			return null;
		else {
			sqlPath = "/images/" + filename;
			return sqlPath;
		}
	}

	/**
	 * 验证文件夹是否存在
	 * 
	 * @param strFolder
	 * @return
	 */
	public static boolean isFolderExists(String strFolder) {
		File file = new File(strFolder);

		if (!file.exists()) {
			if (file.mkdir()) {
				return true;
			} else {
				return false;
			}

		}
		System.out.println("-----------------文件上传路径：" + strFolder);
		return true;
	}

	/**
	 * 获取目录下所有文件(按时间排序)
	 * 
	 * @param path
	 * @return
	 */
	public static List<File> getFileSort(String path) {
		List<File> list = getFiles(path, new ArrayList<File>());
		if (list != null && list.size() > 0) {
			Collections.sort(list, new Comparator<File>() {
				public int compare(File file, File newFile) {
					if (file.lastModified() < newFile.lastModified()) {// 降序<;升序>
						return 1;
					} else if (file.lastModified() == newFile.lastModified()) {
						return 0;
					} else {
						return -1;
					}
				}
			});
		}
		return list;
	}

	/**
	 * 获取目录下所有文件
	 * 
	 * @param realpath
	 * @param files
	 * @return
	 */
	public static List<File> getFiles(String realpath, List<File> files) {
		File realFile = new File(realpath);
		if (realFile.isDirectory()) {
			File[] subfiles = realFile.listFiles();
			for (File file : subfiles) {
				if (file.isDirectory()) {
					getFiles(file.getAbsolutePath(), files);
				} else {
					files.add(file);
				}
			}
		}
		return files;
	}

}