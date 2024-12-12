import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AffirmationRecord extends FirestoreRecord {
  AffirmationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  void _initializeFields() {
    _title = snapshotData['Title'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Affirmation');

  static Stream<AffirmationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AffirmationRecord.fromSnapshot(s));

  static Future<AffirmationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AffirmationRecord.fromSnapshot(s));

  static AffirmationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AffirmationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AffirmationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AffirmationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AffirmationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AffirmationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAffirmationRecordData({
  String? title,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Title': title,
    }.withoutNulls,
  );

  return firestoreData;
}

class AffirmationRecordDocumentEquality implements Equality<AffirmationRecord> {
  const AffirmationRecordDocumentEquality();

  @override
  bool equals(AffirmationRecord? e1, AffirmationRecord? e2) {
    return e1?.title == e2?.title;
  }

  @override
  int hash(AffirmationRecord? e) => const ListEquality().hash([e?.title]);

  @override
  bool isValidKey(Object? o) => o is AffirmationRecord;
}
