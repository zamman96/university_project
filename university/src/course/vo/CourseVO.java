package course.vo;


/**
 * @author PC-13
 * course와 관련된 vo
 * 학생 수강
 */
public class CourseVO {
	private String stu_id;
	private String year;
	private String term;
	private String subject_id;
	private int lec_rv_score;
	private String lec_review;
	
	public CourseVO() {
	}

	public String getStu_id() {
		return stu_id;
	}

	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
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

	public int getLec_rv_score() {
		return lec_rv_score;
	}

	public void setLec_rv_score(int lec_rv_score) {
		this.lec_rv_score = lec_rv_score;
	}

	public String getLec_review() {
		return lec_review;
	}

	public void setLec_review(String lec_review) {
		this.lec_review = lec_review;
	}

	
}
