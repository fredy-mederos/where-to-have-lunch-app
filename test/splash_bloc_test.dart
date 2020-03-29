import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:where_to_have_lunch/domain/repository/user_repository.dart';
import 'package:where_to_have_lunch/ui/splash/splash_bloc.dart';

import 'mocks.dart';

void main() {

  final UserRepository mockRepo = UserRepositoryMockImpl();
  final SplashBloC splashBloC = SplashBloC(mockRepo);

  test('when the user is not null return is logged in', () async {
    when(mockRepo.currentUser()).thenAnswer((_) => Future(() => UserMock()));
    expect(true, await splashBloC.isLoggedIn());
  });

  test('when the user is null return is not logged in', () async {
    when(mockRepo.currentUser()).thenAnswer((_) => Future(() => null));
    expect(false, await splashBloC.isLoggedIn());
  });

}
