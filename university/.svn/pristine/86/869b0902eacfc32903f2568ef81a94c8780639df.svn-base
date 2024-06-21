package course.controller.signup;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import util.MySvnUtil;

@WebServlet("/regPageOpen.do")
public class RegPageOpen extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String openDate = request.getParameter("openDate");
		String openTime = request.getParameter("openTime");

		String closeDate = request.getParameter("closeDate");
		String closeTime = request.getParameter("closeTime");
		
		MySvnUtil.setUpdate();
		
		String path = "C:/project_2_university/file";
		
		File file = new File(path);
		if (!file.exists()) {
            try {
                file.createNewFile();
                System.out.println("File created at: " + path);
            } catch (Exception e) {
                System.err.println("Error creating file: " + e.getMessage());
            }
        } else {
            System.out.println("File already exists at: " + path);
        }
		
		Workbook excel = new XSSFWorkbook();
		
		Sheet sheet = excel.createSheet();
		
		Row row0 = sheet.createRow(0);
		
		row0.createCell(0).setCellValue(openDate);
		row0.createCell(1).setCellValue(openTime);
		row0.createCell(2).setCellValue(closeDate);
		row0.createCell(3).setCellValue(closeTime);
		
		FileOutputStream fout = new FileOutputStream(path+"/reg.xlsx");
		
		excel.write(fout);
		fout.close();
		
		MySvnUtil.setCommit();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
