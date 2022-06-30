import 'package:app_core/app_core.dart';
import 'package:mockito/annotations.dart';
import 'package:onboarding/src/domain/usecases/authentication_usecase.dart';

@GenerateMocks([
  AuthenticationUsecase,
  UserBloc,
])
void main() {}
