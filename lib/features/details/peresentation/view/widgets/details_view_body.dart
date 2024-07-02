import 'package:car_store/core/utils/app_color.dart';
import 'package:car_store/core/utils/app_image.dart';
import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/features/details/peresentation/view/widgets/box_info.dart';
import 'package:car_store/features/details/peresentation/view/widgets/image_details.dart';
import 'package:car_store/features/details/peresentation/view/widgets/item_details_car.dart';
import 'package:flutter/material.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ImageDetails(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * .7,
                        child: const Text("Telsa Model 3",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.semiBold22)),
                    CircleAvatar(
                      backgroundColor:
                          AppColor.kBackGroundColorSplash.withOpacity(.3),
                      radius: 20,
                      child: Center(
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              size: 25,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text("Rs. 18,00,000.00", style: AppStyles.medium14),
                const SizedBox(height: 15),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ItemDetailsCar(
                      image: Assets.imagesLocation,
                      title: "Dehli, India",
                    ),
                    ItemDetailsCar(
                      image: Assets.imagesCardetails,
                      title: "Car details (Model 2021)",
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const BoxInfo(),
                const SizedBox(height: 20),
                const Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: AppStyles.regular16,
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
