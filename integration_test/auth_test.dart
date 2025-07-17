import 'package:sworks_mobile/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:sworks_mobile/features/auth/data/models/login_response_model.dart';
import 'package:sworks_mobile/features/auth/presentation/providers/auth_providers_di.dart';
import 'package:sworks_mobile/features/auth/presentation/view/login_view.dart';
import 'package:sworks_mobile/features/auth/presentation/view/password_change_view.dart';
import 'package:sworks_mobile/features/auth/presentation/view/widgets/auth_input_field.dart';
import 'package:sworks_mobile/network/base_response.dart';
import 'package:sworks_mobile/routers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:go_router/go_router.dart';

// Integration 테스트를 할 땐 외부 API/ IO작업이 필요한 부분만 Mock해주면 된다 굳이 ViewModel까지 Mock를 하면 불필요한 작업이 될 수 있다.

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

// SecureStorageUtil 모킹을 위한 헬퍼 클래스
class MockSecureStorageUtil {
  static late MockFlutterSecureStorage mockStorage;
  static bool initialized = false;

  static void initialize() {
    if (!initialized) {
      mockStorage = MockFlutterSecureStorage();
      initialized = true;
    }
  }

  static void reset() {
    initialized = false;
  }

  static void setupMockStorage() {
    // FCM 토큰 모킹
    when(() => mockStorage.read(key: any(named: 'key'))).thenAnswer((
      invocation,
    ) {
      final key = invocation.namedArguments[const Symbol('key')] as String;
      if (key == 'fcm_token') {
        return Future.value('mock_fcm_token');
      }
      return Future.value(null);
    });

    // 쓰기 작업 모킹
    when(
      () => mockStorage.write(
        key: any(named: 'key'),
        value: any(named: 'value'),
      ),
    ).thenAnswer((_) => Future.value());

    // 삭제 작업 모킹
    when(
      () => mockStorage.delete(key: any(named: 'key')),
    ).thenAnswer((_) => Future.value());

    // 모든 데이터 삭제 모킹
    when(() => mockStorage.deleteAll()).thenAnswer((_) => Future.value());
  }
}

