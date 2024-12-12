import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChildrenRecord extends FirestoreRecord {
  ChildrenRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "UserSpecifc_Affirmation" field.
  List<String>? _userSpecifcAffirmation;
  List<String> get userSpecifcAffirmation =>
      _userSpecifcAffirmation ?? const [];
  bool hasUserSpecifcAffirmation() => _userSpecifcAffirmation != null;

  // "sex" field.
  String? _sex;
  String get sex => _sex ?? '';
  bool hasSex() => _sex != null;

  // "age" field.
  String? _age;
  String get age => _age ?? '';
  bool hasAge() => _age != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "parentId" field.
  DocumentReference? _parentId;
  DocumentReference? get parentId => _parentId;
  bool hasParentId() => _parentId != null;

  // "last_listened_date" field.
  DateTime? _lastListenedDate;
  DateTime? get lastListenedDate => _lastListenedDate;
  bool hasLastListenedDate() => _lastListenedDate != null;

  // "current_streak" field.
  int? _currentStreak;
  int get currentStreak => _currentStreak ?? 0;
  bool hasCurrentStreak() => _currentStreak != null;

  // "Max_streak" field.
  int? _maxStreak;
  int get maxStreak => _maxStreak ?? 0;
  bool hasMaxStreak() => _maxStreak != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _userSpecifcAffirmation =
        getDataList(snapshotData['UserSpecifc_Affirmation']);
    _sex = snapshotData['sex'] as String?;
    _age = snapshotData['age'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _parentId = snapshotData['parentId'] as DocumentReference?;
    _lastListenedDate = snapshotData['last_listened_date'] as DateTime?;
    _currentStreak = castToType<int>(snapshotData['current_streak']);
    _maxStreak = castToType<int>(snapshotData['Max_streak']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Children');

  static Stream<ChildrenRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChildrenRecord.fromSnapshot(s));

  static Future<ChildrenRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChildrenRecord.fromSnapshot(s));

  static ChildrenRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChildrenRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChildrenRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChildrenRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChildrenRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChildrenRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChildrenRecordData({
  String? name,
  String? sex,
  String? age,
  String? photoUrl,
  DocumentReference? parentId,
  DateTime? lastListenedDate,
  int? currentStreak,
  int? maxStreak,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'sex': sex,
      'age': age,
      'photo_url': photoUrl,
      'parentId': parentId,
      'last_listened_date': lastListenedDate,
      'current_streak': currentStreak,
      'Max_streak': maxStreak,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChildrenRecordDocumentEquality implements Equality<ChildrenRecord> {
  const ChildrenRecordDocumentEquality();

  @override
  bool equals(ChildrenRecord? e1, ChildrenRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        listEquality.equals(
            e1?.userSpecifcAffirmation, e2?.userSpecifcAffirmation) &&
        e1?.sex == e2?.sex &&
        e1?.age == e2?.age &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.parentId == e2?.parentId &&
        e1?.lastListenedDate == e2?.lastListenedDate &&
        e1?.currentStreak == e2?.currentStreak &&
        e1?.maxStreak == e2?.maxStreak;
  }

  @override
  int hash(ChildrenRecord? e) => const ListEquality().hash([
        e?.name,
        e?.userSpecifcAffirmation,
        e?.sex,
        e?.age,
        e?.photoUrl,
        e?.parentId,
        e?.lastListenedDate,
        e?.currentStreak,
        e?.maxStreak
      ]);

  @override
  bool isValidKey(Object? o) => o is ChildrenRecord;
}
