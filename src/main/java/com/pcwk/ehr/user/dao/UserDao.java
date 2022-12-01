package com.pcwk.ehr.user.dao;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.cmn.WorkDiv;
import com.pcwk.ehr.user.domain.UserVO;

public interface UserDao extends WorkDiv<UserVO> {

	//id 확인(회원가입시는 중복체크, 로그인시는 아이디존재여부)
	int idCheck(UserVO inVO) throws SQLException;
	
	//아이디와 비번이 DB와 맞는지 확인
	int passCheck(UserVO inVO) throws SQLException;
	
	//이메일로 아이디 찾기
	UserVO findIdByEmail(UserVO inVO) throws SQLException;
	
	//이름+생년월일로 아이디 찾기
	UserVO findIdByNameBirth(UserVO inVO) throws SQLException;
	
	//비밀번호찾기질문으로 비밀번호 찾기
	UserVO findPwByBackup(UserVO inVO) throws SQLException;
	
	
	
	
}
