import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/schedule_item_model.dart';
import 'package:healthcare_demo_app/presentation/schedule_page/models/schedule_model.dart';
part 'schedule_event.dart';
part 'schedule_state.dart';

/// A bloc that manages the state of a Schedule according to the event that is dispatched to it.
class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleBloc(ScheduleState initialState) : super(initialState) {
    on<ScheduleInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ScheduleInitialEvent event,
    Emitter<ScheduleState> emit,
  ) async {
    emit(state.copyWith(
        scheduleModelObj: state.scheduleModelObj
            ?.copyWith(scheduleItemList: fillScheduleItemList())));
  }

  List<ScheduleItemModel> fillScheduleItemList() {
    return [
      ScheduleItemModel(
          drMarcusHorizon: "Dr. Marcus Horizon",
          chardiologist: "Chardiologist",
          drMarcusHorizon1: ImageConstant.imgEllipse27image46x46,
          image: ImageConstant.imgCalendarOnprimary,
          date: "26/06/2021",
          image1: ImageConstant.imgSearchOnprimary,
          time: "10:30 AM"),
      ScheduleItemModel(
          drMarcusHorizon: "Dr. Alysa Hana",
          chardiologist: "Psikeater",
          drMarcusHorizon1: ImageConstant.imgEllipse27image2,
          image: ImageConstant.imgCalendarOnprimary,
          date: "28/06/2021",
          image1: ImageConstant.imgSearchOnprimary,
          time: "2:00 PM")
    ];
  }
}
