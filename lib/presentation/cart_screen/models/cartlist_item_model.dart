import '../../../core/app_export.dart';

/// This class is used in the [cartlist_item_widget] screen.
class CartlistItemModel {
  CartlistItemModel({
    this.oBHCombi,
    this.oBHCombi1,
    this.measurement,
    this.image,
    this.image1,
    this.image2,
    this.id,
  }) {
    oBHCombi = oBHCombi ?? ImageConstant.imgDrugThumbnail72x72;
    oBHCombi1 = oBHCombi1 ?? "OBH Combi";
    measurement = measurement ?? "75ml";
    image = image ?? ImageConstant.imgMenuGray500;
    image1 = image1 ?? ImageConstant.imgPlus;
    image2 = image2 ?? ImageConstant.imgTrash;
    id = id ?? "";
  }

  String? oBHCombi;

  String? oBHCombi1;

  String? measurement;

  String? image;

  String? image1;

  String? image2;

  String? id;
}
