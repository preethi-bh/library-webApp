package rest;

import com.fasterxml.jackson.annotation.JsonIgnore;

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
  
 
  public void setColName(){
      this.username=username;
  }
  public void setBName(){
      this.bname=bname;
  }
  public void setEdition(){
      this.edition=edition;
  }
  public void setSubject(){
      this.subject=subject;
  }
  public void setRollno(){
      this.rollno=rollno;
  }
  public void setStatus(){
      this.status=status;
  }
  public void setBookId(){
      this.bookid=bookid;
  }
  @Override
  public String toString(){
    return "col name:"+username+" Bname:"+bname+" Edition:"+edition+" Subject:"+subject;

  }
}
 