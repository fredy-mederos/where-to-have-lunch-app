import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreApi {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  late CollectionReference<Map<String,dynamic>> ref;

  FirestoreApi(String path) {
    ref = _db.collection(path);
  }

  Future<QuerySnapshot<Map<String,dynamic>>> getDataCollection() {
    return ref.get();
  }

  Stream<QuerySnapshot<Map<String,dynamic>>> streamDataCollection() {
    return ref.snapshots();
  }

  Future<DocumentSnapshot<Map<String,dynamic>>> getDocumentById(String id) {
    return ref.doc(id).get();
  }

  Stream<DocumentSnapshot<Map<String,dynamic>>> streamDocumentById(String id) {
    return ref.doc(id).snapshots();
  }

  Future<void> removeDocument(String id) {
    return ref.doc(id).delete();
  }

  Future<DocumentReference<Map<String,dynamic>>> addDocument(Map<String, dynamic> data) {
    return ref.add(data);
  }

  Future<void> updateDocument(Map<String, dynamic> data, String id) {
    return ref.doc(id).update(data);
  }

  Future<void> setData(Map<String, dynamic> data, String id) {
    return ref.doc(id).set(data);
  }
}
