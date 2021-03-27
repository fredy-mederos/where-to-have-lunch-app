import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/subjects.dart';
import 'package:where_to_have_lunch/data/firebase/auth_repository_impl.dart';
import 'package:where_to_have_lunch/data/firebase/config_mapper.dart';
import 'package:where_to_have_lunch/data/firebase/firestore_api.dart';
import 'package:where_to_have_lunch/domain/models/configs.dart';
import 'package:where_to_have_lunch/domain/repository/configs_repository.dart';

class ConfigsRepositoryFirebaseImpl extends FirebaseAuthRepositoryImpl implements ConfigsRepository {
  final ConfigMapper configMapper;

  static const String USERS_COLLECTION = "users";

  FirestoreApi? _firestoreApi;

  // ignore: close_sinks
  final BehaviorSubject<Configs> configsController = BehaviorSubject.seeded(Configs(darkMode: false));

   StreamSubscription<DocumentSnapshot>? subscription;

  ConfigsRepositoryFirebaseImpl(this.configMapper);

  void loadData(FirestoreApi firestoreApi) async {
    try {
      String userId = await getUserId();
      subscription = firestoreApi.streamDocumentById(userId).listen((map) {
        final data = configMapper.configsFromMap(map.data() ?? {});
        configsController.sink.add(data);
      });
    } catch (ex) {}
  }

  @override
  Future<Configs> getConfigs() async {
    try {
      String userId = await getUserId();
      final map = await getApi().getDocumentById(userId);
      return configMapper.configsFromMap(map.data() ?? {});
    } catch (ex) {
      return Configs(darkMode: false);
    }
  }

  @override
  Future setDarkMode({required bool darkMode}) async {
    String userId = await getUserId();
    final config = Configs(darkMode: darkMode);
    await getApi().setData(
      configMapper.mapFromConfig(config),
      userId,
    );
  }

  Future<String> getUserId() async {
    String? userId = (await getAuth()).currentUser?.uid;
    if (userId == null) throw Exception("No User");
    return userId;
  }

  @override
  Stream<Configs> getConfigsStream() => configsController.stream;

  FirestoreApi getApi() {
    if (_firestoreApi != null) return _firestoreApi!;

    _firestoreApi = FirestoreApi(USERS_COLLECTION);
    loadData(_firestoreApi!);
    return _firestoreApi!;
  }

  @override
  Future logOut() async {
    _firestoreApi = null;
    subscription?.cancel();
  }
}
