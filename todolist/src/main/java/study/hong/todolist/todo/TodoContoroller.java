package study.hong.todolist.todo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TodoContoroller {

	@Autowired
	ITodoService todoService;
	
	@RequestMapping(value="getTodo")
	public ModelAndView getTodo(){
		String name = null; // 세션에서 로그인 이름 받도록
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", todoService.getTodo(name));
		mv.addObject("check", todoService.checkTodo(name));
		mv.setViewName("/todo/getTodo");
		return mv;
	}
	
	@RequestMapping(value="writeTodo")
	public String writeTodo(TodoDto dto){
		todoService.writeTodo(dto);
		return "getTodo";
	}
	
	@RequestMapping(value="updateTodo")
	public String updateTodo(TodoDto dto){
		todoService.updateTodo(dto);
		return "getTodo";
	}
	
	@RequestMapping(value="deleteTodo")
	public String deleteTodo(TodoDto dto){
		todoService.deleteTodo(dto);
		return "getTodo";
	}
	
	
	
	
	
}
