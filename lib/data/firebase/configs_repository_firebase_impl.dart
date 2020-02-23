import 'package:firebase_auth/firebase_auth.dart';
import 'package:where_to_have_lunch/data/firebase/config_mapper.dart';
import 'package:where_to_have_lunch/data/firebase/firestore_api.dart';
import 'package:where_to_have_lunch/domain/models/configs.dart';
import 'package:where_to_have_lunch/domain/repository/configs_repository.dart';

class ConfigsRepositoryFirebaseImpl implements ConfigsRepository {
  final ConfigMapper configMapper;

  static const String USERS_COLLECTION = "users";

  FirestoreApi firestoreApi = FirestoreApi(USERS_COLLECTION);
  final FirebaseAuth auth = FirebaseAuth.instance;

  ConfigsRepositoryFirebaseImpl(this.configMapper);

  @override
  Future<Configs> getConfigs() async {
    try {
      String userId = await getUserId();
      final map = await firestoreApi.getDocumentById(userId);
      return configMapper.configsFromMap(map.data ?? {}) ??
          Configs(darkMode: false);
    } catch (ex) {
      return Configs(darkMode: false);
    }
  }

  @override
  Future setDarkMode({bool darkMode}) async {
    String userId = await getUserId();
    final config = await getConfigs();
    config.darkMode = darkMode;
    await firestoreApi.setData(
      configMapper.mapFromConfig(config),
      userId,
    );
  }

  Future<String> getUserId() async {
    String userId = (await auth.currentUser())?.uid;
    if (userId == null) throw Exception("No User");
    return userId;
  }
}
