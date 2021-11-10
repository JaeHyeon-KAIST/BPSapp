import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../functions/Widgets/DividewithObj.dart';

class AgreementScreen extends StatefulWidget {
  @override
  _AgreementScreen createState() => _AgreementScreen();
}

class _AgreementScreen extends State<AgreementScreen> {
  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
    final blockColor = Color(0xff333C47); //텍스트 들어가는 블록 색
    final shadowColor = Color(0xffD2ABBA);
    double defaultSize = valWidth * 0.0025; //폰트사이즈용
    double graphWidth = valWidth * 0.86;
//앱 이용약관
    final appTxt = "\n제 1장 총칙\n\n"
        "제1조 (목적) 이 약관은 KAIST 연구팀 ALPACA가 운영하는 “홈페이지”와 “애플리케이션”(이하 “홈페이지”와 “애플리케이션”을 “APP”이라고 합니다)의 서비스 이용 및 제공에 관한 제반 사항의 규정을 목적으로 합니다.\n\n"
        "제2조 (용어의 정의) ① 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.\n"
        "1.	“서비스”라 함은 구현되는 PC, 모바일 기기를 통하여 “이용자”가 이용할 수 있는 신체 데이터 측정등 연구팀이 제공하는 제반 서비스를 의미합니다.\n"
        "2.	“이용자”란 “APP”에 접속하여 이 약관에 따라 “APP”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.\n"
        "3.	“회원”이란 “APP”에 개인정보를 제공하여 회원등록을 한 자로서, “APP”이 제공하는 서비스를 이용하는 자를 말합니다.\n"
        "4.	“모바일 기기”란 콘텐츠를 다운로드 받거나 설치하여 사용할 수 있는 기기로서, 휴대폰, 스마트폰, 휴대정보단말기(PDA), 태블릿 등을 의미합니다.\n"
        "5.	“계정정보”란 회원의 회원번호와 외부계정정보, 기기정보 등 회원이 회사에 제공한 정보를 의미합니다.\n"
        "6.	“애플리케이션”이란 회사가 제공하는 서비스를 이용하기 위하여 모바일 기기를 통해 다운로드 받거나 설치하여 사용하는 프로그램 일체를 의미합니다.\n"
        "② 이 약관에서 사용하는 용어의 정의는 본 조 제1항에서 정하는 것을 제외하고는 관계법령 및 서비스별 정책에서 정하는 바에 의하며, 이에 정하지 아니한 것은 일반적인 상 관례에 따릅니다.\n\n"
        "제3조 (약관의 효력 및 변경) ① 본 약관은“APP” 내 또는 그 연결화면에 게시하거나 이용자에게 공지함으로써 효력이 발생합니다.\n"
        "② 연구팀은 불가피한 여건이나 사정이 있을 경우 「약관의 규제에 관한 법률」, 「정보통신망이용촉진 및 정보보호 등에 관한 법률」등 관련 법령에 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.\n"
        "③ 연구팀이 약관을 개정할 경우에는 적용일자 및 개정내용, 개정사유 등을 명시하여 최소한 그 적용일 하루 이전부터 “APP” 내 또는 그 연결화면에 게시하여 이용자에게 공지합니다. 다만, 변경된 내용이 회원에게 불리하거나 중대한 사항의 변경인 경우에는 그 적용일 3일 이전까지 본문과 같은 방법으로 공지하고, 회원의 전자우편주소, 전자메모, 서비스 내 쪽지, 문자메시지(LMS/SMS)의 방법으로 회원에게 통지합니다. 이 경우 개정 전 내용과 개정 후 내용을 명확하게 비교하여 회원이 알기 쉽도록 표시합니다.\n"
        "④ 연구팀이 약관을 개정할 경우 개정약관 공지 후 개정약관의 적용에 대한 회원의 동의 여부를 확인합니다. 연구팀은 제3항의 공지 또는 통지를 할 경우 회원이 개정약관에 대해 동의 또는 거부의 의사표시를 하지 않으면 동의한 것으로 볼 수 있다는 내용도 함께 공지 또는 통지를 하며, 회원이 이 약관 시행일까지 거부의 의사표시를 하지 않는다면 개정약관에 동의한 것으로 볼 수 있습니다. 회원이 개정약관에 대해 동의하지 않는 경우 연구팀 또는 회원은 서비스 이용계약을 해지할 수 있습니다.\n\n"
        "제4조 (약관 외 준칙) 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 「약관의 규제에 관한 법률」, 「정보통신망이용촉진 및 정보보호 등에 관한 법률」등 관련 법령 또는 상 관례에 따릅니다.\n\n"
        "제5조 (회원가입) ① 이용자는 “APP”에서 정한 양식에 따라 회원정보를 기입한 후 이 약관의 내용에 대하여 동의하여 회원가입 신청을 하면, 연구팀이 이러한 신청을 승낙하여 회원으로 가입됩니다.\n"
        "② 연구팀은 원칙적으로 전 항에 따라 회원가입신청에 대하여 승낙함을 원칙으로 합니다. 다만, 연구팀은 다음 각 호의 어느 하나에 해당하는 이용자에 대해서는 회원가입을 거절하거나 사후에 회원자격을 상실시킬 수 있습니다.\n"
        "1.	회원정보 내용을 허위로 기재하거나 타인의 명의를 도용한 경우\n"
        "2.	연구팀이 서비스를 제공하지 않은 국가에서 비정상적이거나 우회적인 방법을 통해 서비스를 이용하는 경우\n"
        "3.	사회의 안녕과 질서 또는 미풍양속을 저해할 목적으로 신청한 경우\n"
        "4.	부정한 용도로 서비스를 이용하고자 하는 경우\n"
        "5.	영리를 추구할 목적으로 서비스를 이용하고자 하는 경우\n"
        "6.	가입 신청자가 본 약관에 의거 이전에 회원자격을 상실한 적이 있는 경우\n"
        "7.	만 14세 미만인 경우\n"
        "8.	그 밖에 각 호에 준하는 사유로서 승낙이 부적절하다고 판단되는 경우\n"
        "③ 회원은 가입시 등록한 회원정보의 변경이 발생한 경우, 즉시 “APP”에서 직접 수정 또는 전자우편, 기타 방법으로 회사에 그 변경 사실을 알려야 합니다.\n\n"
        "제6조 (회원탈퇴 및 자격상실) ① 회원은 언제든지 서비스 이용을 원하지 않는 경우 언제든지 탈퇴를 요청할 수 있으며, 이 경우 연구팀은 즉시 회원탈퇴를 처리합니다. 회원탈퇴로 인해 회원이 서비스 내에서 보유한 이용정보는 모두 삭제되어 복구가 불가능하게 됩니다.\n"
        "② 연구팀은 회원이 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 등 본 계약을 유지할 수 없는 중대한 사유가 있는 경우에는 회원에게 통지하고, 서비스 이용을 제한․중지하거나 회원 자격을 상실시킬 수 있습니다.\n"
        "③ 연구팀이 회원자격을 상실시키는 경우에는 회원 등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원 등록 말소 전에 소명할 기회를 부여합니다.\n\n"
        "제7조 (회원에 대한 통지) ① 연구팀이 회원에 대한 통지를 하는 경우, 회원이 연구팀에 제출한 전자우편 또는 휴대번호로 할 수 있다.\n"
        "② 연구팀은 불특정다수 회원에 대한 통지의 경우 3일 이상 “APP”에 게시함으로서 개별 통지에 갈음 할 수 있다.\n\n"
        "제8조 (회사의 의무) ① 연구팀은 관련 법령, 이 약관에서 정하는 권리의 행사 및 의무의 이행을 신의에 따라 성실하게 준수합니다.\n"
        "② 연구팀은 회원이 안전하게 서비스를 이용할 수 있도록 개인정보(신용정보 포함)보호를 위해 보안시스템을 갖추어야 하며 개인정보처리방침을 공시하고 준수합니다. 연구팀은 이 약관 및 개인정보처리방침에서 정한 경우를 제외하고는 회원의 개인정보가 제3자에게 공개 또는 제공되지 않도록 합니다.\n"
        "③ 연구팀은 계속적이고 안정적인 서비스의 제공을 위하여 서비스 개선을 하던 중 설비에 장애가 생기거나 데이터 등이 멸실․훼손된 때에는 천재지변, 비상사태, 현재의 기술로는 해결이 불가능한 장애나 결함 등 부득이한 사유가 없는 한 지체 없이 이를 수리 또는 복구하도록 최선의 노력을 다합니다.\n\n"
        "제9조 (회원의 의무) ① 회원은 연구팀에서 제공하는 서비스의 이용과 관련하여 다음 각 호에 해당하는 행위를 해서는 안 됩니다.\n"
        "1.	이용신청 또는 회원 정보 변경 시 타인의 명의를 도용하거나 허위사실을 기재하는 행위\n"
        "2.	연구팀의 팀원이나 운영자를 가장하거나 타인의 명의를 도용하여 메일을 발송하는 행위, 타인으로 가장하거나 타인과의 관계를 허위로 명시하는 행위\n"
        "3.	다른 회원의 개인정보를 무단으로 수집⋅저장⋅게시 또는 유포하는 행위\n"
        "4.	서비스를 무단으로 영리, 영업, 광고, 홍보, 정치활동, 선거운동 등 본래의 용도 이외의 용도로 이용하는 행위\n"
        "5.	연구팀의 서비스를 이용하여 얻은 정보를 무단으로 복제․유통․조장하거나 상업적으로 이용하는 행위, 알려지거나 알려지지 않은 버그를 악용하여 서비스를 이용하는 행위\n"
        "6.	타인을 기만하여 이득을 취하는 행위, 연구팀의 서비스의 이용과 관련하여 타인에게 피해를 입히는 행위\n"
        "7.	연구팀이나 타인의 지적재산권 또는 초상권을 침해하는 행위, 타인의 명예를 훼손하거나 손해를 가하는 행위\n"
        "8.	법령에 의하여 전송 또는 게시가 금지된 정보(컴퓨터 프로그램)나 컴퓨터 소프트웨어⋅하드웨어 또는 전기통신장비의 정상적인 작동을 방해⋅파괴할 목적으로 고안된 바이러스⋅컴퓨터 코드⋅파일⋅프로그램 등을 고의로 전송⋅게시⋅유포 또는 사용하는 행위\n"
        "9.	연구팀으로부터 특별한 권리를 부여받지 않고 애플리케이션을 변경하거나, 애플리케이션에 다른 프로그램을 추가⋅삽입하거나, 서버를 해킹⋅역설계하거나, 소스 코드나 애플리케이션 데이터를 유출⋅변경하거나, 별도의 서버를 구축하거나, 웹사이트의 일부분을 임의로 변경⋅도용하여 회사를 사칭하는 행위\n"
        "10.	그 밖에 관련 법령에 위반되거나 선량한 풍속 기타 사회통념에 반하는 행위\n"
        "② 회원의 ID와 비밀번호에 관한 관리책임은 회원에게 있으며, 이를 제3자가 이용하도록 하여서는 안됩니다.\n"
        "③ 이용자는 본 약관 및 관련법령에 규정한 사항을 준수하여야 합니다.\n\n"
        "제10조 (서비스의 이용) ① “APP”은 다음과 같은 서비스를 회원에게 제공합니다. 단, 연구팀이 “APP”으로 제공하는 서비스 이용을 위해 필요시 이용자에게 위치정보이용약관 및 “계정정보”의 제공에 관한 동의를 추가로 요구할 수 있으며, 동의하지 않을 경우 일부 서비스가 제한될 수 있습니다.\n"
        "1.	Apple Health 앱으로부터 전달된 생체정도 수집 및 디스플레이\n"
        "2.	헬스케어 전문가와의 연결 및 상담\n"
        "3.	기타 회사가 정하는 서비스\n"
        "② 연구팀은 회원에게 별도의 동의를 받은 경우 서비스 이용에 대한 유용한 각종 정보에 대하여 “APP”에 게재하는 것 이외에 문자메시지, 푸시(Push) 알림 등의 방법으로 회원에게 제공할 수 있습니다.\n"
        "③ 서비스의 이용은 “APP”의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴를 원칙으로 합니다. 다만, 정기점검 등의 필요로 인하여 연구팀이 정한 날 및 시간에 대해서는 예외로 합니다.\n"
        "④ 연구팀은 “APP” 시스템 등의 보수, 점검, 교체, 시스템의 고장, 통신의 두절, 기타 불가항력적 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다. 다만, 서비스 중단의 경우 회사는 “APP”에 사전 통지하고, 사전에 통지할 수 없는 부득이한 사유가 있는 경우 제 조에 정한 방법으로 회원에게 통지합니다.\n\n"
        "제11조 (개인정보의 보호 및 사용) ① 연구팀은 이용자의 정보 수집시 원활한 서비스 제공을 위해 필요한 최소한의 정보를 수집합니다.\n"
        "② 연구팀이 이용자의 개인식별이 가능한 개인정보 및 계정정보를 수집하는 때에는 반드시 당해 이용자의 동의를 받습니다.\n"
        "③ 연구팀은 관련 법령에 의하거나, 관련 국가기관 등의 요청이 있는 경우를 제외하고는 회원의 개인정보를 본인의 동의 없이 타인에게 제공하지 않습니다.\n"
        "④ 이용자는 언제든지 연구팀이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정 또는 동의 철회를 요구할 수 있으며 연구팀는 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 그 오류를 정정할 때까지 해당 개인정보를 이용하지 않습니다.\n"
        "⑤ 기타 개인정보관련사항은 “APP”에 별도로 게시하는 개인정보취급방침에 의거합니다.\n\n"
        "제12조 (회사의 면책) ① 연구팀은 이 약관 제10조 제3항, 제4항의 사유로 서비스 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대해서는 관련법에 특별한 규정이 없는 한 회원에게 별도의 보상을 하지 않습니다.\n"
        "② 연구팀은 회원의 고의 또는 과실로 인한 서비스 이용의 장애에 대하여는 책임을 지지 않습니다.\n"
        "③ 서비스와 관련하여 게재한 정보나 자료 등의 신뢰성, 정확성 등에 대하여 연구팀은 고의 또는 중대한 과실이 없는 한 책임을 지지 않습니다.\n"
        "④ 연구팀은 무료로 제공되는 서비스 이용과 관련하여 회원에게 발생한 손해에 대해서는 책임을 지지 않습니다.\n"
        "⑤ 연구팀은 회원이 서비스를 이용하여 기대하는 이익을 얻지 못하거나 상실한 것에 대하여 책임을 지지 않습니다.\n"
        "⑥ 연구팀은 회원이 “APP”아이디 및 비밀번호, 모바일 기기 비밀번호, 계정정보 등을 관리하지 않아 발생하는 손해에 대해 책임을 지지 않습니다.\n"
        "⑦ 회원이 모바일 기기의 변경, 모바일 기기의 번호 변경, 운영체제(OS) 버전의 변경, 해외 로밍, 통신사 변경 등으로 인해 콘텐츠 전부나 일부의 기능을 이용할 수 없는 경우 연구팀은 이에 대해 책임을 지지 않습니다.\n"
        "⑧ 회원이 연구팀이 제공하는 콘텐츠나 계정정보를 삭제한 경우 연구팀은 이에 대해 책임을 지지 않습니다.\n\n"
        "제13조 (저작권 등의 귀속) ① 연구팀이 제작한 서비스 내의 콘텐츠에 대한 저작권과 기타 지적재산권은 연구팀에 귀속합니다.\n"
        "② 회원은 연구팀이 제공하는 서비스를 이용하여 얻은 정보 중에서 연구팀 또는 제공업체에 지적재산권이 귀속된 정보를 연구팀 또는 제공업체의 사전 동의 없이 복제⋅전송 등의 방법(편집, 공표, 공연, 배포, 방송, 2차적 저작물 작성 등을 포함합니다. 이하 같습니다)에 의하여 영리목적으로 이용하거나 타인에게 이용하게 하여서는 안 됩니다.\n"
        "③ 회원의 게시물이 정보통신망법 및 저작권법 등 관련법에 위반되는 내용을 포함하는 경우, 권리자는 관련법이 정한 절차에 따라 해당 게시물의 게시중단 및 삭제 등을 요청할 수 있으며, 이로 인해 발생하는 민·형사상의 책임은 전적으로 해당 회원 본인이 부담하여야 하며, 회사는 관련법에 따라 조치를 취하여야 합니다\n"
        "④ 연구팀은 전항에 따른 권리자의 요청이 없는 경우라도 권리침해가 인정될 만한 사유가 있거나 기타 연구팀 내 정책 및 관련법에 위반되는 경우에는 관련법에 따라 해당 게시물에 대해 임시조치 등을 취할 수 있습니다.\n"
        "⑤ 이 조는 연구팀이 서비스를 운영하는 동안 유효하며, 회원 탈퇴 후에도 지속적으로 적용됩니다.\n\n"
        "제14조 (회원의 고충처리 및 분쟁해결)\n"
        "① 연구팀은 회원의 편의를 고려하여 회원의 의견이나 불만을 제시하는 방법을 서비스 내 또는 그 연결화면에 안내합니다.\n"
        "② 연구팀은 회원으로부터 제기되는 의견이나 불만이 정당하다고 객관적으로 인정될 경우에는 합리적인 기간 내에 이를 신속하게 처리합니다. 다만, 처리에 장기간이 소요되는 경우에는 회원에게 장기간이 소요되는 사유와 처리일정을 서비스 내 공지하거나 제8조에 따라 통지합니다.\n\n"
        "제15조 (재판권 및 준거법) 이 약관은 대한민국 법률에 따라 규율되고 해석됩니다. 연구팀과 회원 간에 발생한 분쟁으로 소송이 제기되는 경우에는 법령에 정한 절차에 따른 법원을 관할 법원으로 합니다.\n\n";
//개인정보 처리방침
    final personalInfoTxt =
        "\n팀 ALPACA(이하 ‘연구팀’이라 합니다)는 개인정보보호법 및 정보통신망 이용촉진 및 정보보호 등에 관한 법률에 따라 연구팀이 운영하는 “홈페이지”와 “애플리케이션”(이하 “홈페이지와”와“애플리케이션”을 “APP”이라고 합니다) 이용자의 개인정보 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.\n\n"
        "연구팀은 개인정보처리방침의 지속적인 개선을 위하여 개인정보처리방침을 개정하는데 필요한 절차를 정하고 있습니다. 그리고 본 처리방침은 수시로 내용이 변경될 수 있으니 정기적으로 방문하여 확인하시기 바랍니다.\n\n"
        "제1조(개인정보의 수집 및 이용목적)\n"
        "① 개인정보 수집 및 이용목적\n"
        "1.	본인확인에 따른 서비스 부정이용 방지, 각종고지 · 통지, 고충처리, 분쟁조정을 위한 기록 보존 등을 목적으로 개인정보를 처리합니다.\n"
        "2.	연구팀에서 제공하는 헬스케어 서비스와 체중조절 관리 프로그램을 위해 익명으로 전문가에게 데이터를 전달 및 분석하기 위한 목적으로 개인정보를 처리합니다.\n"
        "3.	그 외 체중조절 프로그램 설계 및 제공을 위해 연구팀이 필요한 데이터를 분석하기 위한 목적으로 개인정보를 처리합니다.\n"
        "② 수집 및 이용하는 개인정보 항목\n"
        "1.	회원정보: 키, 체중, 성별, 생년월일, 질병 기초 정보\n"
        "2.	Apple Health에서 제공하는 정보: 심박수, 수면 시간 등을 포함하여 Apple Health로부터 권한을 받아 회원의 신체정보를 수집합니다. 해당 정보는 익명처리 되어 분석되며, 이를 통해 맞춤형 체중 조절 프로그램을 제공합니다.\n"
        "③ 수집방법\n"
        "1.	“APP”에 마련된 개인정보 입력란에 본인이 직접 입력하는 방식\n"
        "2.	Apple Health를 통해 측정된 정보를 받아오는 방식\n\n"
        "제2조(개인정보의 보유 및 이용기간)\n"
        "① 연구팀은 법령에 따른 개인정보 보유, 이용기간 또는 정보주체로부터 개인정보를 수집시에 동의 받은 개인정보 보유, 이용 기간 내에서 개인정보를 처리, 보유합니다.\n"
        "②  개인정보 처리 및 보유 기간은 다음과 같습니다.\n"
        "1.	보유 및 이용기간 : 회원 탈퇴 또는 개인정보의 수집·이용 등에 대한 동의를 철회할 때까지\n"
        "2.	기타 법률에 의해 이용자의 개인정보를 보존해야 할 필요가 있는 경우에는 해당 법률의 규정에 따릅니다.\n"
        "3.	정보통신망 이용촉진 및 정보보호에 등에 관한 법률에 따라 “APP”를 1년간 로그인하지 아니하는 회원의 개인정보를 보호하기 위하여 개인정보 분리보관 또는 파기 등 필요한 조치를 취합니다.\n\n"
        "제3조(정보주체 및 법정대리인의 권리와 그 행사방법)\n"
        "① 정보주체는 연구팀에 대해 언제든지 개인정보 열람,정정,삭제,처리정지 요구 등의 권리를 행사할 수 있습니다.\n"
        "② 제1항에 따른 권리 행사는 연구팀에 대해 개인정보보호법 시행령 제41조제1항에 따라 서면, 전자우편 등을 통하여 하실 수 있으며 연구팀은 이에 대해 지체 없이 조치하겠습니다.\n"
        "③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.\n"
        "④ 개인정보 열람 및 처리정지 요구는 개인정보보호법 제35조 제5항, 제37조 제2항에 의하여 정보주체의 권리가 제한될 수 있습니다.\n"
        "⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.\n"
        "⑥ 연구팀은 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.\n\n"
        "제4조(개인정보 파기절차 및 방법)\n"
        "① 연구팀은 원칙적으로 개인정보 보유기간의 경과, 처리목적 달성 등 그 개인정보가 불필요하게 되었을 때에는 지체없이 파기합니다. 다만, 다른 법령에 따라 보존하여야 하는 경우에는 그러하지 않을 수 있습니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.\n"
        "1.	파기절차\n"
        "불필요한 개인정보 및 개인정보파일은 개인정보 보호책임자의 책임 하에 관련법령 및 내부방침 절차에 따라 안전하게 파기합니다.\n"
        "2.	파기기한\n"
        "개인정보는 개인정보의 보유기간이 경과된 경우 정당한 사유가 없는 한 보유기간의 종료일로부터 5일이내에, 개인정보의 처리 목적 달성 등 그 개인정보가 불필요하게 되었을 때에는 정당한 사유가 없는 한 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.\n"
        "3.	파기방법\n"
        "가. 전자적 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다.\n"
        "나. 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.\n\n"
        "제5조(개인정보의 안전성 확보 조치)\n"
        "연구팀은 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.\n"
        "1.	정기적인 자체 감사 실시\n"
        "개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체 감사를 실시하고 있습니다.\n"
        "2.	개인정보 취급 팀원의 최소화 및 교육\n"
        "개인정보를 취급하는 팀원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.\n"
        "3.	내부관리계획의 수립 및 시행\n"
        "개인정보의 안전한 처리를 위하여 내부관리계획을 수립하고 시행하고 있습니다.\n"
        "4.	해킹 등에 대비한 기술적 대책\n"
        "연구팀은 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신·점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.\n"
        "5.	개인정보의 암호화\n"
        "이용자의 개인정보와 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.\n"
        "6.	개인정보에 대한 접근 제한\n"
        "개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.\n\n"
        "제6조(정보주체의 권익침해에 대한 구제방법)\n"
        "아래의 기관은 연구팀과는 별개의 기관으로서, 연구팀의 자체적인 개인정보 불만처리, 피해구제 결과에 만족하지 못하시거나 보다 자세한 도움이 필요하시면 문의하여 주시기 바랍니다.\n"
        "1.	개인정보 침해신고센터 (한국인터넷진흥원 운영)\n"
        "• 소관업무 : 개인정보 침해사실 신고, 상담 신청"
        "• 홈페이지 : privacy.kisa.or.kr\n"
        "• 전화 : (국번없이) 118\n"
        "• 주소 : (58324) 전남 나주시 진흥길 9(빛가람동 301-2) 3층 개인정보침해신고센터\n"
        "2.	개인정보 분쟁조정위원회\n"
        "• 소관업무 : 개인정보 분쟁조정신청, 집단분쟁조정 (민사적 해결)\n"
        "• 홈페이지 : www.kopico.go.kr\n"
        "• 전화 : (국번없이) 1833-6972\n"
        "• 주소 : (03171)서울특별시 종로구 세종대로 209 정부서울청사 4층\n"
        "3.	대검찰청 사이버범죄수사단 : 02-3480-3573 (www.spo.go.kr)\n"
        "4.	경찰청 사이버안전국 : 182 (http://cyberbureau.police.go.kr)\n\n"
        "제7조(개인정보 보호책임자)\n"
        "①	 연구팀은 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.\n"
        "1.	개인정보 보호책임자\n"
        "연구팀원 이재현\n"
        "2.	개인정보 담당부서\n"
        "부서 : ALPACA 연구팀\n"
        "담당자 : 고경빈\n"
        "연락처 : kyungbinkoh@kaist.ac.kr\n"
        "②	 정보주체께서는 연구팀의 서비스를 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 연구팀은 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.\n\n"
        "제8조(개인정보 처리방침 변경)\n"
        "이 개인정보처리방침은 2021.10.20.부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 3일 전부터 공지사항을 통하여 고지할 것입니다.\n\n";
//개인정보 수집 및 활용 동의서
    final agreeTxt =
        "건강정보 분석, 회원만을 위한 컨텐츠 제공 등 위해 필요한 최소한의 개인정보를 수집하고 있습니다. 이에 개인정보의 수집 및 이용에 관하여 아래와 같이 고지하오니 충분히 읽어보신 후 동의하여 주시기 바랍니다.\n\n"
        "1. 수집 및 이용목적\n"
        "· 맞춤형 체중조절 서비스 제공\n"
        "· 각종고지 · 통지, 고충처리, 분쟁조정을 위한 기록 보존\n"
        "2. 수집 및 이용하는 개인정보 항목\n"
        "· APP 서비스 관련 Apple Health에서 기록되는 정보\n"
        "· APP 접속 정보 및 서비스 이용정보\n"
        "3. 수집방법\n"
        "· 마련된 핸드폰에 직접 입력하는 방식\n"
        "· Apple Health에서 수집된 정보를 불러오는 방식\n"
        "· 생성정보 수집 툴을 통한 수집\n"
        "4. 보유 및 이용기간\n"
        "이용자가 회원탈퇴를 요청하거나 개인정보의 수집·이용 등에 대한 동의를 철회할 때까지 보유·이용합니다. 다만, 다음의 정보에 대해서는 아래의 이유로 예외로 합니다.\n"
        "· 기타 법률에 의해 이용자의 개인정보를 보존해야 할 필요가 있는 경우에는 해당 법률의 규정에 따릅니다.\n"
        "· 정보통신망 이용촉진 및 정보보호 등에 관한 법률에 따라 APP을 대통령령으로 정하는 기간동안 로그인하지 아니하는 이용자의 개인정보를 보호하기 위하여 개인정보 파기 등 필요한 조치를 취합니다. APP 회원은 1년간 미로그인시 회원정보 삭제 또는 분리보관 및 탈퇴 또는 이용정지처리가 됩니다. 이용자의 요청에 따라 달리 정한 경우가 있을 경우, 달리 정한 기간을 적용할 수 있습니다.\n\n";

