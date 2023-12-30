import 'common/ps_object.dart';
import 'default_photo.dart';

class VendorList extends PsObject<VendorList> {
  VendorList({
    this.id,
    this.name,
    this.logo
  });

  String? id;
  String? name;
  DefaultPhoto? logo;


  @override
  VendorList fromMap(dynamic dynamicData) {
    return VendorList(
      id: dynamicData['id'],
      name: dynamicData['name'],
      logo: DefaultPhoto().fromMap(dynamicData['logo']),
    );
  }

  @override
  List<VendorList> fromMapList(List<dynamic> dynamicDataList) {
    final List<VendorList> list = <VendorList>[];
    for (dynamic element in dynamicDataList) {
      list.add(VendorList().fromMap(element));
    }
    return list;
  }

  @override
  String? getPrimaryKey() {
    return id.toString();
  }

  @override
  Map<String, dynamic>? toMap(VendorList? object) {
    if (object != null) {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['id'] = object.id;
      data['name'] = object.name;
      data['logo'] = DefaultPhoto().toMap(object.logo);

      return data;
    } else {
      return null;
    }
  }

  @override
  List<Map<String, dynamic>?> toMapList(List<VendorList> objectList) {
    final List<Map<String, dynamic>?> mapList = <Map<String, dynamic>?>[];

    for (VendorList? data in objectList) {
      if (data != null) {
        mapList.add(toMap(data));
      }
    }

    return mapList;
  }

  void copy(VendorList object) {
    id = object.id;
    name = object.name;
    logo = object.logo;

  }

}

