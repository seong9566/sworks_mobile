import 'package:sworks_mobile/features/auth/data/models/login_response_model.dart';
import 'package:sworks_mobile/network/base_response.dart';

abstract class AuthRemoteDataSource {
  Future<BaseResponse<LoginResponseModel>> login(
    String userId,
    String userPassword,
    String fcmToken,
  );
}
