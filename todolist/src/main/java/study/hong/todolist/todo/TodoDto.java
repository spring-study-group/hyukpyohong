package study.hong.todolist.todo;

import java.util.Date;

public class TodoDto {

	private String subject;
	private String contents;
	private Date date;
	private int repeat;
	private int alarmUnit;
	private int alarmTime;
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getRepeat() {
		return repeat;
	}
	public void setRepeat(int repeat) {
		this.repeat = repeat;
	}
	public int getAlarmUnit() {
		return alarmUnit;
	}
	public void setAlarmUnit(int alarmUnit) {
		this.alarmUnit = alarmUnit;
	}
	public int getAlarmTime() {
		return alarmTime;
	}
	public void setAlarmTime(int alarmTime) {
		this.alarmTime = alarmTime;
	}
	
	
	
}
