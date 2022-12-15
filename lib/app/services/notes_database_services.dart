
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/auth_model/user_data.dart';
import '../models/notes_model.dart';

class NotesFirestoreService{

  FirebaseFirestore fireStore = FirebaseFirestore.instance;


  Future<void> addUser(UserData user) async {
    await fireStore.collection("users").doc(user.uid).set(user.toJson());
  }

  Future<UserData> getUser(String uid) async {
    final doc = await fireStore.collection("users").doc(uid).get();
    return UserData.fromJson(doc.data()!);
  }

  Future<QuerySnapshot> getUserInfo(String username) async {
    return await fireStore
        .collection("users")
        .where("uid", isEqualTo: username)
        .get();
  }

  Future<void> addNotes(Notes notes)async{
    final docId = fireStore.collection("notes").doc().id;
    Notes note = notes.copyWith(id: docId);
    await fireStore.collection("notes").doc(docId).set(note.toJson());
  }

  Future<void> deleteNotes(String id)async{
    return await fireStore.collection("notes").doc(id).delete();
  }

  Stream<List<Notes>> getAllNotes(String userId){
    log(userId);
    return fireStore
        .collection("notes")
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((querySnapshot) =>
        querySnapshot.docs
            .map((queryDocSnapshot) => Notes.fromJson(queryDocSnapshot.data()))
            .toList());
  }

  Future updateNotes(Notes notes) {

    return fireStore
        .collection("notes")
        .doc(notes.id)
        .update(notes.toJson());

  }

}