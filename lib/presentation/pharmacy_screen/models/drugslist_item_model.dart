import '../../../core/app_export.dart';

/// This class is used in the [drugslist_item_widget] screen.
class DrugslistItemModel {
  DrugslistItemModel({
    this.panadol,
    this.panadol1,
    this.quantiity,
    this.price,
    this.image,
    this.id,
  }) {
    panadol = panadol ?? ImageConstant.imgDrugThumbnail;
    panadol1 = panadol1 ?? "Panadol";
    quantiity = quantiity ?? "20pcs";
    price = price ?? "15.99";
    image = image ?? ImageConstant.imgPlus;
    id = id ?? "";
  }

  String? panadol;

  String? panadol1;

  String? quantiity;

  String? price;

  String? image;

  String? id;
}
