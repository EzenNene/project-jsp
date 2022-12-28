package DTO;

public class Reserv {

	int reserv_id;
	int p_id;
	String m_name;
	String m_number;
	String reserv_date;
	String concept;
	
	public int getReserv_id() {
		return reserv_id;
	}
	public void setReserv_id(int reserv_id) {
		this.reserv_id = reserv_id;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_number() {
		return m_number;
	}
	public void setM_number(String m_number) {
		this.m_number = m_number;
	}
	public String getReserv_date() {
		return reserv_date;
	}
	public void setReserv_date(String reserv_date) {
		this.reserv_date = reserv_date;
	}
	public String getConcept() {
		return concept;
	}
	public void setConcept(String concept) {
		this.concept = concept;
	}
	
}