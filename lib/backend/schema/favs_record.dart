import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FavsRecord extends FirestoreRecord {
  FavsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Affirmations" field.
  bool? _affirmations;
  bool get affirmations => _affirmations ?? false;
  bool hasAffirmations() => _affirmations != null;

  // "ref" field.
  DocumentReference? _ref;
  DocumentReference? get ref => _ref;
  bool hasRef() => _ref != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _affirmations = snapshotData['Affirmations'] as bool?;
    _ref = snapshotData['ref'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Favs')
          : FirebaseFirestore.instance.collectionGroup('Favs');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Favs').doc(id);

  static Stream<FavsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FavsRecord.fromSnapshot(s));

  static Future<FavsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FavsRecord.fromSnapshot(s));

  static FavsRecord fromSnapshot(DocumentSnapshot snapshot) => FavsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FavsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FavsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FavsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FavsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFavsRecordData({
  bool? affirmations,
  DocumentReference? ref,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Affirmations': affirmations,
      'ref': ref,
    }.withoutNulls,
  );

  return firestoreData;
}

class FavsRecordDocumentEquality implements Equality<FavsRecord> {
  const FavsRecordDocumentEquality();

  @override
  bool equals(FavsRecord? e1, FavsRecord? e2) {
    return e1?.affirmations == e2?.affirmations && e1?.ref == e2?.ref;
  }

  @override
  int hash(FavsRecord? e) =>
      const ListEquality().hash([e?.affirmations, e?.ref]);

  @override
  bool isValidKey(Object? o) => o is FavsRecord;
}
