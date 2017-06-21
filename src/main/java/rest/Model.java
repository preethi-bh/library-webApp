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
  
 
  public void setColName(String username){
      this.username=username;
  }
  public void setBName(String bname){
      this.bname=bname;
  }
  public void setEdition(String edition){
      this.edition=edition;
  }
  public void setSubject(String subject){
      this.subject=subject;
  }
  public void setRollno(String rollno){
      this.rollno=rollno;
  }
  public void setStatus(String status){
      this.status=status;
  }
  public void setBookId(bookid){
      this.bookid=bookid;
  }
  @Override
  public String toString(){
    return "col name:"+username+" Bname:"+bname+" Edition:"+edition+" Subject:"+subject;

  }
}
 