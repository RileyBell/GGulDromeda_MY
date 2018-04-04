package bean;

import java.util.ArrayList;

public class BoardBean {
	private int board_idx; /* 게시글 번호(시퀀스사용) */
	private String local_code; /* 지역 코드 */
	private int board_category; /* 게시판 종류 번호 */
	private String board_subject; /* 게시글 제목 */
	private String board_content; /* 게시글 내용 */
	private int board_like; /* 게시글 좋아요 */
	private String board_img_main; /* 대표이미지 제목 */
	private String board_input_date; /* 게시글 입력 날짜 */
	private String board_del_date; /* 게시글 삭제 날짜 */
	private int board_status; /* 상태 */
	private String user_nick; /*게시자 닉네임*/
	private String [] board_hash; /*게시글 모든 해시태그 스트링 배열로*/
	private int comment_cnt; /* 댓글 개수 count한것 담는 변수 */
	
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public String getLocal_code() {
		return local_code;
	}
	public void setLocal_code(String local_code) {
		this.local_code = local_code;
	}
	public int getBoard_category() {
		return board_category;
	}
	public void setBoard_category(int board_category) {
		this.board_category = board_category;
	}
	public String getBoard_subject() {
		return board_subject;
	}
	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public int getBoard_like() {
		return board_like;
	}
	public void setBoard_like(int board_like) {
		this.board_like = board_like;
	}
	public String getBoard_img_main() {
		return board_img_main;
	}
	public void setBoard_img_main(String board_img_main) {
		this.board_img_main = board_img_main;
	}
	public String getBoard_input_date() {
		return board_input_date;
	}
	public void setBoard_input_date(String board_input_date) {
		this.board_input_date = board_input_date;
	}
	public String getBoard_del_date() {
		return board_del_date;
	}
	public void setBoard_del_date(String board_del_date) {
		this.board_del_date = board_del_date;
	}
	public int getBoard_status() {
		return board_status;
	}
	public void setBoard_status(int board_status) {
		this.board_status = board_status;
	}
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	public String[] getBoard_hash() {
		return board_hash;
	}
	public void setBoard_hash(String[] board_hash) {
		this.board_hash = board_hash;
	}
	public int getComment_cnt() {
		return comment_cnt;
	}
	public void setComment_cnt(int comment_cnt) {
		this.comment_cnt = comment_cnt;
	}
	
	

	
	
	
	
	
}
