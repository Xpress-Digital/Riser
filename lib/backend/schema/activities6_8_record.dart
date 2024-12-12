import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Activities68Record extends FirestoreRecord {
  Activities68Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Activity" field.
  String? _activity;
  String get activity => _activity ?? '';
  bool hasActivity() => _activity != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _activity = snapshotData['Activity'] as String?;
    _description = snapshotData['Description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Activities6-8');

  static Stream<Activities68Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Activities68Record.fromSnapshot(s));

  static Future<Activities68Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Activities68Record.fromSnapshot(s));

  static Activities68Record fromSnapshot(DocumentSnapshot snapshot) =>
      Activities68Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Activities68Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Activities68Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Activities68Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Activities68Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActivities68RecordData({
  String? activity,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Activity': activity,
      'Description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class Activities68RecordDocumentEquality
    implements Equality<Activities68Record> {
  const Activities68RecordDocumentEquality();

  @override
  bool equals(Activities68Record? e1, Activities68Record? e2) {
    return e1?.activity == e2?.activity && e1?.description == e2?.description;
  }

  @override
  int hash(Activities68Record? e) =>
      const ListEquality().hash([e?.activity, e?.description]);

  @override
  bool isValidKey(Object? o) => o is Activities68Record;
}
