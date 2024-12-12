import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'kids_profile_setup2_widget.dart' show KidsProfileSetup2Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class KidsProfileSetup2Model extends FlutterFlowModel<KidsProfileSetup2Widget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for kidsName widget.
  FocusNode? kidsNameFocusNode;
  TextEditingController? kidsNameTextController;
  String? Function(BuildContext, String?)? kidsNameTextControllerValidator;
  // State field(s) for kidsAge widget.
  String? kidsAgeValue;
  FormFieldController<String>? kidsAgeValueController;
  // State field(s) for kidsSex widget.
  String? kidsSexValue;
  FormFieldController<String>? kidsSexValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    kidsNameFocusNode?.dispose();
    kidsNameTextController?.dispose();
  }
}
