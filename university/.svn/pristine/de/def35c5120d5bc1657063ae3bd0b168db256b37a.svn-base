package member.controller.signup;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.google.gson.Gson;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import member.vo.MemberVO;

@WebServlet("/excelMember.do")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 10, // 10 mb
		maxFileSize = 1024 * 1024 * 30,
		maxRequestSize = 1024 * 1024 * 200
	)
public class ExcelMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Part filePart = request.getPart("file");
		
		String year = request.getParameter("year");
		int major_id = Integer.parseInt(request.getParameter("major"));
		int mem_grantNo = Integer.parseInt(request.getParameter("mem_grantno"));
		
        String fileName = filePart.getSubmittedFileName();
        InputStream fileContent = filePart.getInputStream();
        
        List<MemberVO> list = new ArrayList<MemberVO>();
        
        // Apache POI를 사용하여 파일 읽기	
        try (XSSFWorkbook workbook = new XSSFWorkbook(fileContent)) {
        	XSSFSheet sheet = workbook.getSheetAt(0); // 첫 번째 시트를 가져옵니다.
        	int rows = sheet.getPhysicalNumberOfRows();
			
			// 각 행별로 데이터 출력
			// 첫번째 row는 인덱스임으로 포함시키지않음
			for(int r = 1 ; r <= rows ; r++) {
				// row번호가 변할 때마다 데이터 초기화
				String name = "";
				
				// 행 가져오기
				XSSFRow row = sheet.getRow(r);
				
				int cells = row.getPhysicalNumberOfCells(); // 행의 셀 갯수 가져오기
				MemberVO memVo = new MemberVO();
				memVo.setMem_grantno(mem_grantNo);
				memVo.setMajor_id(major_id);
				for(int c = 0 ; c < cells; c++) {
					XSSFCell cell = row.getCell(c); // 셀 값 가져오기
					
					String value = "";
					if(cell!=null) {
						// 모든 타입이 String이기때문에 String으로 가져옴
						value = cell.getStringCellValue();
					}
					// 셀의 값 저장
					switch (c) {
					// c = 0 이름
					case 0:
						name = value;
						memVo.setMem_name(value);
						break;
					// c = 1 생일
					case 1:
						memVo.setMem_bir(value);
						break;
					// c = 2 성별
					case 2:
						memVo.setMem_gender(value);
						break;
					// c = 3 주소
					case 3:
						memVo.setMem_add(value);
						break;
					// c = 4 전화번호
					case 4:
						memVo.setMem_tel(value);
						break;
						// c = 5 이메일
					case 5:
						memVo.setMem_mail(value);
						break;
					default:
						break;
					}
				}
				list.add(memVo);
			}
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        Gson gson = new Gson();
        
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/json; charset=utf-8");
        PrintWriter out = response.getWriter();
        
        IMemberService service = MemberServiceImpl.getInstance();
        List<MemberVO> listvo = service.studentIdCreate(list, year);
        
        String json = gson.toJson(listvo);
        
        out.println(json);
        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
