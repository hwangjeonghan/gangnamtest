package underStand.auth;

import underStand.dto.MemberDTO;

public interface SnsAuth {

    boolean login(MemberDTO member);

}
