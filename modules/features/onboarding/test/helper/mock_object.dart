import 'package:app_engine/app_engine.dart';
import 'package:mockito/annotations.dart';
import 'package:onboarding/src/domain/usecases/authentication_usecase.dart';

@GenerateMocks([
  AuthenticationUsecase,
  UserBloc,
])
void main() {}
