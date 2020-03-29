import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:where_to_have_lunch/domain/repository/place_repository.dart';
import 'package:where_to_have_lunch/domain/repository/user_repository.dart';
import 'package:where_to_have_lunch/ui/settings/settings_bloc.dart';

import 'mocks.dart';

void main() {
  final UserRepository userRepositoryMock = UserRepositoryMockImpl();
  final PlaceRepository placeRepositoryMock = PlaceRepositoryMockImpl();

  final settingsBloc = SettingsBloC(userRepositoryMock, placeRepositoryMock);

  test('when user logs out clear the data', () async {
    // ignore: await_only_futures
    await settingsBloc.logout();

    verify(userRepositoryMock.logOut());
    verify(placeRepositoryMock.logOut());
  });

  test('provide current user when loading it', () async {
    final currentUser = UserMock();
    when(userRepositoryMock.currentUser())
        .thenAnswer((_) => Future(() => currentUser));

    settingsBloc.loadCurrentUser();
    settingsBloc.currentUserStream.listen(expectAsync1((user) {
      expect(user, currentUser);
    }));
  });
}
