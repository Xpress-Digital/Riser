import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AffirmationsRecord extends FirestoreRecord {
  AffirmationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  bool hasAudio() => _audio != null;

  // "categoryRef" field.
  DocumentReference? _categoryRef;
  DocumentReference? get categoryRef => _categoryRef;
  bool hasCategoryRef() => _categoryRef != null;

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _audio = snapshotData['audio'] as String?;
    _categoryRef = snapshotData['categoryRef'] as DocumentReference?;
    _title = snapshotData['Title'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Affirmations')
          : FirebaseFirestore.instance.collectionGroup('Affirmations');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Affirmations').doc(id);

  static Stream<AffirmationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AffirmationsRecord.fromSnapshot(s));

  static Future<AffirmationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AffirmationsRecord.fromSnapshot(s));

  static AffirmationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AffirmationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AffirmationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AffirmationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AffirmationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AffirmationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAffirmationsRecordData({
  String? audio,
  DocumentReference? categoryRef,
  String? title,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'audio': audio,
      'categoryRef': categoryRef,
      'Title': title,
    }.withoutNulls,
  );

  return firestoreData;
}

class AffirmationsRecordDocumentEquality
    implements Equality<AffirmationsRecord> {
  const AffirmationsRecordDocumentEquality();

  @override
  bool equals(AffirmationsRecord? e1, AffirmationsRecord? e2) {
    return e1?.audio == e2?.audio &&
        e1?.categoryRef == e2?.categoryRef &&
        e1?.title == e2?.title;
  }

  @override
  int hash(AffirmationsRecord? e) =>
      const ListEquality().hash([e?.audio, e?.categoryRef, e?.title]);

  @override
  bool isValidKey(Object? o) => o is AffirmationsRecord;
}
