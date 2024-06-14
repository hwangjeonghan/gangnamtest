package underStand;

import underStand.auth.impl.GoogleAuth;
import underStand.auth.impl.KakaoAuth;
import underStand.auth.impl.NaverAuth;
import underStand.dto.MemberDTO;
import underStand.service.MemberService;

import java.util.Scanner;

public class Application01 {

    public static void main(String[] args) {

        MemberService memberService;
        Scanner scanner = new Scanner(System.in);
        do {
            MemberDTO memberDTO;

            System.out.println("-----로그인 프로그램 시작-----");
            System.out.println("1. google 로그인");
            System.out.println("2. kakao 로그인");
            System.out.println("3. Naver 로그인");
            System.out.println("9. 프로그램 종료");
            System.out.print("로그인 할 인증 수단을 선택해주세요: ");
            int choice = scanner.nextInt();
            System.out.print("아이디를 입력해주세요: ");
            String id = scanner.next();
            System.out.print("비밀번호를 입력해주세요: ");
            String pwd = scanner.next();
            memberDTO = new MemberDTO(id, pwd);
            String result;

            switch (choice) {
                case 1:
                    memberService = new MemberService(new GoogleAuth());
                    result = memberService.loginMember(memberDTO);
                    break;
                case 2:
                    memberService = new MemberService(new NaverAuth());
                    result = memberService.loginMember(memberDTO);
                    break;
                case 3:
                    memberService = new MemberService(new KakaoAuth());
                    result = memberService.loginMember(memberDTO);
                    break;
                default:
                    result = "로그인 실패";
                    break;
            }
            System.out.println(result);
        } while (true);
    }
}