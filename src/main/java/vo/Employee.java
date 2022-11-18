package vo;

// 캡슐화 단계 : public(100% 오픈) > protected(같은 패키지와 상속관계 오픈) > default(같은 패키지 오픈) > private(this 오픈)
// protected, default 단계의 캡슐화는 입문자는 사용하지 않는다.
public class Employee {
	public int empNo;
	private String birthDate; // protectd String birthDate; String birthDate; private String birthDate;
	private String firstName;
	private String lastName;
	private String gender;
	private String hireDate;
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getHireDate() {
		return hireDate;
	}
	public void setHireDate(String hireDate) {
		this.hireDate = hireDate;
	}
	
}