// 테스트 메인 함수
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late MockAuthRemoteDataSource mockAuthRemoteDataSource;

  setUpAll(() {
    // 모킹을 위한 초기화
    registerFallbackValue('mock_key');
    registerFallbackValue('mock_value');
    registerFallbackValue('mock_fcm_token');
  });

  setUp(() {
    // 모의 객체 초기화
    mockAuthRemoteDataSource = MockAuthRemoteDataSource();
    // SecureStorageUtil 모킹 초기화
    MockSecureStorageUtil.initialize();
    MockSecureStorageUtil.setupMockStorage();
  });

  tearDown(() {
    // 모킹 정리
    MockSecureStorageUtil.reset();
  });

  // 테스트 앱 위젯 생성 함수
  Widget createTestApp() {
    return ProviderScope(
      overrides: [
        // AuthRepository 모의 객체로 대체
        authRemoteDataSourceProvider.overrideWithValue(
          mockAuthRemoteDataSource,
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        scaffoldMessengerKey: GlobalKey<ScaffoldMessengerState>(),
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
      ),
    );
  }

  group('로그인 화면 통합 테스트', () {
    testWidgets('로그인 화면이 올바르게 렌더링되는지 테스트', (WidgetTester tester) async {
      // 테스트 앱 빌드
      await tester.pumpWidget(createTestApp());
      await tester.pumpAndSettle();

      // 로그인 화면의 주요 요소들이 렌더링되었는지 확인
      expect(find.text('S-TEC 로그인'), findsOneWidget);
      expect(find.byType(AuthInputField), findsAtLeastNWidgets(2));
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text('로그인'), findsOneWidget);
    });

    testWidgets('빈 아이디/비밀번호 입력 시 유효성 검사 테스트', (WidgetTester tester) async {
      // 테스트 앱 빌드
      await tester.pumpWidget(createTestApp());
      await tester.pumpAndSettle();

      // 기존 텍스트 지우기
      final idField = find.descendant(
        of: find.byType(AuthInputField).first,
        matching: find.byType(TextField),
      );
      final pwField = find.descendant(
        of: find.byType(AuthInputField).last,
        matching: find.byType(TextField),
      );

      await tester.enterText(idField, '');
      await tester.enterText(pwField, '');

      // 로그인 버튼 찾기
      final loginButton = find.byType(ElevatedButton);

      // 빈 상태로 로그인 시도
      await tester.tap(loginButton);
      await tester.pump(); // 초기 프레임 업데이트
      await tester.pump(const Duration(seconds: 1)); // SnackBar 애니메이션 시간 확보

      // 에러 메시지 확인 (SnackBar에 표시됨)
      expect(find.byType(SnackBar), findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(SnackBar),
          matching: find.textContaining('아이디'),
        ),
        findsOneWidget,
      );

      // SnackBar 사라지기를 기다림
      await tester.pumpAndSettle(const Duration(seconds: 4));

      // 아이디만 입력
      await tester.enterText(idField, 'testuser');
      await tester.tap(loginButton);
      await tester.pump(); // 초기 프레임 업데이트
      await tester.pump(const Duration(seconds: 1)); // SnackBar 애니메이션 시간 확보

      // 비밀번호 에러 메시지 확인
      expect(find.byType(SnackBar), findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(SnackBar),
          matching: find.textContaining('비밀번호'),
        ),
        findsOneWidget,
      );
    });

    testWidgets('일반 사용자 로그인 성공 테스트', (WidgetTester tester) async {
      // 로그인 성공 응답 모킹
      final successResponse = BaseResponse<LoginResponseModel>(
        code: 200,
        message: '로그인 성공 (rule:USER)',
        data: LoginResponseModel(
          accessToken: 'mock_access_token',
          refreshToken: 'mock_refresh_token',
        ),
      );

      /// 실제 LoginApi를 실행하진 않고,
      /// 한 것 처럼 묘사 하며 리턴 값(successResponse)만 되돌려줌
      /// 그래서 AuthRepository의 Login함수에 BreakPoint를 걸어도 걸리지 않음.
      when(
        () => mockAuthRemoteDataSource.login(
          any(that: isA<String>()),
          any(that: isA<String>()),
          any(that: isA<String>()),
        ),
      ).thenAnswer((_) => Future.value(successResponse));

      // 테스트 앱 빌드
      await tester.pumpWidget(createTestApp());
      await tester.pumpAndSettle();

      // 로그인 정보 입력
      final idField = find.descendant(
        of: find.byType(AuthInputField).first,
        matching: find.byType(TextField),
      );
      final pwField = find.descendant(
        of: find.byType(AuthInputField).last,
        matching: find.byType(TextField),
      );

      await tester.enterText(idField, 'testuser');
      await tester.enterText(pwField, 'password123');

      // 로그인 버튼 탭
      await tester.tap(find.byType(ElevatedButton));

      // 로딩 상태 확인 (버튼 내부의 CircularProgressIndicator)
      await tester.pump();
      await tester.pump(
        const Duration(milliseconds: 100),
      ); // 상태 변화 감지를 위한 추가 시간

      // 로그인 성공 후 상태 확인
      await tester.pumpAndSettle();

      // 로그인 성공 후 리포지토리 호출 검증
      verify(
        () => mockAuthRemoteDataSource.login(
          any(that: isA<String>()),
          any(that: isA<String>()),
          any(that: isA<String>()),
        ),
      ).called(1);

      // 상태가 LoginStatusEnum.user로 변경되었는지 검증
      expect(find.byType(LoginView), findsNothing); // 다른 화면으로 이동했는지 확인
    });

    testWidgets('관리자 로그인 성공 테스트', (WidgetTester tester) async {
      // 관리자 로그인 성공 응답 모킹
      final managerResponse = BaseResponse<LoginResponseModel>(
        code: 100,
        message: '관리자 로그인 성공 (rule:ADMIN)',
        data: LoginResponseModel(
          accessToken: 'mock_access_token',
          refreshToken: 'mock_refresh_token',
        ),
      );

      when(
        () => mockAuthRemoteDataSource.login(
          any(that: isA<String>()),
          any(that: isA<String>()),
          any(that: isA<String>()),
        ),
      ).thenAnswer((_) => Future.value(managerResponse));

      // 테스트 앱 빌드
      await tester.pumpWidget(createTestApp());
      await tester.pumpAndSettle();

      // 로그인 정보 입력
      final idField = find.descendant(
        of: find.byType(AuthInputField).first,
        matching: find.byType(TextField),
      );
      final pwField = find.descendant(
        of: find.byType(AuthInputField).last,
        matching: find.byType(TextField),
      );

      await tester.enterText(idField, 'admin');
      await tester.enterText(pwField, 'admin123');

      // 로그인 버튼 탭
      await tester.tap(find.byType(ElevatedButton));

      // 로딩 상태 확인
      await tester.pump();
      await tester.pump(
        const Duration(milliseconds: 100),
      ); // 상태 변화 감지를 위한 추가 시간

      // CircularProgressIndicator 찾기
      final buttonFinder = find.byType(ElevatedButton);
      final button = tester.widget<ElevatedButton>(buttonFinder);

      // 버튼의 child가 CircularProgressIndicator를 포함하는지 확인
      expect(
        button.child is Stack || button.child is CircularProgressIndicator,
        true,
      );

      // 로그인 성공 후 상태 확인
      await tester.pumpAndSettle();

      // 로그인 성공 후 리포지토리 호출 검증
      verify(
        () => mockAuthRemoteDataSource.login(
          any(that: isA<String>()),
          any(that: isA<String>()),
          any(that: isA<String>()),
        ),
      ).called(1);

      // 상태가 LoginStatusEnum.manager로 변경되었는지 검증
      expect(find.byType(LoginView), findsNothing); // 다른 화면으로 이동했는지 확인
    });

    testWidgets('비밀번호 변경 요구 테스트', (WidgetTester tester) async {
      // 비밀번호 변경 요구 응답 모킹
      final changePwdResponse = BaseResponse<LoginResponseModel>(
        code: 201,
        message: '비밀번호 변경이 필요합니다',
        data: LoginResponseModel(
          accessToken: 'mock_access_token',
          refreshToken: 'mock_refresh_token',
        ),
      );

      /// 로그인 이후 결과 값을 모킹한 값으로 변경
      when(
        () => mockAuthRemoteDataSource.login(
          any(that: isA<String>()),
          any(that: isA<String>()),
          any(that: isA<String>()),
        ),
      ).thenAnswer((_) => Future.value(changePwdResponse));

      // 테스트 앱 빌드
      await tester.pumpWidget(createTestApp());
      await tester.pumpAndSettle();

      // 로그인 정보 입력
      final idField = find.descendant(
        of: find.byType(AuthInputField).first,
        matching: find.byType(TextField),
      );
      final pwField = find.descendant(
        of: find.byType(AuthInputField).last,
        matching: find.byType(TextField),
      );

      await tester.enterText(idField, 'testuser');
      await tester.enterText(pwField, 'password123');

      // 로그인 버튼 탭
      await tester.tap(find.byType(ElevatedButton));

      // 로딩 상태 확인
      await tester.pump();
      await tester.pump(
        const Duration(milliseconds: 100),
      ); // 상태 변화 감지를 위한 추가 시간

      // 로그인 성공 후 상태 확인
      await tester.pumpAndSettle();

      // 로그인 성공 후 리포지토리 호출 검증
      verify(
        () => mockAuthRemoteDataSource.login(
          any(that: isA<String>()),
          any(that: isA<String>()),
          any(that: isA<String>()),
        ),
      ).called(1);

      // 상태가 LoginStatusEnum.changePwd로 변경되었는지 검증
      // 비밀번호 변경 화면으로 이동했는지 확인
      expect(find.byType(PasswordChangeView), findsOneWidget);
    });

    testWidgets('로그인 실패 테스트', (WidgetTester tester) async {
      // 400 실패 응답 예시 (실제 구현과 맞게 error response 구조를 맞춰야 함)
      final mockLoginFailResponse = BaseResponse<LoginResponseModel>(
        code: 400,
        message: "비밀번호가 올바르지 않습니다",
        data: LoginResponseModel.empty(), // or null, 실제 구조 맞춤
      );
      when(
        () => mockAuthRemoteDataSource.login(
          any(that: isA<String>()),
          any(that: isA<String>()),
          any(that: isA<String>()),
        ),
      ).thenAnswer((_) => Future.value(mockLoginFailResponse));

      // 테스트 앱 빌드
      await tester.pumpWidget(createTestApp());
      await tester.pumpAndSettle();

      // 로그인 정보 입력
      final idField = find.descendant(
        of: find.byType(AuthInputField).first,
        matching: find.byType(TextField),
      );
      final pwField = find.descendant(
        of: find.byType(AuthInputField).last,
        matching: find.byType(TextField),
      );

      await tester.enterText(idField, 'wronguser');
      await tester.enterText(pwField, 'wrongpass');

      // 로그인 버튼 탭
      await tester.tap(find.byType(ElevatedButton));

      // 로딩 상태 확인
      await tester.pump();
      await tester.pump(
        const Duration(milliseconds: 100),
      ); // 상태 변화 감지를 위한 추가 시간

      // 로그인 실패 후 상태 확인 - SnackBar가 표시될 시간 확보
      await tester.pump(); // 프레임 업데이트
      await tester.pump(const Duration(seconds: 1)); // SnackBar 애니메이션 시간 충분히 확보

      // 에러 메시지 확인 (SnackBar에 표시됨)
      expect(find.byType(SnackBar), findsOneWidget);
      // 로그인 화면에 그대로 있는지 확인
      expect(find.byType(LoginView), findsOneWidget);
    });

    testWidgets('네트워크 오류 테스트', (WidgetTester tester) async {
      // 네트워크 오류 모킹
      when(
        () => mockAuthRemoteDataSource.login(any(), any(), any()),
      ).thenThrow(Exception('네트워크 연결 오류'));

      // 테스트 앱 빌드
      await tester.pumpWidget(createTestApp());
      await tester.pumpAndSettle();

      // 로그인 정보 입력
      final idField = find.descendant(
        of: find.byType(AuthInputField).first,
        matching: find.byType(TextField),
      );
      final pwField = find.descendant(
        of: find.byType(AuthInputField).last,
        matching: find.byType(TextField),
      );

      await tester.enterText(idField, 'testuser');
      await tester.enterText(pwField, 'password123');

      // 로그인 버튼 탭
      await tester.tap(find.byType(ElevatedButton));

      // 로딩 상태 확인
      await tester.pump();
      expect(
        find.descendant(
          of: find.byType(ElevatedButton),
          matching: find.byType(CircularProgressIndicator),
        ),
        findsOneWidget,
      );

      // 오류 발생 후 상태 확인 - SnackBar가 표시될 시간 확보
      await tester.pump(); // 프레임 업데이트
      await tester.pump(const Duration(seconds: 1)); // SnackBar 애니메이션 시간 충분히 확보

      // 에러 메시지 확인 (SnackBar에 표시됨)
      expect(find.byType(SnackBar), findsOneWidget);

      // 네트워크 오류 메시지 확인 - 텍스트 포함 여부 확인
      expect(find.byType(SnackBar), findsOneWidget);

      // 로그인 화면에 그대로 있는지 확인
      expect(find.byType(LoginView), findsOneWidget);
    });
  });
}

