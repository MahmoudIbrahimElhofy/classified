import 'package:flutter/material.dart';
import 'package:tegy_nbadel/core/vendor/viewobject/vendor_user.dart';
import 'package:tegy_nbadel/ui/vendor_ui/user/user_vendor_detail/component/vendor_info_list/vendor_branch/vendor_branch_item.dart';

class CustomVendorBranchItem extends StatelessWidget {
  const CustomVendorBranchItem({
    Key? key,
    required this.vendorBranch,
    this.onTap,
  }) : super(key: key);

  final VendorUser vendorBranch;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return VendorBranchItem(
      vendorBranch: vendorBranch,
      onTap: onTap,
    );
  }
}
