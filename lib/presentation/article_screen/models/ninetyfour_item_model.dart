import '../../../core/app_export.dart';

/// This class is used in the [ninetyfour_item_widget] screen.
class NinetyfourItemModel {
  NinetyfourItemModel({
    this.image,
    this.theHealthiest,
    this.date,
    this.time,
    this.image1,
    this.id,
  }) {
    image = image ?? ImageConstant.imgThumbnail;
    theHealthiest = theHealthiest ??
        "The 25 Healthiest Fruits You Can Eat, According to a Nutritionist";
    date = date ?? "Jun 10, 2021 ";
    time = time ?? "5min read";
    image1 = image1 ?? ImageConstant.imgBookmarkCyan300;
    id = id ?? "";
  }

  String? image;

  String? theHealthiest;

  String? date;

  String? time;

  String? image1;

  String? id;
}
