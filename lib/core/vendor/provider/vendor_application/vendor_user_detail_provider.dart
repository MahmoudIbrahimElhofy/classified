import 'package:tegy_nbadel/core/vendor/repository/vendor_user_repository.dart';
import 'package:tegy_nbadel/core/vendor/viewobject/vendor_user.dart';
import '../../api/common/ps_resource.dart';
import '../../constant/ps_constants.dart';
import '../../viewobject/common/ps_value_holder.dart';

import '../common/ps_provider.dart';

class VendorUserDetailProvider extends PsProvider<VendorUser> {
  VendorUserDetailProvider({
    required VendorUserRepository? repo,
    required this.psValueHolder,
    int limit = 0,
  }) : super(repo, limit,
            subscriptionType: PsConst.SINGLE_OBJECT_SUBSCRIPTION) {
    // _repo = repo;
  }

//  VendorUserRepository? _repo;
  PsValueHolder? psValueHolder;
  PsResource<VendorUser> get vendorUserDetail => super.data;
}
