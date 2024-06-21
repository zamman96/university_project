package lecture.vo;


/**
 * @author PC-13
 * 	lecture, lec_time, time, lec_room, member, major
 * 	통해 정보를 저장하는 vo
 *	수강신청과 강의계획서 등 사용
 */
public class LectureVO {
	// 과목 정보
	private String subject_id;
	private int major_id;
	private String subject_name;
	private int subject_credit;
	private String subject_term;
	private int subject_grade;
	private int subject_theory;
	private int subject_training;
	private String subject_type;
	private String subject_outline;
	private String subject_target;
	private String subject_t_book;
	private String subject_s_book;
	private String subject_r_file;
	private String subject_p_file;

	// 강의 정보
	private int lec_count;
	private String year;
	private String term;
	
	// 자바에서 계산해서 넣는 값 현재 신청 인원
	private int current_count;

	// 자바에서 정리해서 출력된 이름
	private String time_name;
	
	// 시간 정보
	private String time_id;
	private String time_week;
	private int time_class;
	
	// 강의실
	private String room_id;
	private String room_num;
	private int room_poss;
	private String room_remark;
	
	// 교수 정보
	private String pro_id;
	private String mem_name;
	private String mem_mail;
	private String mem_tel;
	
	private String mem_id;
	
	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	// 학과 이름
	private String major_name;
	
	private int col_id;
	private String col_name;
	
	// 페이징 처리
	private int page;
	private int start;
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

	private int end;
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public LectureVO() {

	}

	public String getSubject_id() {
		return subject_id;
	}

	public void setSubject_id(String subject_id) {
		this.subject_id = subject_id;
	}

	public int getMajor_id() {
		return major_id;
	}

	public void setMajor_id(int major_id) {
		this.major_id = major_id;
	}

	public String getSubject_name() {
		return subject_name;
	}

	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}

	public int getSubject_credit() {
		return subject_credit;
	}

	public void setSubject_credit(int subject_credit) {
		this.subject_credit = subject_credit;
	}

	public String getSubject_term() {
		return subject_term;
	}

	public void setSubject_term(String subject_term) {
		this.subject_term = subject_term;
	}

	public int getSubject_grade() {
		return subject_grade;
	}

	public void setSubject_grade(int subject_grade) {
		this.subject_grade = subject_grade;
	}

	public int getSubject_theory() {
		return subject_theory;
	}

	public void setSubject_theory(int subject_theory) {
		this.subject_theory = subject_theory;
	}

	public int getSubject_training() {
		return subject_training;
	}

	public void setSubject_training(int subject_training) {
		this.subject_training = subject_training;
	}

	public String getSubject_type() {
		return subject_type;
	}

	public void setSubject_type(String subject_type) {
		this.subject_type = subject_type;
	}

	public String getSubject_outline() {
		return subject_outline;
	}

	public void setSubject_outline(String subject_outline) {
		this.subject_outline = subject_outline;
	}

	public String getSubject_target() {
		return subject_target;
	}

	public void setSubject_target(String subject_target) {
		this.subject_target = subject_target;
	}

	public String getSubject_t_book() {
		return subject_t_book;
	}

	public void setSubject_t_book(String subject_t_book) {
		this.subject_t_book = subject_t_book;
	}

	public String getSubject_s_book() {
		return subject_s_book;
	}

	public void setSubject_s_book(String subject_s_book) {
		this.subject_s_book = subject_s_book;
	}

	public String getSubject_r_file() {
		return subject_r_file;
	}

	public void setSubject_r_file(String subject_r_file) {
		this.subject_r_file = subject_r_file;
	}

	public String getSubject_p_file() {
		return subject_p_file;
	}

	public void setSubject_p_file(String subject_p_file) {
		this.subject_p_file = subject_p_file;
	}

	public int getLec_count() {
		return lec_count;
	}

	public void setLec_count(int lec_count) {
		this.lec_count = lec_count;
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

	public int getCurrent_count() {
		return current_count;
	}

	public void setCurrent_count(int current_count) {
		this.current_count = current_count;
	}

	public String getTime_name() {
		return time_name;
	}

	public void setTime_name(String time_name) {
		this.time_name = time_name;
	}

	public String getTime_id() {
		return time_id;
	}

	public void setTime_id(String time_id) {
		this.time_id = time_id;
	}

	public String getTime_week() {
		return time_week;
	}

	public void setTime_week(String time_week) {
		this.time_week = time_week;
	}

	public int getTime_class() {
		return time_class;
	}

	public void setTime_class(int time_class) {
		this.time_class = time_class;
	}

	public String getRoom_id() {
		return room_id;
	}

	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}

	public String getRoom_num() {
		return room_num;
	}

	public void setRoom_num(String room_num) {
		this.room_num = room_num;
	}

	public int getRoom_poss() {
		return room_poss;
	}

	public void setRoom_poss(int room_poss) {
		this.room_poss = room_poss;
	}

	public String getRoom_remark() {
		return room_remark;
	}

	public void setRoom_remark(String room_remark) {
		this.room_remark = room_remark;
	}

	public String getPro_id() {
		return pro_id;
	}

	public void setPro_id(String pro_id) {
		this.pro_id = pro_id;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_mail() {
		return mem_mail;
	}

	public void setMem_mail(String mem_mail) {
		this.mem_mail = mem_mail;
	}

	public String getMem_tel() {
		return mem_tel;
	}

	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
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
	
}
