package rest;

import java.util.List;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/rest/")
public class Controller{
	Service service=new Service();
	
	@RequestMapping(value="/search",method=RequestMethod.POST,produces=MediaType=APPLICATION_JSON_VALUE)
	public @ResponseBody List<Model> getBook(@RequestParam String username,@RequestParam String bname){
		List<Model> m=service.getBookAvail(username,bname);
		return m;
	}
}