import 'package:mockito/mockito.dart';
import 'package:where_to_have_lunch/domain/models/user.dart';
import 'package:where_to_have_lunch/domain/repository/place_repository.dart';
import 'package:where_to_have_lunch/domain/repository/user_repository.dart';

class UserRepositoryMockImpl extends Mock implements UserRepository {}

class PlaceRepositoryMockImpl extends Mock implements PlaceRepository {}

class UserMock extends Mock implements User {}

