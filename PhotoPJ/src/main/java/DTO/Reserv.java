package DTO;

public class Reserv {

	int reserv_id;
	String m_name;
	String concept;
	int p_id;
	String testdate;
	
	public int getReserv_id() {
		return reserv_id;
	}
	public void setReserv_id(int reserv_id) {
		this.reserv_id = reserv_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getConcept() {
		return concept;
	}
	public void setConcept(String concept) {
		this.concept = concept;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	
	
	
	public String getTestdate() {
		return testdate;
	}
	public void setTestdate(String testdate) {
		this.testdate = testdate;
	}
	
}