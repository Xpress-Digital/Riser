import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AffirmationCollectionRecord extends FirestoreRecord {
  AffirmationCollectionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "Owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "sound" field.
  String? _sound;
  String get sound => _sound ?? '';
  bool hasSound() => _sound != null;

  void _initializeFields() {
    _title = snapshotData['Title'] as String?;
    _description = snapshotData['Description'] as String?;
    _image = snapshotData['Image'] as String?;
    _owner = snapshotData['Owner'] as DocumentReference?;
    _sound = snapshotData['sound'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Affirmation_Collection');

  static Stream<AffirmationCollectionRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => AffirmationCollectionRecord.fromSnapshot(s));

  static Future<AffirmationCollectionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AffirmationCollectionRecord.fromSnapshot(s));

  static AffirmationCollectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AffirmationCollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AffirmationCollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AffirmationCollectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AffirmationCollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AffirmationCollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAffirmationCollectionRecordData({
  String? title,
  String? description,
  String? image,
  DocumentReference? owner,
  String? sound,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Title': title,
      'Description': description,
      'Image': image,
      'Owner': owner,
      'sound': sound,
    }.withoutNulls,
  );

  return firestoreData;
}

class AffirmationCollectionRecordDocumentEquality
    implements Equality<AffirmationCollectionRecord> {
  const AffirmationCollectionRecordDocumentEquality();

  @override
  bool equals(
      AffirmationCollectionRecord? e1, AffirmationCollectionRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.image == e2?.image &&
        e1?.owner == e2?.owner &&
        e1?.sound == e2?.sound;
  }

  @override
  int hash(AffirmationCollectionRecord? e) => const ListEquality()
      .hash([e?.title, e?.description, e?.image, e?.owner, e?.sound]);

  @override
  bool isValidKey(Object? o) => o is AffirmationCollectionRecord;
}
