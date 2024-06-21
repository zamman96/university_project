package member.vo;

public class StuChangeVO {
	private String year;
	private String term;
	private String stu_id;
	private String reg_date;
	private String reg_type;
	private String reg_content;
	private int apply_type;
	private String process_date;
	
	// 학생정보
	private String mem_name;
	private String mem_id;
	private String mem_pass;
	private String mem_bir;
	private String mem_gender;
	private String mem_add;
	private String mem_tel;
	private String mem_mail;
	private int mem_grantno;
	private String mem_photo;
	
	
	// 학생 정보
	private int major_id;
	private String enter_date;
	private String graduate_date;
	private String stu_grade;
	
	// 학과 정보
	private String major_name;
	private int col_id;
	private String col_name;
	
	private int page;
	private int start;
	private int end;
	
	public StuChangeVO() {
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pass() {
		return mem_pass;
	}
	public void setMem_pass(String mem_pass) {
		this.mem_pass = mem_pass;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_bir() {
		return mem_bir;
	}
	public void setMem_bir(String mem_bir) {
		this.mem_bir = mem_bir;
	}
	public String getMem_gender() {
		return mem_gender;
	}
	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}
	public String getMem_add() {
		return mem_add;
	}
	public void setMem_add(String mem_add) {
		this.mem_add = mem_add;
	}
	public String getMem_tel() {
		return mem_tel;
	}
	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}
	public String getMem_mail() {
		return mem_mail;
	}
	public void setMem_mail(String mem_mail) {
		this.mem_mail = mem_mail;
	}
	public int getMem_grantno() {
		return mem_grantno;
	}
	public void setMem_grantno(int mem_grantno) {
		this.mem_grantno = mem_grantno;
	}
	public String getMem_photo() {
		return mem_photo;
	}
	public void setMem_photo(String mem_photo) {
		this.mem_photo = mem_photo;
	}
	public int getMajor_id() {
		return major_id;
	}
	public void setMajor_id(int major_id) {
		this.major_id = major_id;
	}
	public String getEnter_date() {
		return enter_date;
	}
	public void setEnter_date(String enter_date) {
		this.enter_date = enter_date;
	}
	public String getGraduate_date() {
		return graduate_date;
	}
	public void setGraduate_date(String graduate_date) {
		this.graduate_date = graduate_date;
	}
	public String getStu_grade() {
		return stu_grade;
	}
	public void setStu_grade(String stu_grade) {
		this.stu_grade = stu_grade;
	}
	public String getMajor_name() {
		return major_name;
	}
	public void setMajor_name(String major_name) {
		this.major_name = major_name;
	}
	public int getCol_id() {
		return col_id;
	}
	public void setCol_id(int col_id) {
		this.col_id = col_id;
	}
	public String getCol_name() {
		return col_name;
	}
	public void setCol_name(String col_name) {
		this.col_name = col_name;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public String getProcess_date() {
		return process_date;
	}
	public void setProcess_date(String process_date) {
		this.process_date = process_date;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getReg_type() {
		return reg_type;
	}
	public void setReg_type(String reg_type) {
		this.reg_type = reg_type;
	}
	public String getReg_content() {
		return reg_content;
	}
	public void setReg_content(String reg_content) {
		this.reg_content = reg_content;
	}
	public int getApply_type() {
		return apply_type;
	}
	public void setApply_type(int apply_type) {
		this.apply_type = apply_type;
	}
	
	
	@Override
	public String toString() {
		return "StuChangeVO [year=" + year + ", term=" + term + ", stu_id=" + stu_id + ", reg_date=" + reg_date
				+ ", reg_type=" + reg_type + ", reg_content=" + reg_content + ", apply_type=" + apply_type
				+ ", process_date=" + process_date + "]";
	}

}
