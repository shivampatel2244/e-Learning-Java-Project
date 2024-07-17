package Model;

public class StudData {
    private String sfname;
    private String slname;
    private String squalifiction;
    private String semail;
    private String sgender;
    private String sdob;
    private String sphone;
    private byte[] simage;
    private String spassword;

//    private String id;
//    private String sFname;
//    private String sLname;
//    private String sQualifiction;
//    private String sEmail;
//    private String sGender;
//    private String sDob;
//    private String sPhone;
//    private byte[] sImage;
//    private String sPassword;

    public StudData(String sfname, String slname,String squalifiction,String semail,String sgender,String sdob,String sphone,byte[] simage, String spassword)
    {
        this.sfname = sfname;
        this.slname = slname;
        this.squalifiction = squalifiction;
        this.semail = semail;
        this.sgender = sgender;
        this.sdob = sdob;
        this.sphone = sphone;
        this.simage = simage;
        this.spassword = spassword;
    }

    public StudData(String semail,String spassword)
    {
        this.semail = semail;
        this.spassword = spassword;
    }

//    public StudData(String id, String sFname, String sLname, String sQualifiction, String sEmail, String sGender, String sDob, String sPhone, byte[] sImage, String sPassword)
//    {
//        this.id = id;
//        this.sFname = sFname;
//        this.sLname = sLname;
//        this.sQualifiction = sQualifiction;
//        this.sEmail = sEmail;
//        this.sGender = sGender;
//        this.sDob = sDob;
//        this.sphone = sPhone;
//        this.sImage = sImage;
//        this.sPassword = sPassword;
//    }

    public String getSfname() {
        return sfname;
    }

    public void setSfname(String sfname) {
        this.sfname = sfname;
    }

    public String getSlname() {
        return slname;
    }

    public void setSlname(String slname) {
        this.slname = slname;
    }

    public String getSqualifiction() {
        return squalifiction;
    }

    public void setSqualifiction(String squalifiction) {
        this.squalifiction = squalifiction;
    }

    public String getSemail() {
        return semail;
    }

    public void setSemail(String semail) {
        this.semail = semail;
    }

    public String getSgender() {
        return sgender;
    }

    public void setSgender(String sgender) {
        this.sgender = sgender;
    }

    public String getSdob() {
        return sdob;
    }

    public void setSdob(String sdob) {
        this.sdob = sdob;
    }

    public String getSphone() {
        return sphone;
    }

    public void setSphone(String sphone) {
        this.sphone = sphone;
    }

    public byte[] getSimage() {
        return simage;
    }

    public void setSimage(byte[] simage) {
        this.simage = simage;
    }

    public String getSpassword() {
        return spassword;
    }

    public void setSpassword(String spassword) {
        this.spassword = spassword;
    }
//
//    public String getId() {
//        return id;
//    }
//
//    public void setId(String id) {
//        this.id = id;
//    }
//
//    public String getsFname() {
//        return sFname;
//    }
//
//    public void setsFname(String sFname) {
//        this.sFname = sFname;
//    }
//
//    public String getsLname() {
//        return sLname;
//    }
//
//    public void setsLname(String sLname) {
//        this.sLname = sLname;
//    }
//
//    public String getsQualifiction() {
//        return sQualifiction;
//    }
//
//    public void setsQualifiction(String sQualifiction) {
//        this.sQualifiction = sQualifiction;
//    }
//
//    public String getsEmail() {
//        return sEmail;
//    }
//
//    public void setsEmail(String sEmail) {
//        this.sEmail = sEmail;
//    }
//
//    public String getsGender() {
//        return sGender;
//    }
//
//    public void setsGender(String sGender) {
//        this.sGender = sGender;
//    }
//
//    public String getsDob() {
//        return sDob;
//    }
//
//    public void setsDob(String sDob) {
//        this.sDob = sDob;
//    }
//
//    public String getsPhone() {
//        return sPhone;
//    }
//
//    public void setsPhone(String sPhone) {
//        this.sPhone = sPhone;
//    }
//
//    public byte[] getsImage() {
//        return sImage;
//    }
//
//    public void setsImage(byte[] sImage) {
//        this.sImage = sImage;
//    }
//
//    public String getsPassword() {
//        return sPassword;
//    }
//
//    public void setsPassword(String sPassword) {
//        this.sPassword = sPassword;
//    }
}



