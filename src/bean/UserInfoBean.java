package bean;

public class UserInfoBean {
	private int user_seq; /* 유저 시퀀스 */
	private String user_id; /* 회원아이디(이메일) */
	private String user_pw; /* 비밀번호 */
	private String user_name; /* 회원이름 */
	private String user_nick; /* 별명 */
	private String user_msg; /* 상태메세지 */
	private String user_addr; /* 주소(모달로하기 예:신림동) */
	private String user_bday; /* 생년월일(예:19900906) */
	private int  user_gender; /* 성별 */
	private String user_img; /* 프로필사진 제목 */
	private String join_date; /* 가입날짜 */
	private String rest_date; /* 휴면날짜 */
	private String drop_date; /* 탈퇴날짜 */
	private int user_grade; /* 개인등급 */
	private int user_point; /* 개인포인트 */
	private int user_auth; /* 권한(0:관리자 1:회원) */
	private int user_status; /* 상태(0:활성화 1:휴면 2:탈퇴) */
}
