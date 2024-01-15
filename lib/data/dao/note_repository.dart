import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/model/note_model.dart';

class NoteRepository {
  final CollectionReference<Map<String, dynamic>> noteDB =
  FirebaseFirestore.instance.collection('Note');


  Future<List<NoteModel>> getAllNote() async {
    List<NoteModel> chatList = [];
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await noteDB.get();
      if (snapshot.docs.isNotEmpty) {
        chatList = snapshot.docs.map((e) => NoteModel.fromJson(e.data())).toList();
      }
    } catch (e) {
      print(e);
    }

    return chatList;
  }

  Future<void> updateNote({required NoteModel note}) async {
    try {
      await noteDB.doc(note.id).set(note.toJson());
    } catch (e) {
      print(e);
    }

  }

  Future<void> deleteNote({required String uuid}) async {
    try {
      await noteDB.doc(uuid).delete();
    } catch (e) {
      print(e);
    }
  }



}