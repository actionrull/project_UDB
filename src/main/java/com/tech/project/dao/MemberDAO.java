package com.tech.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.tech.project.dto.MemberDTO;

public class MemberDAO {
	DataSource dataSource;

	public MemberDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/orcl");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	//회원탈퇴
	public void DeleteID(String hID, String deletePW) {
		String sql = "delete MEMBER_SEEKER where mspw = ? and msid = ? ";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, deletePW);
			ps.setString(2, hID);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	//0526 이후 수정사항
	//기업회원 가입
	public int offerjoin(MemberDTO memberDTO) {
		int idCheckResult = idCheck(memberDTO.getMsid());
		int nnCheckResult = nicknameCheck(memberDTO.getMsname());
		if (idCheckResult == 0 && nnCheckResult == 0) {// 가입 가능할 때
			String sql = "insert into MEMBER_SEEKER values((MEMBER_SEEKER_SEQ.NEXTVAL)+1,?,?,?,?,?,0,?,?,'','','offer',?,?,?,?)";
			Connection con = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				con = dataSource.getConnection();
				ps = con.prepareStatement(sql);
				ps.setString(1, memberDTO.getMsid());
				ps.setString(2, memberDTO.getMspw());
				ps.setString(3, memberDTO.getMsname());
				ps.setString(4, memberDTO.getMsemail());
				ps.setString(5, memberDTO.getMsemailhash());
				ps.setString(6, memberDTO.getMsaddr());
				ps.setString(7, memberDTO.getMstel());
				ps.setString(8, memberDTO.getMspostcode());
				ps.setString(9, memberDTO.getMsdetailaddress());
				ps.setString(10, memberDTO.getMsextraaddress());
				ps.setString(11, memberDTO.getMolisense());

				return ps.executeUpdate();// 가입 성공, 1 반환
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (con != null)
						con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				try {
					if (ps != null)
						ps.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				try {
					if (rs != null)
						rs.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			return 0;// 데이터베이스 오류, 회원가입 실패
		} else if (idCheckResult == 1) {// 이미 가입한 ID, 가입 불가
			return -1;
		} else if (nnCheckResult == 1) {// 이미 존재하는 닉네임, 가입 불가
			return -2;
		}
		return -3;
	}
	
	
	
	
	
	
	
	
	//0526 이후 수정사항
	
	
	
	
	
	
	
	

	public String login(String msid, String mspw) {
		String sql = "select mspw,msname,msmaster,msemailchecked from MEMBER_SEEKER where msid = ?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String str = null;
		try {
			con = dataSource.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, msid);
			rs = ps.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(mspw) && rs.getString(4).equals("1")) {
					return rs.getString(2);// 로그인 성공
				}
				if (rs.getString(1).equals(mspw) && rs.getString(4).equals("0")) {
					return "이메일 인증이 필요합니다";
				} else {
					return "아이디나 비밀번호를 확인해주세요";
				}
			}
			return "아이디나 비밀번호를 확인해주세요";

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "데이터베이스 오류";
	}

