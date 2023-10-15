import '../../../core/app_export.dart';

/// This class is used in the [doctorlist_item_widget] screen.
class DoctorlistItemModel {
  DoctorlistItemModel({
    this.drMarcusHorizon,
    this.title,
    this.image,
    this.maway,
    this.id,
  }) {
    drMarcusHorizon = drMarcusHorizon ?? ImageConstant.imgProfilePic;
    title = title ?? "Dr. Marcus Horizon";
    image = image ?? ImageConstant.imgStar;
    maway = maway ?? ImageConstant.imgLocation;
    id = id ?? "";
  }

  String? drMarcusHorizon;

  String? title;

  String? image;

  String? maway;

  String? id;
}
