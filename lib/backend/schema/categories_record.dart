import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriesRecord extends FirestoreRecord {
  CategoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Category_ref" field.
  DocumentReference? _categoryRef;
  DocumentReference? get categoryRef => _categoryRef;
  bool hasCategoryRef() => _categoryRef != null;

  // "Title_Image" field.
  String? _titleImage;
  String get titleImage => _titleImage ?? '';
  bool hasTitleImage() => _titleImage != null;

  // "Background_Image" field.
  String? _backgroundImage;
  String get backgroundImage => _backgroundImage ?? '';
  bool hasBackgroundImage() => _backgroundImage != null;

  // "title" field.
  List<String>? _title;
  List<String> get title => _title ?? const [];
  bool hasTitle() => _title != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _categoryRef = snapshotData['Category_ref'] as DocumentReference?;
    _titleImage = snapshotData['Title_Image'] as String?;
    _backgroundImage = snapshotData['Background_Image'] as String?;
    _title = getDataList(snapshotData['title']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Categories')
          : FirebaseFirestore.instance.collectionGroup('Categories');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Categories').doc(id);

  static Stream<CategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriesRecord.fromSnapshot(s));

  static Future<CategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoriesRecord.fromSnapshot(s));

  static CategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoriesRecordData({
  DocumentReference? categoryRef,
  String? titleImage,
  String? backgroundImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Category_ref': categoryRef,
      'Title_Image': titleImage,
      'Background_Image': backgroundImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoriesRecordDocumentEquality implements Equality<CategoriesRecord> {
  const CategoriesRecordDocumentEquality();

  @override
  bool equals(CategoriesRecord? e1, CategoriesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.categoryRef == e2?.categoryRef &&
        e1?.titleImage == e2?.titleImage &&
        e1?.backgroundImage == e2?.backgroundImage &&
        listEquality.equals(e1?.title, e2?.title);
  }

  @override
  int hash(CategoriesRecord? e) => const ListEquality()
      .hash([e?.categoryRef, e?.titleImage, e?.backgroundImage, e?.title]);

  @override
  bool isValidKey(Object? o) => o is CategoriesRecord;
}
