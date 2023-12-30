import 'package:flutter/material.dart';
import 'package:tegy_nbadel/config/ps_colors.dart';
import 'package:tegy_nbadel/core/vendor/provider/language/app_localization_provider.dart';
import '../../../../../../core/vendor/constant/ps_constants.dart';
import '../../../../../../core/vendor/utils/utils.dart';

class UserOfferMenuWidget extends StatelessWidget {
  const UserOfferMenuWidget({this.updateSelectedIndexWithAnimation});
  final Function? updateSelectedIndexWithAnimation;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(Icons.account_balance_wallet_outlined,
            size: 22,
            color: Utils.isLightMode(context)
                ? PsColors.achromatic800
                : PsColors.achromatic50),
        minLeadingWidth: 0,
        title: Text(
          'home__menu_drawer_user_offers'.tr,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontWeight: FontWeight.w400),
        ),
        onTap: () {
          Navigator.pop(context);
          if (updateSelectedIndexWithAnimation != null) {
            updateSelectedIndexWithAnimation!(
                'home__menu_drawer_user_offers'.tr,
                PsConst.REQUEST_CODE__MENU_OFFER_FRAGMENT);
          }
        });
  }
}
