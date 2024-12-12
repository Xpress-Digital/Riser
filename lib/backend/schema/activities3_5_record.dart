import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Activities35Record extends FirestoreRecord {
  Activities35Record._(
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

  // "Number" field.
  int? _number;
  int get number => _number ?? 0;
  bool hasNumber() => _number != null;

  void _initializeFields() {
    _activity = snapshotData['Activity'] as String?;
    _description = snapshotData['Description'] as String?;
    _number = castToType<int>(snapshotData['Number']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Activities3-5');

  static Stream<Activities35Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Activities35Record.fromSnapshot(s));

  static Future<Activities35Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Activities35Record.fromSnapshot(s));

  static Activities35Record fromSnapshot(DocumentSnapshot snapshot) =>
      Activities35Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Activities35Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Activities35Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Activities35Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Activities35Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActivities35RecordData({
  String? activity,
  String? description,
  int? number,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Activity': activity,
      'Description': description,
      'Number': number,
    }.withoutNulls,
  );

  return firestoreData;
}

class Activities35RecordDocumentEquality
    implements Equality<Activities35Record> {
  const Activities35RecordDocumentEquality();

  @override
  bool equals(Activities35Record? e1, Activities35Record? e2) {
    return e1?.activity == e2?.activity &&
        e1?.description == e2?.description &&
        e1?.number == e2?.number;
  }

  @override
  int hash(Activities35Record? e) =>
      const ListEquality().hash([e?.activity, e?.description, e?.number]);

  @override
  bool isValidKey(Object? o) => o is Activities35Record;
}
