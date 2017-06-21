package rest;
public class Model{
  String username;
  String bname;
  String edition;
  String subject;
  String rollno;
  String mobileno;
  String issue_date;
  String renew_date;
  String status;
  int bookid;
  
 
  public void SetColName(){
      this.username=username;
  }
  public void SetBName(){
      this.bname=bname;
  }
  public void SetEdition(){
      this.edition=edition;
  }
  public void SetSubject(){
      this.subject=subject;
  }
  public void SetRollno(){
      this.rollno=rollno;
  }
  public void SetStatus(){
      this.status=status;
  }
  @Override
  public String toString(){
    return "col name:"+username+" Bname:"+bname+" Edition:"+edition+" Subject:"+subject;

  }
}
 