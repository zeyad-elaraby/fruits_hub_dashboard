import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? uId,
  }) async {
    if (uId != null) {
      await firestore.collection(path).doc(uId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async {
    if (documentId != null) {
      var data = await firestore.collection(path).doc(documentId).get();
      return data.data();
    } else {
      //get all data
      Query<Map<String, dynamic>> data = firestore.collection(path);
      if (query != null) {
        if (query['orderBy'] != null && query['orderType'] != null) {
          var orderByField = query['orderBy'];
          var orderType = query['orderType'];
          data = data.orderBy(orderByField, descending: orderType == 'desc');
        }
        if (query['limit'] != null) {
          data = data.limit(query['limit']);
        }
      }
      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> checkIfDataExists({
    required String path,
    required String documentId,
  }) async {
    var data = await firestore.collection(path).doc(documentId).get();

    return data.exists;
  }

  @override
  Stream<dynamic> getStreamData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async* {
    if (documentId != null) {
      await for (var data
          in firestore.collection(path).doc(documentId).snapshots()) {
        yield data.data();
      }
    } else {
      //get all data
      Query<Map<String, dynamic>> data = firestore.collection(path);
      if (query != null) {
        if (query['orderBy'] != null && query['orderType'] != null) {
          var orderByField = query['orderBy'];
          var orderType = query['orderType'];
          data = data.orderBy(orderByField, descending: orderType == 'desc');
        }
        if (query['limit'] != null) {
          data = data.limit(query['limit']);
        }
      }
      await for (var result in data.snapshots()) {
        yield result.docs.map((e) => e.data()).toList();
      }
    }
  }

  @override
  Future<void> updateData({
    required String path,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    await firestore.collection(path).doc(documentId).update(data);
  }
}
