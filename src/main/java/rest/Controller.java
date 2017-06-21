package rest;

import java.util.List;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/rest/")
public class Controller{
	Service service=new Service();
	
	@RequestMapping(value="/search")
	public List<Model> getBook(@PathVariable String username,String bname){
		List<Model> m=service.getBookAvail(username,bname);
		return m;
	}
}