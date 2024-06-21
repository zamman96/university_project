package course.vo;

public class AttendVO {
	private String attend_date;
	private String year;
	private String term;
	private String subject_id;
	private String stu_id;
	private int attend_type;
	private String attend_remark;
	
	private String mem_id;
	private String mem_pass;
	private String mem_name;
	private String mem_bir;
	private String mem_gender;
	private String mem_add;
	private String mem_tel;
	private String mem_mail;
	private int mem_grantno;
	private String mem_photo;
	
	// 학생 조회시 출석 횟수 표시
	private int attend_cnt;
	private int absent_cnt;
	private int tardy_cnt;
	
	// 학생 정보
	private int major_id;
	private String stu_grade;
	
	// 학과 정보
	private String major_name;
	private int col_id;
	private String col_name;
	
	public AttendVO() {
	}

	public String getAttend_date() {
		return attend_date;
	}

	public void setAttend_date(String attend_date) {
		this.attend_date = attend_date;
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

	public String getSubject_id() {
		return subject_id;
	}

	public void setSubject_id(String subject_id) {
		this.subject_id = subject_id;
	}

	public String getStu_id() {
		return stu_id;
	}

	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}

	public int getAttend_type() {
		return attend_type;
	}

	public void setAttend_type(int attend_type) {
		this.attend_type = attend_type;
	}

	public String getAttend_remark() {
		return attend_remark;
	}

	public void setAttend_remark(String attend_remark) {
		this.attend_remark = attend_remark;
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

	public int getAttend_cnt() {
		return attend_cnt;
	}

	public void setAttend_cnt(int attend_cnt) {
		this.attend_cnt = attend_cnt;
	}

	public int getAbsent_cnt() {
		return absent_cnt;
	}

	public void setAbsent_cnt(int absent_cnt) {
		this.absent_cnt = absent_cnt;
	}

	public int getTardy_cnt() {
		return tardy_cnt;
	}

	public void setTardy_cnt(int tardy_cnt) {
		this.tardy_cnt = tardy_cnt;
	}

	
	
	
}
