package bean;

public class BoardCommentBean {
	private int board_idx; /* 게시글 번호(시퀀스사용) */
	private int comment_idx; /* 댓글 번호 */
	private String board_comment; /* 댓글 */
	private int comment_like; /* 댓글 좋아요 */
	private String comment_user_id; /* 작성자 아이디 */
	private String comment_date; /* 댓글 입력 날짜 */
}
