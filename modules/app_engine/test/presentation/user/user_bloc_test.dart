import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_engine/src/presentation/user/bloc/user_bloc.dart';

import '../../helper/data_models.dart';


void main() {
  late UserBloc userBloc;

  setUp(() {
    userBloc = UserBloc();
  });

  test('initial state should be empty', () {
    expect(userBloc.state is UserInitial, true);
  });

  blocTest<UserBloc, UserState>(
    'should emit [UserLoadedInformation] '
    'when user loaded infomation is successfully',
    build: () {
      return userBloc;
    },
    act: (bloc) => bloc.add(LoadUserEvent(user)),
    expect: () => [
      UserLoadedInformation(user),
    ],
  );
}
