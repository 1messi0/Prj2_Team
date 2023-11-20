package com.board.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BoardDTO {
	// COMPANY 테이블
	private String id;
    private String password;
    private String companyname;
    private String companylicense;
    private String companynumber;
    private String companyaddress;
    private String email;
    private String phone;
    
	// CompanyAddInfo 테이블
    private String announcement;
    private String repnumber;
    private String dayoff;
    private String breaktime;
    private int    bno;
    
}
