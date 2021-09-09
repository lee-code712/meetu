package meetu.dto;

public class OfficeMapInfoDTO {
	private String prof_id;
	private String office;
	private double longitude;
	private double latitude;
	
	public String getProf_id() {
		return prof_id;
	}
	public void setProf_id(String prof_id) {
		this.prof_id = prof_id;
	}
	public String getOffice() {
		return office;
	}
	public void setOffice(String office) {
		this.office = office;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double logitude) {
		this.longitude = logitude;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
}
