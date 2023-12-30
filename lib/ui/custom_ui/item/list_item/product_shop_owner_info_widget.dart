import 'package:flutter/material.dart';
import 'package:tegy_nbadel/ui/vendor_ui/item/list_item/product_shop_owner_info_widget.dart';
import '../../../../../../../core/vendor/viewobject/product.dart';

class CustomProductShopOwnerInfoWidget extends StatelessWidget {
  const CustomProductShopOwnerInfoWidget({
    Key? key,
    required this.product,
    required this.tagKey,
  }) : super(key: key);

  final Product product;
  final String tagKey;

  @override
  Widget build(BuildContext context) {
    return ProductShopOwnerInfoWidget(
      product: product,
      tagKey: tagKey,
    );
  }
}
