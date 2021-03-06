package study.hong.todolist.todo;

public interface ITodoService {

	TodoDto getTodo(String name);
	Boolean writeTodo(TodoDto dto);
	Boolean updateTodo(TodoDto dto);
	Boolean deleteTodo(TodoDto dto);
	int checkTodo(String name);
	
}
