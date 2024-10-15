# TripManager - 인공지능 기반의 맞춤형 여행 일정 추천 앱

<p align="center">
  <img src="https://github.com/user-attachments/assets/ec949740-57a6-4c6b-a9da-f3ce58bbf01e" width="30%" />
  <img src="https://github.com/user-attachments/assets/958dd20a-7c25-41a3-b37c-ede79fa1dbda" width="30%" />
  <img src="https://github.com/user-attachments/assets/4b4e467d-aec7-4242-b31b-8c5fe47ccd05" width="30%" />
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/c08db73d-1bc4-436d-a426-15bbcdd8745e" width="30%" />
  <img src="https://github.com/user-attachments/assets/f2e6466e-3f41-4c4a-b0aa-6eba64b73edd" width="30%" />
</p>


이 앱은 사용자에게 맞춤형 여행 추천을 제공하여 더욱 즐거운 여행 경험을 선사하는 것을 목표로 하였습니다. 
여행에 대한 관심이 많은 팀원들(디자이너, 앱 개발자, 백엔드 개발자)이 모여 기획하고 구현한 토이 프로젝트이며, 인공지능이 재미있는 콘텐츠와 좋은 장소를 기반으로 추천해주는 아이디어를 바탕으로 진행되었습니다.

## 📅 프로젝트 개요

- **개발 기간**: 2024.07 ~ 진행 중
- **참여 인원**: 디자이너 1명, 앱 개발자 1명, 백엔드 개발자 1명
- **사용 기술**: 
  - Flutter
  - Dart
  - Riverpod
  - Riverpod Annotation
  - GoRouter
  - Figma

## 🚀 주요 기능

- AI 기반 여행지 추천 시스템
- 다양한 SSO(카카오, 구글, 애플)를 통한 간편 인증 기능
- Google Map API 연동 및 경로 표시
- 여행지 저장 및 공유 기능
- AI Chatting 기능으로 여행 계획 지원

## 🛠️ 주요 업무

- 상태 관리: Riverpod 기반 상태 관리 적용
- SSO 인증: 카카오, 구글, 애플을 통한 인증 기능 구현
- 회원 가입: 사용자 계정 생성 및 이메일 인증 기능 구현
- AI Chatting: 사용자와의 대화를 통한 맞춤형 여행지 추천 프로세스 구현
- Google Map API: 지도 연동 및 경로 표시 기능 구현
- 코스 저장: 선호하는 코스 및 장소 저장 기능 구현
- 피드 업로드: 사용자 경험 공유를 위한 피드 업로드 기능 구현
- 출시 예정: 앱스토어(iOS) 및 플레이스토어(Android) 배포 준비 중

## 📚 프로젝트를 통해 배운 점

- Riverpod을 통해 애플리케이션 상태를 효율적으로 관리하고, 의존성 주입을 통해 코드 재사용성과 테스트 용이성을 높여 유지보수성을 향상
- Flutter 위젯 시스템을 활용하여 복잡한 UI를 구성하고, StatelessWidget과 StatefulWidget의 차이를 이해하며 적절히 활용하는 법 습득
- Dart의 build_runner와 json_serializable을 사용하여 JSON 데이터를 모델 클래스로 자동 변환하고, 반복 코드를 줄여 가독성 향상
- Flutter 테마 시스템을 통해 애플리케이션 디자인 일관성을 유지하는 방법 습득
- http 패키지를 사용하여 RESTful API와 통신하며 GET, POST, PUT, DELETE 요청 구현 능력 향상
- Flutter 네비게이션 시스템을 활용하여 페이지 간 전환 및 데이터 전달 관리 능력 습득

## 📦 설치 및 실행 방법

```bash
# 프로젝트 클론
git clone [레포지토리 URL]

# 패키지 설치
cd [프로젝트 디렉토리]
flutter pub get

# 앱 실행
flutter run

