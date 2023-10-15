// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class is used in the [topics_item_widget] screen.
class TopicsItemModel extends Equatable {
  TopicsItemModel({
    this.covidNineteen = "Covid-19",
    this.isSelected = false,
  }) {}

  String covidNineteen;

  bool isSelected;

  TopicsItemModel copyWith({
    String? covidNineteen,
    bool? isSelected,
  }) {
    return TopicsItemModel(
      covidNineteen: covidNineteen ?? this.covidNineteen,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [covidNineteen, isSelected];
}
