package rest;

import java.util.List;

import org.springframeworl.web.bind.annotation.*;

@RestController
@RequestMapping("/rest/")
public class Controller{
	Service service=new Service();
	
	@RequestMapping(value="/search")
	public Model getBook(@PathVariable String username,String bname){
		Model m=service.getBookAvail(username,bname);
		return model;
	}
