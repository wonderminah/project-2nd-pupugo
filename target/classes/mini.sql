-- 지식서재

-- 회원 테이블 시퀀스
create sequence mb_num_seq start with 1 increment by 1;
-- 회원 테이블
create table member
(
	mb_num 		number(10)		primary key, 		--회원번호
	mb_id 		varchar2(15)		not null unique, 	--아이디
	mb_pw 		varchar2(15)		not null, 			--비밀번호
	mb_name 		varchar2(15)		not null, 			--이름
	mb_nick 		varchar2(30)		not null, 			--닉네임
	mb_gender 	varchar2(10)		not null, 			--성별
	mb_birth 	number(10)		not null, 			--생일
	mb_ability  varchar2(10)		default 100, 		--내공
	mb_interest varchar2(30) 						--관심분야
);


-- 질문 테이블 시퀀스
create sequence qu_num_seq start with 1 increment by 1;
-- 질문 테이블
create table question
(
	qu_num			number(10)		primary key,		--질문글 번호
	qu_id			varchar2(15)		not null,		--작성자 아이디
	qu_date			date				default sysdate,	--작성일
	qu_category		varchar2(20)		not null,		--카테고리
	qu_ability		varchar2(5)		default 0,		--등록내공
	qu_title			varchar2(100)	not null,		--제목
	qu_content		varchar2(10000)	not null,		--내용
	qu_hits			number			default 0,		--조회수
	qu_originalfile 	varchar(200),					--파일 원본 이름
	qu_savedfile		varchar(100),					--파일 저장된 이름
	
	constraint qu_fk1 foreign key(qu_id) references member(mb_id) on delete cascade --질문 작성자 아이디는, 멤버 테이블의 회원 아이디를 참조
);


-- 답변 테이블 시퀀스
create sequence an_num_seq start with 1 increment by 1;
-- 답변 테이블
create table answer
(
	an_num		number(10)		primary key,		--답변글 번호
	an_qunum		number(10)		not null,		--원문 질문글 번호
	an_id		varchar2(15)		not null,		--작성자 아이디
	an_date		date				default sysdate,	--작성일
	an_category	varchar2(20)		not null,		--카테고리
	an_title		varchar2(100)	not null,		--제목
	an_content	varchar2(10000)	not null,		--내용
	an_selected	number(1)		not null,		--채택여부 (0 또는 1)
	
	constraint an_fk1 foreign key(an_qunum) references question(qu_num) on delete cascade,	--답변 테이블의 질문번호는, 질문 테이블의 질문번호를 참조
	constraint an_fk2 foreign key(an_id) references member(mb_id)								--답변 테이블의 작성자는, 회원 테이블의 아이디를 참조
)

-- 좋아요한 답변 테이블 시퀀스
create sequence sc_num_seq start with 1 increment by 1;
-- 좋아요한 답변 테이블
create table scrap
(
	sc_num		number(10)		primary key,		--기본 번호
	sc_qunum		number(10)		not null,		--원문 질문글 번호
	sc_id		varchar2(15)		not null,		--좋아요한 사람의 아이디
	
	constraint sc_fk1 foreign key(sc_annum) references answer(an_num), 	--좋아요 테이블의 질문번호는 질문 테이블의 질문번호를 참조
	constraint sc_fk2 foreign key(sc_id) references member(mb_id)			--좋아요 누른 사람의 아이디는 회원 테이블의 아이디를 참조
);


-- 댓글 테이블 시퀀스
create sequence re_num_seq start with 1 increment by 1;
-- 댓글 테이블
create table reply
(
	re_num		number(10)		primary key,
	re_id		varchar2(15)		not null,
	re_date		date				default sysdate,	
	re_like		number(10)		default 0,
	re_dislike	number(10)		default 0,
	
	constraint re_fk1 foreign key(re_id) references member(mb_id)
);


--　쪽지 테이블 시퀀스
create sequence no_num_seq start with 1 increment by 1;
-- 쪽지 테이블
create table note
(
	no_num		number(10)		primary key,		--기본번호
	no_sendid	varchar2(15)		not null,		--보낸사람 아이디
	no_recvid	varchar2(15)		not null,		--받는사람 아이디
	no_date		date				default sysdate,	--보낸날짜
	no_title		varchar2(100)	not null,		--제목
	no_content	varchar2(10000)	not null,		--내용
	
	constraint no_fk1 foreign key(no_sendid) references member(mb_id),
	constraint no_fk2 foreign key(no_recvid) references member(mb_id)
)

-- 단어장 테이블 시퀀스
create sequence vo_num_seq start with 1 increment by 1;
-- 단어장 테이블
create table voca
(
	vo_num			number(10)		primary key,		--기본번호
	vo_id			varchar2(15)		not null,		--유저 아이디
	vo_date			date				default sysdate,	--등록날짜
	vo_inputtext		varchar2(10000)	not null,		--입력내용
	vo_outputtext	varchar2(10000)	not null			--출력내용
	
	constraint vo_fk1 foreign key(vo_id) references member(mb_id) on delete cascade 
	--단어장 테이블의 유저 아이디는 회원 테이블의 유저 아이디를 참조하며, 유저가 탈퇴할 시 해당 단어도 함께 삭제된다.
)

-- 단어장 섹션 시퀀스
create sequence se_num_seq start with 1 increment by 1;
-- 단어장 섹션 테이블
create table section
(
	se_num			number(10)		primary key,	--기본번호
	se_name			varchar2(50)	not null,		--섹션 이름
	se_id			varchar2(15)	not null,		--유저 아이디
	se_date			date			default sysdate	--저장날짜
)

-- 단어와 카테고리를 매핑해주는 섹션맵 시퀀스
create sequence sm_num_seq start with 1 increment by 1;
-- 단어와 카테고리를 매핑해주는 섹션맵 테이블
create table sectionmap
(
    sm_num      number(10)      primary key,        --맵 테이블 고유번호
    vo_num      number(10)      not null unique,    --단어별 고유번호
    se_name     varchar2(50)    not null            --섹션 이름
    
    constraint se_fk1 foreign key(vo_num) references voca(vo_num)
)

commit;
