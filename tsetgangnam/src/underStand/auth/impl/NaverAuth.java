package underStand.auth.impl;

import underStand.auth.SnsAuth;
import underStand.dto.MemberDTO;

public class NaverAuth implements SnsAuth {

    @Override
    public boolean login(MemberDTO member) {
        System.out.println("네이버 로그인 성공");
        return true;
    }
}
