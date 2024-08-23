import 'package:car_store/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class RowTitleAndValue extends StatelessWidget {
  const RowTitleAndValue({
    super.key,
    required this.title,
    required this.value,
  });
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: FittedBox(
              alignment: AlignmentDirectional.topStart,
              fit: BoxFit.scaleDown,
              child: Text(
                "$title :",
                style: AppStyles.semiBold16,
              ),
            ),
          ),
          // SizedBox(width: 18),
          Expanded(
            child: SizedBox(
              // width: MediaQuery.of(context).size.width * .3,
              child: Text(
                value,
                style: AppStyles.medium14
                    .copyWith(color: Colors.black.withOpacity(.6)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
