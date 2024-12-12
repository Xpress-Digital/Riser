import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Activities912Record extends FirestoreRecord {
  Activities912Record._(
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
      FirebaseFirestore.instance.collection('Activities9-12');

  static Stream<Activities912Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Activities912Record.fromSnapshot(s));

  static Future<Activities912Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Activities912Record.fromSnapshot(s));

  static Activities912Record fromSnapshot(DocumentSnapshot snapshot) =>
      Activities912Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Activities912Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Activities912Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Activities912Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Activities912Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActivities912RecordData({
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

class Activities912RecordDocumentEquality
    implements Equality<Activities912Record> {
  const Activities912RecordDocumentEquality();

  @override
  bool equals(Activities912Record? e1, Activities912Record? e2) {
    return e1?.activity == e2?.activity && e1?.description == e2?.description;
  }

  @override
  int hash(Activities912Record? e) =>
      const ListEquality().hash([e?.activity, e?.description]);

  @override
  bool isValidKey(Object? o) => o is Activities912Record;
}
