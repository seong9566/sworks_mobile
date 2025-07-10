---
trigger: manual
---

You are an expert in Flutter (3.32.5), clean architecture with MVVM pattern, Riverpod for state management, and REST API integration using Dio.

✅ Language Requirement
- Always respond in Korean (한글) regardless of the query language.
- Use natural, professional Korean suitable for developers.

✅ Core Principles
- 프로젝트 전체에 걸쳐 SOLID 원칙을 엄격히 준수합니다.
- 핵심 비즈니스 로직은 TDD(Test-Driven Development) 방식으로 개발합니다.
  - 먼저 테스트 코드를 작성한 후 구현합니다.
  - 기능 요구사항은 테스트 케이스로 명세화합니다.
  - 테스트 실패 시 원인을 먼저 파악하고, 최소 단위로 고칩니다.

✅ Architecture and Project Structure
- Layer-first + Feature module 분리 구조 사용
  예시:
  lib/
  ├── features/
  │   ├── auth/
  │   │   ├── data/
  │   │   ├── domain/
  │   │   └── presentation/
  ├── core/
  │   ├── utils/
  │   ├── network/
  │   ├── theme/
  │   └── constants/
  └── main.dart

- 각 feature는 data/domain/presentation 계층으로 분리
- ViewModel은 presentation/viewmodels 디렉토리에 위치
- 의존성 주입은 `features/<feature>/presentation/providers/<feature>_providers_di.dart`에 선언

✅ State Management
- 상태 관리는 `flutter_riverpod`을 사용
- Provider는 `features/<feature>/presentation/providers/`에 위치
- StateNotifier 또는 AsyncNotifier 기반으로 구성
- 글로벌 Provider는 core/providers에 정의

✅ API 통신
- Dio를 HTTP 클라이언트로 사용
- `core/network/dio_client.dart`에 공통 Dio 인스턴스 구성
- 각 feature의 data/datasources가 API 호출 담당
- 공통 응답은 `base_response.dart`, 예외는 `exceptions.dart`에서 관리

✅ 데이터 계층 구성
- 모델은 `features/<feature>/data/models/`에 위치
- `freezed`, `json_serializable`, `freezed_annotation` 사용
- 모델은 immutable하며, `@freezed`와 `@JsonSerializable()` 애노테이션 포함
- JSON 변환은 자동 생성된 `fromJson`/`toJson` 메서드 활용
- `flutter pub run build_runner build --delete-conflicting-outputs`로 코드 생성
- 데이터 흐름: RemoteDataSource → RepositoryImpl → UseCase
- Repository 인터페이스는 domain, 구현체는 data에 위치
- API 클래스 명명은 `XxxApiService` 또는 `XxxRemoteDataSource`

✅ 로컬 저장소
- SharedPreferences 및 flutter_secure_storage 병행 사용
- 일반 설정은 SharedPreferences, 민감 정보는 SecureStorage
- 관련 유틸은 `core/storage/`에 위치

✅ UI 및 테마
- 커스텀 테마는 `core/theme/`에 정의
- Material 3 기반 색상/타이포그래피
- ThemeData 사용, 다크모드 지원 포함

✅ 테스트
- 통합 테스트 중심
- 핵심 도메인 로직은 TDD 방식으로 단위 테스트 우선
- 통합 테스트는 `integration_test/`에 위치
- `flutter_test`, `integration_test` 패키지 사용

✅ 네이밍 및 코드 컨벤션
- 클래스명: PascalCase
- 변수/함수명: camelCase
- Provider 변수명: `xxxProvider`
- 파일명: snake_case
- ViewModel: `XxxViewModel`, 화면: `XxxView`
- 모델: `XxxModel`, DTO: `XxxDto`, API: `XxxApiService`
- 기능 단위 디펜던시는 `<feature>_providers_di.dart`에 정의

✅ 플랫폼 타겟
- iOS와 Android만 지원
- 웹 및 데스크탑은 고려하지 않음

✅ CI/CD
- GitHub Actions를 사용해 CI/CD 파이프라인을 구성합니다.
  - 테스트 → 빌드 → 린트 → 배포 순으로 자동화합니다.
- 배포는 Fastlane을 통해 수행하며, Google Play 및 App Store를 대상으로 설정합니다.
  - 환경별로 다른 keystore 및 설정 파일을 관리합니다.

✅ 환경 구분
- 앱은 `dev`, `test`, `release` 3가지 환경으로 분리됩니다.
  - 각 환경은 별도 flavor 및 설정 파일 (`--dart-define`)로 관리합니다.
  - 환경별 API baseUrl, 앱 아이콘, 패키지명 등을 분리합니다.