package course.controller.signup;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.google.gson.Gson;

import course.vo.ReqVO;
import util.MySvnUtil;

@WebServlet("/regPageChk.do")
public class RegPageChk extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		MySvnUtil.setUpdate();

		String path = "C:/project_2_university/file";

		File file = new File(path);
		if (!file.exists()) {
			file.mkdirs();
		}
		File req = new File(file, "reg.xlsx");
		ReqVO rvo = new ReqVO();

		try {
			if (req.exists()) {// 다운 받을 파일이 있을 때
				
				FileInputStream fis = new FileInputStream(req);
				XSSFWorkbook workbook = new XSSFWorkbook(fis);

				int sheetNum = workbook.getNumberOfSheets();
				// 각 시트별로 데이터 출력
				// 시트 가져오기
				// getSheetAt(index)
				XSSFSheet sheet = workbook.getSheetAt(0);

				// 존재하는 행 갯수 가져오기 (반복문을 위해 존재하는 row 갯수를 가져옴)
				// getPhysicalNumberOfRows()
				int rows = sheet.getPhysicalNumberOfRows();

				// 각 행별로 데이터 출력

				// 행 가져오기
				// getRow(index)
				XSSFRow row = sheet.getRow(0);

				// 행의 셀 갯수 가져오기 (반복문을 위해 존재하는 cell 갯수를 가져옴)
				// getPhysicalNumberOfCells()
				int cells = row.getPhysicalNumberOfCells();

				for (int c = 0; c < cells; c++) {
					// 각 셀별로 데이터 출력
					// getCell(index)
					XSSFCell cell = row.getCell(c);
					System.out.println(c);
					String value = "";
					if (cell != null) {
						// 셀 타입 확인하기
						// getCellType()
						// STRING, NUMERIC, FORMULA, BLANK, ERROR
						switch (c) {
						case 0: // 텍스트
							value = cell.getStringCellValue();
							rvo.setOpenDate(value);
							break;
						case 1: // 숫자
							value = cell.getStringCellValue();
							rvo.setOpenTime(Integer.parseInt(value));
							break;
						case 2: // 텍스트
							value = cell.getStringCellValue();
							rvo.setCloseDate(value);
							break;
						case 3: // 숫자
							value = cell.getStringCellValue();
							rvo.setCloseTime(Integer.parseInt(value));
							break;
						}
					}
				}
				
				Gson gson = new Gson();
				
				String json = gson.toJson(rvo);
				
				System.out.println(json);
				
				response.setCharacterEncoding("utf-8");
				response.setContentType("application/json; charset=utf-8");
				
				PrintWriter out = response.getWriter();
				out.println(json);
				
				response.flushBuffer();
				
			} else { // 없을 때
				return;
			}

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
