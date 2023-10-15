import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/doctorlist_item_model.dart';
import 'package:healthcare_demo_app/presentation/dr_list_screen/models/dr_list_model.dart';
part 'dr_list_event.dart';
part 'dr_list_state.dart';

/// A bloc that manages the state of a DrList according to the event that is dispatched to it.
class DrListBloc extends Bloc<DrListEvent, DrListState> {
  DrListBloc(DrListState initialState) : super(initialState) {
    on<DrListInitialEvent>(_onInitialize);
  }

  _onInitialize(
    DrListInitialEvent event,
    Emitter<DrListState> emit,
  ) async {
    emit(state.copyWith(
        drListModelObj: state.drListModelObj
            ?.copyWith(doctorlistItemList: fillDoctorlistItemList())));
  }

  List<DoctorlistItemModel> fillDoctorlistItemList() {
    return [
      DoctorlistItemModel(
          drMarcusHorizon: ImageConstant.imgProfilePic,
          title: "Dr. Marcus Horizon",
          image: ImageConstant.imgStar,
          maway: ImageConstant.imgLocation),
      DoctorlistItemModel(
          drMarcusHorizon: ImageConstant.imgProfilePic111x111,
          title: "Dr. Maria Elena",
          image: ImageConstant.imgStar,
          maway: ImageConstant.imgLocation),
      DoctorlistItemModel(
          drMarcusHorizon: ImageConstant.imgProfilePic1,
          title: "Dr. Stefi Jessi",
          image: ImageConstant.imgStar,
          maway: ImageConstant.imgLocation),
      DoctorlistItemModel(
          drMarcusHorizon: ImageConstant.imgProfilePic2,
          title: "Dr. Gerty Cori",
          image: ImageConstant.imgStar,
          maway: ImageConstant.imgLocation)
    ];
  }
}
