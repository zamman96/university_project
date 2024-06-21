package member.vo;

/**
 * @author PC-13
 *	회원 세션에 저장될 정보
 */
public class MemberVO {
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
	
	// 학생 정보
	private String stu_id;
	private int major_id;
	private String enter_date;
	private String graduate_date;
	private String stu_grade;
	
	// 학과 정보
	private String major_name;
	private int col_id;
	private String col_name;

	// 교수 정보
	private String pro_id;
	private int pro_type;
	private String pro_remark;
	
	// 관리자 정보
	private String adm_id;
	private int admin_position;
	private int adm_type;
	private String adm_remark;
	
	public MemberVO() {
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

	public String getStu_id() {
		return stu_id;
	}

	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
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

	public String getPro_id() {
		return pro_id;
	}

	public void setPro_id(String pro_id) {
		this.pro_id = pro_id;
	}

	public int getPro_type() {
		return pro_type;
	}

	public void setPro_type(int pro_type) {
		this.pro_type = pro_type;
	}

	public String getPro_remark() {
		return pro_remark;
	}

	public void setPro_remark(String pro_remark) {
		this.pro_remark = pro_remark;
	}

	public String getAdm_id() {
		return adm_id;
	}

	public void setAdm_id(String adm_id) {
		this.adm_id = adm_id;
	}

	public int getAdmin_position() {
		return admin_position;
	}

	public void setAdmin_position(int admin_position) {
		this.admin_position = admin_position;
	}

	public int getAdm_type() {
		return adm_type;
	}

	public void setAdm_type(int adm_type) {
		this.adm_type = adm_type;
	}

	public String getAdm_remark() {
		return adm_remark;
	}

	public void setAdm_remark(String adm_remark) {
		this.adm_remark = adm_remark;
	}
	
	
}