	public int join(MemberDTO memberDTO) {
		int idCheckResult = idCheck(memberDTO.getMsid());
		int nnCheckResult = nicknameCheck(memberDTO.getMsname());
		if (idCheckResult == 0 && nnCheckResult == 0) {// 가입 가능할 때
			String sql = "insert into MEMBER_SEEKER values((MEMBER_SEEKER_SEQ.NEXTVAL)+1,?,?,?,?,?,0,?,?,?,?,'seeker',?,?,?,'')";
			Connection con = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				con = dataSource.getConnection();
				ps = con.prepareStatement(sql);
				ps.setString(1, memberDTO.getMsid());
				ps.setString(2, memberDTO.getMspw());
				ps.setString(3, memberDTO.getMsname());
				ps.setString(4, memberDTO.getMsemail());
				ps.setString(5, memberDTO.getMsemailhash());
				ps.setString(6, memberDTO.getMsaddr());
				ps.setString(7, memberDTO.getMstel());
				ps.setString(8, memberDTO.getMsbirth());
				ps.setString(9, memberDTO.getMsgender());
				ps.setString(10, memberDTO.getMspostcode());
				ps.setString(11, memberDTO.getMsdetailaddress());
				ps.setString(12, memberDTO.getMsextraaddress());

				return ps.executeUpdate();// 가입 성공, 1 반환
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (con != null)
						con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				try {
					if (ps != null)
						ps.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				try {
					if (rs != null)
						rs.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			return 0;// 데이터베이스 오류, 회원가입 실패
		} else if (idCheckResult == 1) {// 이미 가입한 ID, 가입 불가
			return -1;
		} else if (nnCheckResult == 1) {// 이미 존재하는 닉네임, 가입 불가
			return -2;
		}
		return -3;
	}

	public int nicknameCheck(String changeName) {
		String sql = "select * from MEMBER_SEEKER where msname = ?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String str = null;
		try {
			con = dataSource.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, changeName);
			rs = ps.executeQuery();
			if (rs.next()) {
				return 1;// 이미 존재하는 닉네임
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return 0;// 가입 가능
	}

	private int idCheck(String msid) {
		String sql = "select * from MEMBER_SEEKER where msid = ?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String str = null;
		try {
			con = dataSource.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, msid);
			rs = ps.executeQuery();
			if (rs.next()) {
				return 1;// 이미 가입한 아이디
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return 0;// 가입 가능
	}

	public int getMemberEmailChecked(String msid) {
		String sql = "select msemailchecked from MEMBER_SEEKER where msid = ?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, msid);
			rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return 0;// 데이터베이스 오류
	}

	public void setMemberEmailChecked(String msid) {
		String sql = "update MEMBER_SEEKER set  msemailchecked = 1 where msid = ?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, msid);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public String getMemberEmail(String msid) {
		String sql = "select msemail from MEMBER_SEEKER where msid = ?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, msid);
			rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;// 데이터베이스 오류
	}

	public int lookupPW(String msid, String msemail) {
		String sql = "select * from MEMBER_SEEKER where msid = ? and msemail=?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String str = null;
		try {
			con = dataSource.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, msid);
			ps.setString(2, msemail);
			rs = ps.executeQuery();
			if (rs.next()) {
				return 1;// ID, mail에 해당 PW 존재
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return 0;// 오류
	}

	public void updatePW(String msid, String mspw) {
		String sql = "update MEMBER_SEEKER set mspw = ? where msid = ?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, mspw);
			ps.setString(2, msid);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public String getMemberEmailRep(String memberNickname) {
		String sql = "select msemail from MEMBER_SEEKER where msname = ?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, memberNickname);
			rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;// 데이터베이스 오류
	}

	public void setPW(String hID, String changedPW) {
		String sql = "update MEMBER_SEEKER set mspw = ? where msid = ? ";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, changedPW);
			ps.setString(2, hID);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void setNickname(String hID, String changeName) {
		String sql = "update MEMBER_SEEKER set msname = ? where msid = ? ";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, changeName);
			ps.setString(2, hID);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public String msmaster(String id) {
		String sql = "select msmaster from MEMBER_SEEKER where msid = ?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;// 데이터베이스 오류
	}
	
	public void setADDR(String hID, String changedADDR,String mspostcode,String msdetailaddress,String msextraaddress) {
		String sql = "update MEMBER_SEEKER set msaddr = ?, mspostcode = ?,msdetailaddress = ?, msextraaddress = ? where msid = ? ";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, changedADDR);
			ps.setString(2, mspostcode);
			ps.setString(3, msdetailaddress);
			ps.setString(4, msextraaddress);
			ps.setString(5, hID);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void setTEL(String hID, String changedTEL) {
		String sql = "update MEMBER_SEEKER set mstel = ? where msid = ? ";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, changedTEL);
			ps.setString(2, hID);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}