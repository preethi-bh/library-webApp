package rest;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Application
{
	public static void mains(String args[]) throws Exception{
		SpringApplication.run(Application.class,args);
	}
}