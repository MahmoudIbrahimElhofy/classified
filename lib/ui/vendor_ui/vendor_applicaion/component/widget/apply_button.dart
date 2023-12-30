import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tegy_nbadel/core/vendor/constant/ps_constants.dart';
import 'package:tegy_nbadel/core/vendor/provider/vendor_application/vendor_user_provider.dart';
import 'package:tegy_nbadel/core/vendor/viewobject/vendor_user.dart';

import '../../../../../core/vendor/api/common/ps_resource.dart';
import '../../../../../core/vendor/api/common/ps_status.dart';
import '../../../../../core/vendor/provider/language/app_localization_provider.dart';
import '../../../../../core/vendor/utils/ps_progress_dialog.dart';
import '../../../../../core/vendor/utils/utils.dart';
import '../../../../../core/vendor/viewobject/common/ps_value_holder.dart';
import '../../../common/dialog/error_dialog.dart';
import '../../../common/dialog/success_dialog.dart';
import '../../../common/ps_button_widget.dart';

class ApplyButtonWidget extends StatefulWidget {
  const ApplyButtonWidget(
      {required this.userNameText,
      required this.emailText,
      required this.storeNameText,
      required this.coverLetterText,
      required this.documentText,
      required this.flag,
      required this.vendorUser});

  final TextEditingController userNameText,
      emailText,
      storeNameText,
      coverLetterText,
      documentText;
  final String flag;
  final VendorUser vendorUser;

  @override
  State<ApplyButtonWidget> createState() => _ApplyButtonWidgetState();
}

class _ApplyButtonWidgetState extends State<ApplyButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final VendorUserProvider provider =
        Provider.of<VendorUserProvider>(context, listen: false);
    final PsValueHolder psValueHolder =
        Provider.of<PsValueHolder>(context, listen: false);

    return PSButtonWidget(
        colorData: Theme.of(context).primaryColor,
        hasShadow: true,
        width: double.infinity,
        titleText: 'blue_mark_apply'.tr,
        onPressed: () async {
          if (widget.userNameText.text != '' &&
              widget.emailText.text != '' &&
              widget.storeNameText.text != '' &&
              widget.coverLetterText.text != '' &&
              widget.documentText.text != '') {
            if (await Utils.checkInternetConnectivity()) {
              await PsProgressDialog.showDialog(context);
              final PsResource<VendorUser> _apiStatus =
                  widget.flag == PsConst.ADD_NEW_ITEM
                      ? await provider.postVendorApplicationSubmit(
                          Utils.checkUserLoginId(psValueHolder),
                          widget.emailText.text,
                          widget.storeNameText.text,
                          widget.coverLetterText.text,
                          File(provider.documentPath!),
                          '')
                      : await provider.postVendorApplicationSubmit(
                          Utils.checkUserLoginId(psValueHolder),
                          widget.emailText.text,
                          widget.storeNameText.text,
                          widget.coverLetterText.text,
                          // File(provider.documentPath ?? '')
                          provider.documentPath != null &&
                                  provider.documentPath!.isNotEmpty
                              ? File(provider.documentPath ?? '')
                              : null,
                          widget.vendorUser.vendorApplication!.id!);
              print('STATUS::::: ${_apiStatus.status}');

              if (_apiStatus.data != null &&
                  _apiStatus.status == PsStatus.SUCCESS) {
                PsProgressDialog.dismissDialog();
                showDialog<dynamic>(
                    context: context,
                    builder: (BuildContext context) {
                      return SuccessDialog(
                        message: 'success_dialog__success'.tr,
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                      );
                    });
              } else {
                PsProgressDialog.dismissDialog();
                showDialog<dynamic>(
                    context: context,
                    builder: (BuildContext context) {
                      return ErrorDialog(message: _apiStatus.message);
                    });
              }
            } else {
              showDialog<dynamic>(
                  context: context,
                  builder: (BuildContext context) {
                    return ErrorDialog(
                      message: 'error_dialog__no_internet'.tr,
                    );
                  });
            }
          } else {
            print('Fail');
            showDialog<dynamic>(
                context: context,
                builder: (BuildContext context) {
                  return ErrorDialog(
                    message: 'contact_us__fail'.tr,
                  );
                });
          }
        });
  }
}
