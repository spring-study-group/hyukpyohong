package study.hong.todolist.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService implements IMemberService{

	@Autowired
	IMemberDao memberDao;
	
	@Override
	public boolean login() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean register() {
		// TODO Auto-generated method stub
		return false;
	}

}
