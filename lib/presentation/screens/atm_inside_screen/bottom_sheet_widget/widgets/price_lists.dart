import 'package:atm_test/domain/bloc/settings_bloc.dart';
import 'package:atm_test/domain/models/price_model.dart';
import 'package:atm_test/presentation/screens/atm_inside_screen/bottom_sheet_widget/widgets/price_card.dart';
import 'package:atm_test/presentation/styles/color_styles.dart';
import 'package:atm_test/presentation/styles/strings.dart';
import 'package:atm_test/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceLists extends StatefulWidget {
  final List<PriceModel> priceList;

  const PriceLists({
    Key? key,
    required this.priceList,
  }) : super(key: key);

  @override
  State<PriceLists> createState() => _PriceListsState();
}

class _PriceListsState extends State<PriceLists> {
  late SettingsBloc _settingsBloc;

  @override
  void initState() {
    _settingsBloc = BlocProvider.of<SettingsBloc>(context);
    super.initState();
  }

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
        if (widget.priceList.isNotEmpty)
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
            widget.priceList.length,
            (index) => PriceCard(
              key: ObjectKey(widget.priceList[index]),
              priceModel: widget.priceList[index],
              onChange: (hashValue, priceValue) {
                widget.priceList[index].price =  priceValue;
                widget.priceList[index].hash = hashValue;
                _settingsBloc.add(
                  SettingsBlocPriceListChangeEvent(priceList: widget.priceList),
                );
              },
              onDelete: () {
                setState(() {
                  widget.priceList.remove(widget.priceList[index]);
                });
              },
            ),
          ),
        ),
        CustomButton(
          backgroundColor: Colors.transparent,
          onTap: () {
            setState(() {
              widget.priceList.add(PriceModel());
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
