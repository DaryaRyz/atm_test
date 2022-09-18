import 'package:atm_test/domain/models/price.dart';
import 'package:atm_test/presentation/styles/color_styles.dart';
import 'package:atm_test/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PriceCard extends StatefulWidget {
  final VoidCallback onDelete;
  final Function(String, String) onChange;
  final Price priceModel;

  const PriceCard({
    Key? key,
    required this.onDelete,
    required this.onChange,
    required this.priceModel,
  }) : super(key: key);

  @override
  State<PriceCard> createState() => _PriceCardState();
}

class _PriceCardState extends State<PriceCard> {
  late final _priceController = TextEditingController(
    text: widget.priceModel.price,
  );
  late final _hashController = TextEditingController(
    text: widget.priceModel.hash,
  );

  @override
  void initState() {
    _priceController.addListener(() {
      widget.onChange(_hashController.text, _priceController.text);
    });
    _hashController.addListener(() {
      widget.onChange(_hashController.text, _priceController.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          CustomTextField(
            controller: _hashController,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            width: 56,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
              signed: false,
            ),
          ),
          SizedBox(width: 16.w),
          CustomTextField(
            controller: _priceController,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            width: 104,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
              signed: false,
            ),
          ),
          const Spacer(),
          Container(
            width: 40.r,
            height: 40.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: ColorStyles.tmnRed.withOpacity(0.08),
            ),
            child: TextButton(
              onPressed: widget.onDelete,
              style: TextButton.styleFrom(
                primary: Colors.black26,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/remove_icon.svg',
                  width: 15.w,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
