import 'package:atm_test/domain/models/price.dart';
import 'package:atm_test/presentation/screens/atm_inside_screen/atm_bottom_sheet_body/atm_bottom_sheet_body.dart';
import 'package:atm_test/presentation/screens/atm_inside_screen/atm_bottom_sheet_body/widgets/price_card.dart';
import 'package:atm_test/presentation/styles/color_styles.dart';
import 'package:atm_test/presentation/styles/strings.dart';
import 'package:atm_test/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceLists extends StatefulWidget {
  final PriceListController priceListController;

  const PriceLists({
    Key? key,
    required this.priceListController,
  }) : super(key: key);

  @override
  State<PriceLists> createState() => _PriceListsState();
}

class _PriceListsState extends State<PriceLists> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.priceLists,
          style: TextStyle(
            color: ColorStyles.tmnDarkBlue,
            fontFamily: 'Jost',
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Strings.synchronizingTitle,
              style: TextStyle(
                color: ColorStyles.tmnDarkBlue,
                fontFamily: 'Jost',
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              Strings.synchronizingTime,
              style: TextStyle(
                color: ColorStyles.tmnDarkBlue,
                fontFamily: 'Jost',
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        if (widget.priceListController.value.isNotEmpty)
          Row(
            children: [
              Text(
                Strings.hash,
                style: TextStyle(
                  color: ColorStyles.tmnMidGrey,
                  fontFamily: 'Jost',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(width: 63.w),
              Text(
                Strings.price,
                style: TextStyle(
                  color: ColorStyles.tmnMidGrey,
                  fontFamily: 'Jost',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        SizedBox(height: 8.h),
        Column(
          children: List.generate(
            widget.priceListController.value.length,
            (index) => PriceCard(
              key: ObjectKey(widget.priceListController.value[index]),
              priceModel: widget.priceListController.value[index],
              onChange: (hashValue, priceValue) {
                widget.priceListController.value[index].price =  priceValue;
                widget.priceListController.value[index].hash = hashValue;
              },
              onDelete: () {
                setState(() {
                  widget.priceListController.value.remove(widget.priceListController.value[index]);
                });
              },
            ),
          ),
        ),
        CustomButton(
          backgroundColor: Colors.transparent,
          onTap: () {
            setState(() {
              widget.priceListController.value.add(Price());
            });
          },
          text: Strings.addLine,
          fontWeight: FontWeight.w300,
          width: double.maxFinite,
          height: 32,
        ),
      ],
    );
  }
}
