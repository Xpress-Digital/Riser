import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AffirmationCategoriesRecord extends FirestoreRecord {
  AffirmationCategoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Category_Description" field.
  String? _categoryDescription;
  String get categoryDescription => _categoryDescription ?? '';
  bool hasCategoryDescription() => _categoryDescription != null;

  // "Category_Image" field.
  String? _categoryImage;
  String get categoryImage => _categoryImage ?? '';
  bool hasCategoryImage() => _categoryImage != null;

  // "Category_title" field.
  List<String>? _categoryTitle;
  List<String> get categoryTitle => _categoryTitle ?? const [];
  bool hasCategoryTitle() => _categoryTitle != null;

  void _initializeFields() {
    _categoryDescription = snapshotData['Category_Description'] as String?;
    _categoryImage = snapshotData['Category_Image'] as String?;
    _categoryTitle = getDataList(snapshotData['Category_title']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Affirmation_Categories');

  static Stream<AffirmationCategoriesRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => AffirmationCategoriesRecord.fromSnapshot(s));

  static Future<AffirmationCategoriesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AffirmationCategoriesRecord.fromSnapshot(s));

  static AffirmationCategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AffirmationCategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AffirmationCategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AffirmationCategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AffirmationCategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AffirmationCategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAffirmationCategoriesRecordData({
  String? categoryDescription,
  String? categoryImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Category_Description': categoryDescription,
      'Category_Image': categoryImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class AffirmationCategoriesRecordDocumentEquality
    implements Equality<AffirmationCategoriesRecord> {
  const AffirmationCategoriesRecordDocumentEquality();

  @override
  bool equals(
      AffirmationCategoriesRecord? e1, AffirmationCategoriesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.categoryDescription == e2?.categoryDescription &&
        e1?.categoryImage == e2?.categoryImage &&
        listEquality.equals(e1?.categoryTitle, e2?.categoryTitle);
  }

  @override
  int hash(AffirmationCategoriesRecord? e) => const ListEquality()
      .hash([e?.categoryDescription, e?.categoryImage, e?.categoryTitle]);

  @override
  bool isValidKey(Object? o) => o is AffirmationCategoriesRecord;
}
