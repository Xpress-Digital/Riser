import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'feed_back_widget.dart' show FeedBackWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FeedBackModel extends FlutterFlowModel<FeedBackWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameTextController;
  String? Function(BuildContext, String?)? fullNameTextControllerValidator;
  String? _fullNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter the patients full name.';
    }

    return null;
  }

  // State field(s) for feedback_form widget.
  FocusNode? feedbackFormFocusNode;
  TextEditingController? feedbackFormTextController;
  String? Function(BuildContext, String?)? feedbackFormTextControllerValidator;
  String? _feedbackFormTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter an age for the patient.';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    fullNameTextControllerValidator = _fullNameTextControllerValidator;
    feedbackFormTextControllerValidator = _feedbackFormTextControllerValidator;
  }

  @override
  void dispose() {
    fullNameFocusNode?.dispose();
    fullNameTextController?.dispose();

    feedbackFormFocusNode?.dispose();
    feedbackFormTextController?.dispose();
  }
}
