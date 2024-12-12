import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FavoritesRecord extends FirestoreRecord {
  FavoritesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "SelfEsteemandSelfLove" field.
  bool? _selfEsteemandSelfLove;
  bool get selfEsteemandSelfLove => _selfEsteemandSelfLove ?? false;
  bool hasSelfEsteemandSelfLove() => _selfEsteemandSelfLove != null;

  // "HealthandWellness" field.
  bool? _healthandWellness;
  bool get healthandWellness => _healthandWellness ?? false;
  bool hasHealthandWellness() => _healthandWellness != null;

  // "SuccessandAchievement" field.
  bool? _successandAchievement;
  bool get successandAchievement => _successandAchievement ?? false;
  bool hasSuccessandAchievement() => _successandAchievement != null;

  // "Relationships" field.
  bool? _relationships;
  bool get relationships => _relationships ?? false;
  bool hasRelationships() => _relationships != null;

  // "AbundanceandProsperity" field.
  bool? _abundanceandProsperity;
  bool get abundanceandProsperity => _abundanceandProsperity ?? false;
  bool hasAbundanceandProsperity() => _abundanceandProsperity != null;

  // "PersonalGrowth" field.
  bool? _personalGrowth;
  bool get personalGrowth => _personalGrowth ?? false;
  bool hasPersonalGrowth() => _personalGrowth != null;

  // "Gratitude" field.
  bool? _gratitude;
  bool get gratitude => _gratitude ?? false;
  bool hasGratitude() => _gratitude != null;

  // "CreativityandInnovation" field.
  bool? _creativityandInnovation;
  bool get creativityandInnovation => _creativityandInnovation ?? false;
  bool hasCreativityandInnovation() => _creativityandInnovation != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _selfEsteemandSelfLove = snapshotData['SelfEsteemandSelfLove'] as bool?;
    _healthandWellness = snapshotData['HealthandWellness'] as bool?;
    _successandAchievement = snapshotData['SuccessandAchievement'] as bool?;
    _relationships = snapshotData['Relationships'] as bool?;
    _abundanceandProsperity = snapshotData['AbundanceandProsperity'] as bool?;
    _personalGrowth = snapshotData['PersonalGrowth'] as bool?;
    _gratitude = snapshotData['Gratitude'] as bool?;
    _creativityandInnovation = snapshotData['CreativityandInnovation'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('favorites')
          : FirebaseFirestore.instance.collectionGroup('favorites');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('favorites').doc(id);

  static Stream<FavoritesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FavoritesRecord.fromSnapshot(s));

  static Future<FavoritesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FavoritesRecord.fromSnapshot(s));

  static FavoritesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FavoritesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FavoritesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FavoritesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FavoritesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FavoritesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFavoritesRecordData({
  bool? selfEsteemandSelfLove,
  bool? healthandWellness,
  bool? successandAchievement,
  bool? relationships,
  bool? abundanceandProsperity,
  bool? personalGrowth,
  bool? gratitude,
  bool? creativityandInnovation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'SelfEsteemandSelfLove': selfEsteemandSelfLove,
      'HealthandWellness': healthandWellness,
      'SuccessandAchievement': successandAchievement,
      'Relationships': relationships,
      'AbundanceandProsperity': abundanceandProsperity,
      'PersonalGrowth': personalGrowth,
      'Gratitude': gratitude,
      'CreativityandInnovation': creativityandInnovation,
    }.withoutNulls,
  );

  return firestoreData;
}

class FavoritesRecordDocumentEquality implements Equality<FavoritesRecord> {
  const FavoritesRecordDocumentEquality();

  @override
  bool equals(FavoritesRecord? e1, FavoritesRecord? e2) {
    return e1?.selfEsteemandSelfLove == e2?.selfEsteemandSelfLove &&
        e1?.healthandWellness == e2?.healthandWellness &&
        e1?.successandAchievement == e2?.successandAchievement &&
        e1?.relationships == e2?.relationships &&
        e1?.abundanceandProsperity == e2?.abundanceandProsperity &&
        e1?.personalGrowth == e2?.personalGrowth &&
        e1?.gratitude == e2?.gratitude &&
        e1?.creativityandInnovation == e2?.creativityandInnovation;
  }

  @override
  int hash(FavoritesRecord? e) => const ListEquality().hash([
        e?.selfEsteemandSelfLove,
        e?.healthandWellness,
        e?.successandAchievement,
        e?.relationships,
        e?.abundanceandProsperity,
        e?.personalGrowth,
        e?.gratitude,
        e?.creativityandInnovation
      ]);

  @override
  bool isValidKey(Object? o) => o is FavoritesRecord;
}