    return Scaffold(
      appBar: AppBar(
          backgroundColor: bgColor,
          elevation: 0.0,
          title: Align(
            alignment: Alignment(-0.38, 0),
            child: Container(
              height: valHeight * 0.08,
              padding: EdgeInsets.only(top: 20),
              child: Text(
                  "개인정보 처리방침 및 이용약관",
                  style: TextStyle(
                      fontSize: defaultSize * 17, color: txtColor),
                  textAlign: TextAlign.center),
            ),
          ),
          leading: Container(
            height: valHeight * 0.08,
            padding: EdgeInsets.only(top: 14),
            child: IconButton(
              icon: SvgPicture.asset('images/arrow towards left_icon.svg'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      backgroundColor: bgColor,
      body: ListView(
        children: [
          SizedBox(height: 30),
          DividewithObj(
              context,
              Container(
                width: valWidth * 0.4,
                child: Text(
                  "App 이용약관",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: linetxtColor,
                    fontSize: defaultSize * 14,
                  ),
                ),
              ),
              0.3,
              0.3),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: valHeight * 0.035,
                ),
                Container(
                  width: valWidth * 0.85,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(valWidth * 0.015),
                      color: blockColor,
                      boxShadow: [
                        BoxShadow(color: shadowColor, blurRadius: 1.3)
                      ]),
                  padding: EdgeInsets.only(
                      left: defaultSize * 8, right: defaultSize * 8),
                  child: Text(
                    appTxt,
                    softWrap: true,
                    style:
                        TextStyle(fontSize: defaultSize * 10, color: txtColor),
                  ),
                ),
                SizedBox(
                  height: valHeight * 0.05,
                ),
                DividewithObj(
                    context,
                    Container(
                      width: valWidth * 0.4,
                      child: Text(
                        "개인정보 처리방침",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: linetxtColor,
                          fontSize: defaultSize * 14,
                        ),
                      ),
                    ),
                    0.3,
                    0.3),
                SizedBox(height: valHeight * 0.035),
                Container(
                  width: valWidth * 0.85,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(valWidth * 0.015),
                      color: blockColor,
                      boxShadow: [
                        BoxShadow(color: shadowColor, blurRadius: 1.3)
                      ]),
                  padding: EdgeInsets.only(
                      left: defaultSize * 8, right: defaultSize * 8),
                  child: Text(
                    personalInfoTxt,
                    softWrap: true,
                    style:
                        TextStyle(fontSize: defaultSize * 10, color: txtColor),
                  ),
                ),
                SizedBox(
                  height: valHeight * 0.05,
                ),
                DividewithObj(
                    context,
                    Container(
                      width: valWidth * 0.6,
                      child: Text(
                        "개인(신용)정보 수집 및 이용동의",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: linetxtColor,
                          fontSize: defaultSize * 14,
                        ),
                      ),
                    ),
                    0.2,
                    0.2),
                SizedBox(
                  height: valHeight * 0.035,
                ),
                Container(
                  width: valWidth * 0.85,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(valWidth * 0.015),
                      color: blockColor,
                      boxShadow: [
                        BoxShadow(color: shadowColor, blurRadius: 1.3)
                      ]),
                  padding: EdgeInsets.only(
                      left: defaultSize * 8, right: defaultSize * 8),
                  child: Text(
                    agreeTxt,
                    softWrap: true,
                    style:
                        TextStyle(fontSize: defaultSize * 10, color: txtColor),
                  ),
                ),
                SizedBox(
                  height: valHeight * 0.05,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
