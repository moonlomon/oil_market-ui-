## 메모

#### custom_text_feild.dart
- keyboardType : TextFeild/TextFormFeild에서 글을 작성할 때 나타나는 키보드의 형태를 설정
- inputFormatters : 입력할 수 있는 값을 제한

#### main_calendar.dart
- TableCalendar : table_calendar플러그인으로 만들 수 있는 캘린더 패키지 위젯
  - firstDay, lastDay : 달력에 가져올 수 있는 날짜의 최대값과 최소값 지정
  - focusedDay : 포커싱 마크가 새겨지는 날짜를 지정
  - seletedDayPredicate : 선택한 날짜 데이터를 담을 변수를 지정
  - onDaySelected : 날짜를 선택했을 때 실행되는 함수를 지정
  - headerStyle : 달력의 헤더 스타일을 설정
  - calendarStyle : 달력의 몸통 스타일을 설정

#### schedule_bottom_sheet
- SafeArea : SafeArea로 감싼 위젯이 시스템 UI를 건드리지 않도록 설정 -> 디바이스마다 동일한 ui를 보여줄 수 있음

#### schedule_card.dart
- IntrinsicHeight : flex위젯 안에 flex위젯이 있을 경우 flex위젯이 아닌 것들과 동일한 높이로 맞춤설정

#### today_banner.dart
- EdgeInsets.symmetric : only => 각각, all => 통일, symmetric => 상하(horizon)/좌우(vertical)로 padding 값을 지정
