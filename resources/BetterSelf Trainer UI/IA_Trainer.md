# 트레이너 앱 IA

*1차 베타테스트 기준, 21.10.03 작성*

### O. 로그인 화면

사용자 앱과 동일

### A. 사용자 선택화면

1. 트레이너와 연결된 사용자의 다음 항목을 리스트뷰 형태로 보여준다(이름순으로 정렬) :
    1. 사용자 프로필 사진[A1-1]
    2. 사용자 이름[A1-2]
    3. 사용자가 트레이닝 받는 요일[A1-3]
    4. 사용자 데이터 업데이트 여부[A2]
2. 리스트뷰에 표시된 사용자를 클릭했을 때, 다음 항목을 보여주는 팝업창이 뜬다 :
    1. 체중 변화 추이[A3]
    2. 가장 최근의 overall 피드백[C3]
    3. 트레이너가 개인적으로 작성한 노트(B1)
    4. 사용자 데이터 리포트 화면으로 넘어가는 버튼[AB]

### B. 사용자 데이터 리포트

1. 다음과 같이 사용자앱에서 볼 수 있는 데이터들을 볼 수 있다 :
    1. Inbody 변화[B1-1]
    2. 주간 스트레스 변화[B1-2]
    3. 주간 활동 변화[B1-3]. 다음 요소를 같이 보여준다 :
        1. 가장 최근에 한 운동 피드백(C1-1)
        2. 해당 블럭을 클릭하면 운동 피드백(C1)으로 넘어가는 기능
    4. 주간 식단 기록[B1-4]. 다음 요소를 같이 보여준다 :
        1. 가장 최근에 한 식단 피드백(C2-1)
        2. 해당 블럭을 클릭하면 운동 피드백(C2)으로 넘어가는 기능
    5. 주간 수면 변화[B1-5]. 
2. 트레이너가 해당 사용자에게 해주고 싶은, 자신만 볼 수 있는 노트[B1]를 볼 수 있는 블럭
    - 해당 블럭을 클릭하면 노트를 수정할 수 있음.
3. overall 피드백(C3)을 볼 수 있는 블럭
    1. 해당 블럭을 클릭하면 다음 요소가 포함된 팝업창이 뜬다 :
        1. 체중변화 추이와 각 기록을 측정했을 때 트레이너가 작성한 C3 히스토리
        2. C3으로 넘어갈 수 있는 버튼[BC3]
4. 해당 사용자와의 채팅 페이지로 넘어갈 수 있는 버튼
    1. 해당 버튼에는 다음 요소가 포함된다 : 
        1. 확인하지 않은 채팅의 개수(카카오톡처럼) or 확인하지 않은 채팅이 있는지의 여부[B4]

### C. 피드백 포맷

1. 운동 피드백 히스토리[C1]
    1. 가장 최근의 운동 피드백[C1-1]이 먼저 보이게끔 한다
    2. 주간 활동 변화(B1-3)
    3. 운동 피드백 작성하기 버튼. 해당 버튼을 클릭하면 다음 요소가 포함된 피드백 작성하기 팝업창이 뜬다 :
        1. 운동량과 관련한 피드백 양식
        2. 운동 시간과 관련한 피드백 양식
        3. 운동 종류와 관련한 피드백 양식
        4. 운동 강도와 관련한 피드백 양식
        5. 사용자 경험과 관련한 피드백 양식
        6. 기록하기 버튼
2. 식단 피드백 히스토리[C2]
    1. 가장 최근의 식단 피드백[C2-1]이 먼저 보이게끔 한다
    2. 주간 식단 기록(B1-4)
    3. 식단 피드백 작성하기 버튼. 해당 버튼을 클릭하면 다음 요소가 포함된 피드백 작성하기 팝업창이 뜬다 :
        1. 영양성분 관련 피드백 양식
        2. 식사시간 관련 피드백 양식
        3. 음식 종류 및 걱정되는 부분(알러지, 영양성분 외에 신경써야할 것 등) 관련 피드백 양식
        4. 사용자 경험과 관련한 피드백 양식
        5. 기록하기 버튼
3. overall 피드백 히스토리[C3]
    1. 가장 최근의 overall 피드백[C3-1]이 먼저 보이게끔 한다
    2. 주간 수면 기록(B1-5)
    3. Inbody 변화(B1-1)
    4. 주간 스트레스 변화(B1-2)
    5. overall 피드백 작성하기 버튼. 해당 버튼을 클릭하면 다음 요소가 포함된 피드백 작성하기 팝업창이 뜬다 :
        1. 수면시간 관련 피드백 양식
        2. 스트레스 관련 피드백 양식
        3. PT 경험 관련 피드백 양식
        4. 사용자 경험과 관련한 피드백 양식
        5. 기록하기 버튼

### D. 채팅

사용자 앱과 동일