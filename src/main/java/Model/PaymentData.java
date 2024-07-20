package Model;

public class PaymentData {
    private int id;
    private String sid;
    private String cid;
    private String cname;
    private String camount;
    private String cardno;
    private String chname;
    private String chmonth;
    private String chyear;
    private String cvv;

    public PaymentData(String sid, String cid, String cname, String camount,String cardno, String chname, String chmonth, String chyear, String cvv) {
        this.sid = sid;
        this.cid = cid;
        this.cname = cname;
        this.camount = camount;
        this.cardno = cardno;
        this.chname = chname;
        this.chmonth = chmonth;
        this.chyear = chyear;
        this.cvv = cvv;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCardno() {
        return cardno;
    }

    public String getCamount() {
        return camount;
    }

    public void setCamount(String camount) {
        this.camount = camount;
    }
    public void setCardno(String cardno) {
        this.cardno = cardno;
    }

    public String getChname() {
        return chname;
    }

    public void setChname(String chname) {
        this.chname = chname;
    }

    public String getChmonth() {
        return chmonth;
    }

    public void setChmonth(String chmonth) {
        this.chmonth = chmonth;
    }

    public String getChyear() {
        return chyear;
    }

    public void setChyear(String chyear) {
        this.chyear = chyear;
    }

    public String getCvv() {
        return cvv;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }
}
