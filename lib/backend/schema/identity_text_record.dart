import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IdentityTextRecord extends FirestoreRecord {
  IdentityTextRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "affirmation" field.
  String? _affirmation;
  String get affirmation => _affirmation ?? '';
  bool hasAffirmation() => _affirmation != null;

  void _initializeFields() {
    _affirmation = snapshotData['affirmation'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('identity_text');

  static Stream<IdentityTextRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IdentityTextRecord.fromSnapshot(s));

  static Future<IdentityTextRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IdentityTextRecord.fromSnapshot(s));

  static IdentityTextRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IdentityTextRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IdentityTextRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IdentityTextRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IdentityTextRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IdentityTextRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIdentityTextRecordData({
  String? affirmation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'affirmation': affirmation,
    }.withoutNulls,
  );

  return firestoreData;
}

class IdentityTextRecordDocumentEquality
    implements Equality<IdentityTextRecord> {
  const IdentityTextRecordDocumentEquality();

  @override
  bool equals(IdentityTextRecord? e1, IdentityTextRecord? e2) {
    return e1?.affirmation == e2?.affirmation;
  }

  @override
  int hash(IdentityTextRecord? e) =>
      const ListEquality().hash([e?.affirmation]);

  @override
  bool isValidKey(Object? o) => o is IdentityTextRecord;
}
