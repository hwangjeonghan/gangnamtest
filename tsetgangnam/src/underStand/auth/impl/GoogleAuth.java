package underStand.auth.impl;

import underStand.auth.SnsAuth;
import underStand.dto.MemberDTO;

public class GoogleAuth implements SnsAuth {

    @Override
    public boolean login(MemberDTO member) {
        System.out.println("구글 로그인 성공");
        return true;
    }
}
