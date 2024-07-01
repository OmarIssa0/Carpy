import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/features/details/peresentation/view/details_view.dart';
import 'package:flutter/material.dart';

class ItemRecommended extends StatelessWidget {
  const ItemRecommended({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailsView.routeName);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Material(
          color: Colors.white,
          elevation: 2,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Stack(
                children: [
                  Image.asset(
                    Assets.imagesFerareCar,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white70,
                      radius: 18,
                      child: Center(
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite, size: 20)),
                      ),
                    ),
                  ),
                ],
              ),
              const Align(
                alignment: AlignmentDirectional.topEnd,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 10),
                      Text("Audi e-tron Premium", style: AppStyles.medium14),
                      SizedBox(height: 2),
                      Text("Rs. 54,77,823.73", style: AppStyles.medium12),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