// ========================= 테스트 Return 객체 ==============================
final managerLoginResponse = BaseResponse<LoginResponseModel>(
  message: "로그인 성공(관리자)",
  code: 100,
  data: LoginResponseModel(
    accessToken: "AccessToken",
    refreshToken: "RefreshToken",
  ),
);

final userLoginResponse = BaseResponse<LoginResponseModel>(
  message: "로그인 성공(유저)",
  code: 200,
  data: LoginResponseModel(
    accessToken: "AccessToken",
    refreshToken: "RefreshToken",
  ),
);

final changePwdResponse = BaseResponse<LoginResponseModel>(
  message: "비밀번호 변경",
  code: 201,
  data: LoginResponseModel(
    accessToken: "AccessToken",
    refreshToken: "RefreshToken",
  ),
);

final errorJson = {
  "type": "https://tools.ietf.org/html/rfc9110#section-15.5.1",
  "title": "Bad Request",
  "status": 400,
  "traceId": "00-9635ba5ecf9643aa399be407768beb3e-37ee49ea8722bb91-01",
};

final dioError = DioException(
  requestOptions: RequestOptions(path: '/login'),
  response: Response(
    requestOptions: RequestOptions(path: '/login'),
    statusCode: 400,
    data: errorJson,
  ),
  type: DioExceptionType.badResponse,
);
// ========================= 테스트 Return 객체 ==============================
