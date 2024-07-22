package Model;

public class StudData {
    private String sid;
    private String sfname;
    private String slname;
    private String squalifiction;
    private String semail;
    private String sgender;
    private String sdob;
    private String sphone;
    private byte[] simage;
    private String spassword;
    private String snpassword;

    public StudData(String sfname, String slname, String squalifiction, String semail, String sgender, String sdob, String sphone, String sid) {
        this.sfname = sfname;
        this.slname = slname;
        this.squalifiction = squalifiction;
        this.semail = semail;
        this.sgender = sgender;
        this.sdob = sdob;
        this.sphone = sphone;
        this.sid = sid;
    }


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

    public StudData(String sid,String spassword,String snpassword)
    {
        this.sid = sid;
        this.spassword = spassword;
        this.snpassword = snpassword;
    }

    public StudData(String semail,String spassword)
    {
        this.semail = semail;
        this.spassword = spassword;
    }


    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

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

    public String getSnpassword() {
        return snpassword;
    }

    public void setSnpassword(String snpassword) {
        this.snpassword = snpassword;
    }
}



