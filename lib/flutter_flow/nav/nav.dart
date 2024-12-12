import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : OnboardingWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : OnboardingWidget(),
        ),
        FFRoute(
          name: 'Home',
          path: '/home',
          builder: (context, params) =>
              params.isEmpty ? NavBarPage(initialPage: 'Home') : HomeWidget(),
        ),
        FFRoute(
          name: 'Play_Affirmation',
          path: '/playAffirmation',
          builder: (context, params) => PlayAffirmationWidget(
            playAffirmationRef: params.getParam(
              'playAffirmationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Affirmation_Categories'],
            ),
          ),
        ),
        FFRoute(
          name: 'Onboarding',
          path: '/onboarding',
          builder: (context, params) => OnboardingWidget(),
        ),
        FFRoute(
          name: 'Onboarding1',
          path: '/onboarding1',
          builder: (context, params) => Onboarding1Widget(),
        ),
        FFRoute(
          name: 'signUp',
          path: '/signUp',
          builder: (context, params) => SignUpWidget(),
        ),
        FFRoute(
          name: 'ForgotPassword',
          path: '/forgotPassword',
          builder: (context, params) => ForgotPasswordWidget(),
        ),
        FFRoute(
          name: 'onboardingCompleted',
          path: '/onboardingCompleted',
          builder: (context, params) => OnboardingCompletedWidget(),
        ),
        FFRoute(
          name: 'testimonials',
          path: '/testimonials',
          builder: (context, params) => TestimonialsWidget(),
        ),
        FFRoute(
          name: 'MainProfile',
          path: '/mainProfile',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'MainProfile')
              : MainProfileWidget(
                  user: params.getParam(
                    'user',
                    ParamType.DocumentReference,
                    isList: false,
                    collectionNamePath: ['user'],
                  ),
                  childrenRef: params.getParam(
                    'childrenRef',
                    ParamType.DocumentReference,
                    isList: false,
                    collectionNamePath: ['Children'],
                  ),
                ),
        ),
        FFRoute(
          name: 'signIn',
          path: '/signIn',
          builder: (context, params) => SignInWidget(),
        ),
        FFRoute(
          name: 'welcome',
          path: '/welcome',
          builder: (context, params) => WelcomeWidget(),
        ),
        FFRoute(
          name: 'compleete_profile',
          path: '/compleeteProfile',
          builder: (context, params) => CompleeteProfileWidget(),
        ),
        FFRoute(
          name: 'Kids_Profile_Setup1',
          path: '/kidsProfileSetup1',
          builder: (context, params) => KidsProfileSetup1Widget(
            userRef: params.getParam(
              'userRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['user'],
            ),
          ),
        ),
        FFRoute(
          name: 'Affirmations',
          path: '/affirmations',
          builder: (context, params) => AffirmationsWidget(
            childrenRef: params.getParam(
              'childrenRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Children'],
            ),
            favoriteRef: params.getParam(
              'favoriteRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['user'],
            ),
          ),
        ),
        FFRoute(
          name: 'settings',
          path: '/settings',
          builder: (context, params) => SettingsWidget(),
        ),
        FFRoute(
          name: 'Alarm',
          path: '/alarm',
          builder: (context, params) => AlarmWidget(
            affirmationRef: params.getParam(
              'affirmationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Affirmation_Collection'],
            ),
            childaffirmationRef: params.getParam(
              'childaffirmationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Children'],
            ),
          ),
        ),
        FFRoute(
          name: 'Home02ListCopy',
          path: '/home02ListCopy',
          builder: (context, params) => Home02ListCopyWidget(),
        ),
        FFRoute(
          name: 'Kid_PROFILE',
          path: '/kidPROFILE',
          builder: (context, params) => KidPROFILEWidget(
            childRef: params.getParam(
              'childRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Children'],
            ),
          ),
        ),
        FFRoute(
          name: 'Riser_Affirmation',
          path: '/riserAffirmation',
          builder: (context, params) => RiserAffirmationWidget(),
        ),
        FFRoute(
          name: 'Affirmation_categories',
          path: '/affirmationCategories',
          builder: (context, params) => AffirmationCategoriesWidget(
            riseraffirmationRef: params.getParam(
              'riseraffirmationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Affirmation_Categories'],
            ),
            affirmationRef: params.getParam(
              'affirmationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Affirmation_Collection'],
            ),
          ),
        ),
        FFRoute(
          name: 'update_profile',
          path: '/updateProfile',
          builder: (context, params) => UpdateProfileWidget(
            userprofile: params.getParam(
              'userprofile',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['user'],
            ),
          ),
        ),
        FFRoute(
          name: 'FavoriteAffirmations',
          path: '/favoriteAffirmations',
          builder: (context, params) => FavoriteAffirmationsWidget(
            affirmationRef: params.getParam(
              'affirmationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Affirmation_Collection'],
            ),
          ),
        ),
        FFRoute(
          name: 'profile_confirmationpage',
          path: '/profileConfirmationpage',
          builder: (context, params) => ProfileConfirmationpageWidget(
            kidsRef: params.getParam(
              'kidsRef',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'editKidsProfile',
          path: '/editKidsProfile',
          builder: (context, params) => EditKidsProfileWidget(
            kidsRef: params.getParam(
              'kidsRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Children'],
            ),
          ),
        ),
        FFRoute(
          name: 'Alarms',
          path: '/alarms',
          builder: (context, params) => AlarmsWidget(
            affirmationRef: params.getParam(
              'affirmationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Affirmation_Collection'],
            ),
            ownerRef: params.getParam(
              'ownerRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Children', 'Alarm'],
            ),
          ),
        ),
        FFRoute(
          name: 'subscriptionpage',
          path: '/subscriptionpage',
          builder: (context, params) => SubscriptionpageWidget(),
        ),
        FFRoute(
          name: 'AudioPlayer_identity',
          path: '/audioPlayerIdentity',
          builder: (context, params) => AudioPlayerIdentityWidget(
            identityRef: params.getParam(
              'identityRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Identity'],
            ),
          ),
        ),
        FFRoute(
          name: 'RecordYourAffirmation',
          path: '/recordYourAffirmation',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'RecordYourAffirmation')
              : RecordYourAffirmationWidget(),
        ),
        FFRoute(
          name: 'feedBack',
          path: '/feedBack',
          builder: (context, params) => FeedBackWidget(
            userRef: params.getParam(
              'userRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['user'],
            ),
          ),
        ),
        FFRoute(
          name: 'KidsList',
          path: '/kidsList',
          builder: (context, params) => KidsListWidget(),
        ),
        FFRoute(
          name: 'profile_confirmationpage2',
          path: '/profileConfirmationpage2',
          builder: (context, params) => ProfileConfirmationpage2Widget(
            kidsRef: params.getParam(
              'kidsRef',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'profile_confirmationpage3',
          path: '/profileConfirmationpage3',
          builder: (context, params) => ProfileConfirmationpage3Widget(
            kidsRef: params.getParam(
              'kidsRef',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'new_kids_profile',
          path: '/newKidsProfile',
          builder: (context, params) => NewKidsProfileWidget(
            childRef: params.getParam(
              'childRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Children'],
            ),
          ),
        ),
        FFRoute(
          name: 'interimhomepage',
          path: '/interimhomepage',
          builder: (context, params) => InterimhomepageWidget(),
        ),
        FFRoute(
          name: 'music_player_2',
          path: '/musicPlayer2',
          builder: (context, params) => MusicPlayer2Widget(),
        ),
        FFRoute(
          name: 'daily_affirmations',
          path: '/dailyAffirmations',
          builder: (context, params) => DailyAffirmationsWidget(),
        ),
        FFRoute(
          name: 'alarmpage2',
          path: '/alarmpage2',
          builder: (context, params) => Alarmpage2Widget(),
        ),
        FFRoute(
          name: 'SexualityandGenderIdeologies',
          path: '/sexualityandGenderIdeologies',
          builder: (context, params) => SexualityandGenderIdeologiesWidget(),
        ),
        FFRoute(
          name: 'DailyActivities',
          path: '/dailyActivities',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'DailyActivities')
              : DailyActivitiesWidget(),
        ),
        FFRoute(
          name: 'ResponsibilityandIndependence',
          path: '/responsibilityandIndependence',
          builder: (context, params) => ResponsibilityandIndependenceWidget(),
        ),
        FFRoute(
          name: 'CreativityandImagination',
          path: '/creativityandImagination',
          builder: (context, params) => CreativityandImaginationWidget(),
        ),
        FFRoute(
          name: 'GratitudeandAppreciation',
          path: '/gratitudeandAppreciation',
          builder: (context, params) => GratitudeandAppreciationWidget(),
        ),
        FFRoute(
          name: 'Group1',
          path: '/group1',
          builder: (context, params) => Group1Widget(),
        ),
        FFRoute(
          name: 'signInCopy',
          path: '/signInCopy',
          builder: (context, params) => SignInCopyWidget(),
        ),
        FFRoute(
          name: 'IdentitySelfWorthCopy',
          path: '/identitySelfWorthCopy',
          builder: (context, params) => IdentitySelfWorthCopyWidget(
            favRef: params.getParam(
              'favRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Children', 'Favs'],
            ),
          ),
        ),
        FFRoute(
          name: 'ConfidenceandSelf-Esteem',
          path: '/confidenceandSelfEsteem',
          builder: (context, params) => ConfidenceandSelfEsteemWidget(),
        ),
        FFRoute(
          name: 'AudioPlayer_Confidence',
          path: '/audioPlayerConfidence',
          asyncParams: {
            'child': getDoc(['Children'], ChildrenRecord.fromSnapshot),
          },
          builder: (context, params) => AudioPlayerConfidenceWidget(
            confidenceRef: params.getParam(
              'confidenceRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Confidence'],
            ),
            child: params.getParam(
              'child',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'AudioPlayer_Academic',
          path: '/audioPlayerAcademic',
          builder: (context, params) => AudioPlayerAcademicWidget(
            academic: params.getParam(
              'academic',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Academics'],
            ),
          ),
        ),
        FFRoute(
          name: 'Academic',
          path: '/academic',
          builder: (context, params) => AcademicWidget(),
        ),
        FFRoute(
          name: 'AudioPlayer_sexuality',
          path: '/audioPlayerSexuality',
          builder: (context, params) => AudioPlayerSexualityWidget(
            sexualityRef: params.getParam(
              'sexualityRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Sexuality'],
            ),
          ),
        ),
        FFRoute(
          name: 'Sexualit',
          path: '/sexualit',
          builder: (context, params) => SexualitWidget(),
        ),
        FFRoute(
          name: 'sexuality',
          path: '/sexuality',
          builder: (context, params) => SexualityWidget(),
        ),
        FFRoute(
          name: 'Kids_Profile_Setup2',
          path: '/kidsProfileSetup2',
          builder: (context, params) => KidsProfileSetup2Widget(
            userRef: params.getParam(
              'userRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['user'],
            ),
          ),
        ),
        FFRoute(
          name: 'Kids_Profile_Setup3',
          path: '/kidsProfileSetup3',
          builder: (context, params) => KidsProfileSetup3Widget(
            userRef: params.getParam(
              'userRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['user'],
            ),
          ),
        ),
        FFRoute(
          name: 'Emotions',
          path: '/emotions',
          builder: (context, params) => EmotionsWidget(),
        ),
        FFRoute(
          name: 'AudioPlayer_emotions',
          path: '/audioPlayerEmotions',
          builder: (context, params) => AudioPlayerEmotionsWidget(
            emotions: params.getParam(
              'emotions',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Emotions'],
            ),
          ),
        ),
        FFRoute(
          name: 'positivity',
          path: '/positivity',
          builder: (context, params) => PositivityWidget(),
        ),
        FFRoute(
          name: 'Kindness',
          path: '/kindness',
          builder: (context, params) => KindnessWidget(),
        ),
        FFRoute(
          name: 'Responsibility',
          path: '/responsibility',
          builder: (context, params) => ResponsibilityWidget(),
        ),
        FFRoute(
          name: 'Respect',
          path: '/respect',
          builder: (context, params) => RespectWidget(),
        ),
        FFRoute(
          name: 'Gratitude',
          path: '/gratitude',
          builder: (context, params) => GratitudeWidget(),
        ),
        FFRoute(
          name: 'AudioPlayer_gratitude',
          path: '/audioPlayerGratitude',
          builder: (context, params) => AudioPlayerGratitudeWidget(
            gratitude: params.getParam(
              'gratitude',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Gratitude'],
            ),
          ),
        ),
        FFRoute(
          name: 'AudioPlayer_respect',
          path: '/audioPlayerRespect',
          builder: (context, params) => AudioPlayerRespectWidget(
            respect: params.getParam(
              'respect',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Respect'],
            ),
          ),
        ),
        FFRoute(
          name: 'AudioPlayer_responsibility',
          path: '/audioPlayerResponsibility',
          builder: (context, params) => AudioPlayerResponsibilityWidget(
            responsibility: params.getParam(
              'responsibility',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Responsibility'],
            ),
          ),
        ),
        FFRoute(
          name: 'AudioPlayer_kindness',
          path: '/audioPlayerKindness',
          builder: (context, params) => AudioPlayerKindnessWidget(
            kindness: params.getParam(
              'kindness',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Kindness'],
            ),
          ),
        ),
        FFRoute(
          name: 'AudioPlayer_positivity',
          path: '/audioPlayerPositivity',
          builder: (context, params) => AudioPlayerPositivityWidget(
            positivity: params.getParam(
              'positivity',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Positivity'],
            ),
          ),
        ),
        FFRoute(
          name: 'AudioPlayer_emotionsCopy',
          path: '/audioPlayerEmotionsCopy',
          builder: (context, params) => AudioPlayerEmotionsCopyWidget(
            emotions: params.getParam(
              'emotions',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Emotions'],
            ),
          ),
        ),
        FFRoute(
          name: 'creativity',
          path: '/creativity',
          builder: (context, params) => CreativityWidget(),
        ),
        FFRoute(
          name: 'AudioPlayer_creativity',
          path: '/audioPlayerCreativity',
          builder: (context, params) => AudioPlayerCreativityWidget(
            creativity: params.getParam(
              'creativity',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Creativity'],
            ),
          ),
        ),
        FFRoute(
          name: 'Alarm_identity',
          path: '/alarmIdentity',
          builder: (context, params) => AlarmIdentityWidget(
            affirmationRef: params.getParam(
              'affirmationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Affirmation_Collection'],
            ),
            childaffirmationRef: params.getParam(
              'childaffirmationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Children'],
            ),
            identity: params.getParam(
              'identity',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Identity'],
            ),
          ),
        ),
        FFRoute(
          name: 'Alarm_confidence',
          path: '/alarmConfidence',
          builder: (context, params) => AlarmConfidenceWidget(
            affirmationRef: params.getParam(
              'affirmationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Affirmation_Collection'],
            ),
            childaffirmationRef: params.getParam(
              'childaffirmationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Children'],
            ),
            confidence: params.getParam(
              'confidence',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Confidence'],
            ),
          ),
        ),
        FFRoute(
          name: 'Alarm_emotion',
          path: '/alarmEmotion',
          builder: (context, params) => AlarmEmotionWidget(
            affirmationRef: params.getParam(
              'affirmationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Affirmation_Collection'],
            ),
            childaffirmationRef: params.getParam(
              'childaffirmationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Children'],
            ),
            emotion: params.getParam(
              'emotion',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Emotions'],
            ),
          ),
        ),
        FFRoute(
          name: 'Alarm_positivity',
          path: '/alarmPositivity',
          builder: (context, params) => AlarmPositivityWidget(
            affirmationRef: params.getParam(
              'affirmationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Affirmation_Collection'],
            ),
            childaffirmationRef: params.getParam(
              'childaffirmationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Children'],
            ),
            positivity: params.getParam(
              'positivity',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Positivity'],
            ),
          ),
        ),
        FFRoute(
          name: 'Alarm_academics',
          path: '/alarmAcademics',
          builder: (context, params) => AlarmAcademicsWidget(
            affirmationRef: params.getParam(
              'affirmationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Affirmation_Collection'],
            ),
            childaffirmationRef: params.getParam(
              'childaffirmationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Children'],
            ),
            academics: params.getParam(
              'academics',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Academics'],
            ),
          ),
        ),
        FFRoute(
          name: 'Alarm_sexuality',
          path: '/alarmSexuality',
          builder: (context, params) => AlarmSexualityWidget(
            affirmationRef: params.getParam(
              'affirmationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Affirmation_Collection'],
            ),
            childaffirmationRef: params.getParam(
              'childaffirmationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Children'],
            ),
            sexuality: params.getParam(
              'sexuality',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Sexuality'],
            ),
          ),
        ),
        FFRoute(
          name: 'Alarm_kindness',
          path: '/alarmKindness',
          builder: (context, params) => AlarmKindnessWidget(
            affirmationRef: params.getParam(
              'affirmationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Affirmation_Collection'],
            ),
            childaffirmationRef: params.getParam(
              'childaffirmationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Children'],
            ),
            kindness: params.getParam(
              'kindness',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Kindness'],
            ),
          ),
        ),
        FFRoute(
          name: 'Alarm_responsibility',
          path: '/alarmResponsibility',
          builder: (context, params) => AlarmResponsibilityWidget(
            affirmationRef: params.getParam(
              'affirmationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Affirmation_Collection'],
            ),
            childaffirmationRef: params.getParam(
              'childaffirmationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Children'],
            ),
            responsibility: params.getParam(
              'responsibility',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Responsibility'],
            ),
          ),
        ),
        FFRoute(
          name: 'Activities',
          path: '/activities',
          builder: (context, params) => ActivitiesWidget(
            affirmationRef: params.getParam(
              'affirmationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Affirmation_Collection'],
            ),
            identityplay: params.getParam(
              'identityplay',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Identity'],
            ),
          ),
        ),
        FFRoute(
          name: 'Identity',
          path: '/identity',
          builder: (context, params) => IdentityWidget(
            favRef: params.getParam(
              'favRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Children', 'Favs'],
            ),
          ),
        ),
        FFRoute(
          name: 'identity_player',
          path: '/identityPlayer',
          builder: (context, params) => IdentityPlayerWidget(
            affirmationRef: params.getParam(
              'affirmationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Affirmation_Collection'],
            ),
            identityplayRef: params.getParam(
              'identityplayRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Identity'],
            ),
          ),
        ),
        FFRoute(
          name: 'audioTest',
          path: '/audioTest',
          builder: (context, params) => AudioTestWidget(
            identityref: params.getParam(
              'identityref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Identity'],
            ),
          ),
        ),
        FFRoute(
          name: 'Riser_AffirmationCopy',
          path: '/riserAffirmationCopy',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Riser_AffirmationCopy')
              : RiserAffirmationCopyWidget(),
        ),
        FFRoute(
          name: 'activities_34',
          path: '/activities34',
          builder: (context, params) => Activities34Widget(
            riseraffirmationRef: params.getParam(
              'riseraffirmationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Affirmation_Categories'],
            ),
            affirmationRef: params.getParam(
              'affirmationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Affirmation_Collection'],
            ),
          ),
        ),
        FFRoute(
          name: 'activities_68',
          path: '/activities68',
          builder: (context, params) => Activities68Widget(
            riseraffirmationRef: params.getParam(
              'riseraffirmationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Affirmation_Categories'],
            ),
            affirmationRef: params.getParam(
              'affirmationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Affirmation_Collection'],
            ),
          ),
        ),
        FFRoute(
          name: 'activities_912',
          path: '/activities912',
          builder: (context, params) => Activities912Widget(
            riseraffirmationRef: params.getParam(
              'riseraffirmationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Affirmation_Categories'],
            ),
            affirmationRef: params.getParam(
              'affirmationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Affirmation_Collection'],
            ),
          ),
        ),
        FFRoute(
          name: 'activities_teens',
          path: '/activitiesTeens',
          builder: (context, params) => ActivitiesTeensWidget(
            riseraffirmationRef: params.getParam(
              'riseraffirmationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Affirmation_Categories'],
            ),
            affirmationRef: params.getParam(
              'affirmationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Affirmation_Collection'],
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/onboarding';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
