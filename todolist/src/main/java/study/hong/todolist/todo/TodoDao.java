package study.hong.todolist.todo;

import org.springframework.stereotype.Repository;

@Repository
public class TodoDao implements ITodoDao{

	@Override
	public TodoDto getTodo(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean writeTodo(TodoDto dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean updateTodo(TodoDto dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean deleteTodo(TodoDto dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int checkTodo(String name) {
		// TODO Auto-generated method stub
		return 0;
	}

}
