import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tegy_nbadel/core/vendor/provider/vendor_application/vendor_user_detail_provider.dart';

import '../../../../../../../core/vendor/constant/ps_dimens.dart';
import '../../../../../common/ps_ui_widget.dart';

class OtherUserVendorLogoPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final VendorUserDetailProvider userProvider =
        Provider.of<VendorUserDetailProvider>(context);
    return Container(
      width: PsDimens.space80,
      height: PsDimens.space80,
      child: PsNetworkCircleImageForUser(
        photoKey: '',
        imagePath: userProvider.vendorUserDetail.data!.logo!.imgPath,
        boxfit: BoxFit.cover,
        onTap: () {},
      ),
    );
  }
}
