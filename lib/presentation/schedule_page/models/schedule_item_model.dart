import '../../../core/app_export.dart';

/// This class is used in the [schedule_item_widget] screen.
class ScheduleItemModel {
  ScheduleItemModel({
    this.drMarcusHorizon,
    this.chardiologist,
    this.drMarcusHorizon1,
    this.image,
    this.date,
    this.image1,
    this.time,
    this.id,
  }) {
    drMarcusHorizon = drMarcusHorizon ?? "Dr. Marcus Horizon";
    chardiologist = chardiologist ?? "Chardiologist";
    drMarcusHorizon1 = drMarcusHorizon1 ?? ImageConstant.imgEllipse27image46x46;
    image = image ?? ImageConstant.imgCalendarOnprimary;
    date = date ?? "26/06/2021";
    image1 = image1 ?? ImageConstant.imgSearchOnprimary;
    time = time ?? "10:30 AM";
    id = id ?? "";
  }

  String? drMarcusHorizon;

  String? chardiologist;

  String? drMarcusHorizon1;

  String? image;

  String? date;

  String? image1;

  String? time;

  String? id;
}
