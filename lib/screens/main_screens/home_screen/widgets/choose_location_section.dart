import 'package:flutter/material.dart';
import 'package:food_app/components/custom_images.dart';
import 'package:food_app/components/custom_text.dart';
import 'package:food_app/providers/auth/user_provider.dart';
import 'package:food_app/utils/global_data.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class ChooseLocationSection extends StatelessWidget {
  const ChooseLocationSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, value, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 42),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CustomSvg(svgName: 'location'),
                  const SizedBox(width: 13),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(text: 'Your location'),
                      CustomText(
                        text: value.address,
                        fontSize: 14,
                      )
                    ],
                  ),
                ],
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlacePicker(
                          apiKey: GlobalData.API_KEY, // Put YOUR OWN KEY here.
                          onPlacePicked: (result) {
                            Logger().i(result.formattedAddress);
                            value.setAddress(result);
                            Navigator.of(context).pop();
                          },
                          initialPosition: LatLng(6.7106, 79.9074),
                          useCurrentLocation: true,
                        ),
                      ),
                    );
                  },
                  child: const CustomSvg(svgName: 'ion_options-outline'))
            ],
          ),
        );
      },
    );
  }
}
