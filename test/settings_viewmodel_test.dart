import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:where_to_have_lunch/domain/repository/configs_repository.dart';
import 'package:where_to_have_lunch/domain/repository/place_repository.dart';
import 'package:where_to_have_lunch/domain/repository/user_repository.dart';
import 'package:where_to_have_lunch/ui/settings/settings_viewmodel.dart';

import 'mocks.dart';

void main() {
  final UserRepository userRepositoryMock = UserRepositoryMockImpl();
  final PlaceRepository placeRepositoryMock = PlaceRepositoryMockImpl();
  final ConfigsRepository configsRepositoryMock = ConfigsRepositoryMockImpl();

  final settingsViewModel = SettingsViewModel(userRepositoryMock, placeRepositoryMock, configsRepositoryMock);

  test('when user logs out clear the data', () async {
    // ignore: await_only_futures
    await settingsViewModel.logout();

    verify(userRepositoryMock.logOut());
    verify(placeRepositoryMock.logOut());
    verify(configsRepositoryMock.logOut());
  });

  test('provide current user when loading it', () async {
    final currentUser = UserMock();
    when(userRepositoryMock.currentUser()).thenAnswer((_) => Future(() => currentUser));

    settingsViewModel.loadCurrentUser();
    settingsViewModel.currentUserStream.listen(expectAsync1((user) {
      expect(user, currentUser);
    }));
  });
}
