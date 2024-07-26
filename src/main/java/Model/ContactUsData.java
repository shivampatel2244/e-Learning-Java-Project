package Model;

public class ContactUsData {
    private int stud_id;
    private String stud_name;
    private String stud_email;
    private String stud_message;

    public ContactUsData(int stud_id, String stud_name, String stud_email, String stud_message) {
        this.stud_id = stud_id;
        this.stud_name = stud_name;
        this.stud_email = stud_email;
        this.stud_message = stud_message;
    }

    public int getStud_id() {
        return stud_id;
    }

    public void setStud_id(int stud_id) {
        this.stud_id = stud_id;
    }

    public String getStud_name() {
        return stud_name;
    }

    public void setStud_name(String stud_name) {
        this.stud_name = stud_name;
    }

    public String getStud_email() {
        return stud_email;
    }

    public void setStud_email(String stud_email) {
        this.stud_email = stud_email;
    }

    public String getStud_message() {
        return stud_message;
    }

    public void setStud_message(String stud_message) {
        this.stud_message = stud_message;
    }
}
