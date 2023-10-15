import '../cart_screen/widgets/cartlist_item_widget.dart';
import 'bloc/cart_bloc.dart';
import 'models/cart_model.dart';
import 'models/cartlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_demo_app/core/app_export.dart';
import 'package:healthcare_demo_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:healthcare_demo_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:healthcare_demo_app/widgets/app_bar/appbar_trailing_image.dart';
import 'package:healthcare_demo_app/widgets/app_bar/custom_app_bar.dart';
import 'package:healthcare_demo_app/widgets/custom_elevated_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<CartBloc>(
        create: (context) => CartBloc(CartState(cartModelObj: CartModel()))
          ..add(CartInitialEvent()),
        child: CartScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.h, vertical: 24.v),
                      child: Column(children: [
                        _buildCartList(context),
                        SizedBox(height: 27.v),
                        _buildPaymentDetail(context),
                        SizedBox(height: 25.v),
                        Divider(),
                        SizedBox(height: 27.v),
                        _buildPaymentMethod(context),
                        SizedBox(height: 5.v)
                      ])),
                  SizedBox(height: 26.v)
                ])),
            bottomNavigationBar: _buildCheckoutRow(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 45.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 21.h, top: 10.v, bottom: 10.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarSubtitle(text: "lbl_my_cart".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgOverflowMenu,
              margin: EdgeInsets.fromLTRB(14.h, 14.v, 14.h, 10.v))
        ]);
  }

  /// Section Widget
  Widget _buildCartList(BuildContext context) {
    return BlocSelector<CartBloc, CartState, CartModel?>(
        selector: (state) => state.cartModelObj,
        builder: (context, cartModelObj) {
          return ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(height: 25.v);
              },
              itemCount: cartModelObj?.cartlistItemList.length ?? 0,
              itemBuilder: (context, index) {
                CartlistItemModel model =
                    cartModelObj?.cartlistItemList[index] ??
                        CartlistItemModel();
                return CartlistItemWidget(model);
              });
        });
  }

  /// Section Widget
  Widget _buildPaymentDetail(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_payment_detail".tr, style: theme.textTheme.titleMedium),
      SizedBox(height: 12.v),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text("lbl_consultation".tr, style: theme.textTheme.bodyMedium),
        Text("lbl_60_00".tr, style: theme.textTheme.bodyMedium)
      ]),
      SizedBox(height: 11.v),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text("lbl_admin_fee".tr, style: theme.textTheme.bodyMedium),
        Text("lbl_01_00".tr, style: theme.textTheme.bodyMedium)
      ]),
      SizedBox(height: 11.v),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text("msg_aditional_discount".tr, style: theme.textTheme.bodyMedium),
        Text("lbl".tr, style: theme.textTheme.bodyMedium)
      ]),
      SizedBox(height: 11.v),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text("lbl_total".tr, style: theme.textTheme.titleSmall),
        Text("lbl_61_00".tr, style: theme.textTheme.titleSmall)
      ])
    ]);
  }

  /// Section Widget
  Widget _buildPaymentMethod(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_payment_method".tr, style: theme.textTheme.titleMedium),
      SizedBox(height: 10.v),
      Container(
          padding: EdgeInsets.all(13.h),
          decoration: AppDecoration.outlineGray
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("lbl_visa".tr, style: CustomTextStyles.titleMediumBlack),
                Padding(
                    padding: EdgeInsets.only(top: 5.v),
                    child:
                        Text("lbl_change".tr, style: theme.textTheme.bodySmall))
              ]))
    ]);
  }

  /// Section Widget
  Widget _buildCheckoutRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 2.v, bottom: 6.v),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("lbl_total".tr,
                            style: CustomTextStyles.titleSmallGray500),
                        SizedBox(height: 1.v),
                        Opacity(
                            opacity: 0.9,
                            child: Text("lbl_20_98".tr,
                                style: CustomTextStyles.titleMediumOnPrimary))
                      ])),
              CustomElevatedButton(width: 192.h, text: "lbl_checkout".tr)
            ]));
  }

  /// Navigates to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is
  /// used to build the navigation stack. When the action is triggered, this
  /// function uses the [NavigatorService] to navigate to the previous screen
  /// in the navigation stack.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
