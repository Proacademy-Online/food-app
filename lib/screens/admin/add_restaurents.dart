import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:food_app/components/custom_button.dart';
import 'package:food_app/components/custom_header.dart';
import 'package:food_app/components/custom_images.dart';
import 'package:food_app/components/custom_text.dart';
import 'package:food_app/components/custom_textfeild.dart';
import 'package:food_app/providers/auth/registration_provider.dart';
import 'package:food_app/providers/home/restaurent_provider.dart';
import 'package:food_app/utils/global_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class AddRestaurent extends StatefulWidget {
  const AddRestaurent({Key? key}) : super(key: key);

  @override
  State<AddRestaurent> createState() => _AddRestaurentState();
}

class _AddRestaurentState extends State<AddRestaurent> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: FadeInRight(
        child: Container(
          height: size.height,
          color: const Color(0xffE5E5E5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<RestaurentProvider>(
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        value.getImg.path != ''
                            ? Center(
                                child: GestureDetector(
                                  onTap: () {
                                    value.selectImage();
                                  },
                                  child: Image.file(
                                    value.getImg,
                                    fit: BoxFit.fill,
                                    width: size.width / 3,
                                    height: size.width / 3,
                                  ),
                                ),
                              )
                            : Center(
                                child: IconButton(
                                  onPressed: () {
                                    value.selectImage();
                                  },
                                  icon: const Icon(Icons.image),
                                ),
                              ),
                        const SizedBox(height: 20),
                        CustomTextfeild(
                          controller: value.nameController,
                          hintText: 'resName',
                        ),
                        const SizedBox(height: 20),
                        Row(
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
                                    SizedBox(
                                      width: size.width - 200,
                                      child: CustomText(
                                        text: value.address,
                                        fontSize: 14,
                                        textOverflow: TextOverflow.clip,
                                      ),
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
                                          value.setCoordinates(result);
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
                        const SizedBox(height: 35),
                        CustomButton(
                          text: "save",
                          isLoading: value.isLoading,
                          onTap: () {
                            value.startAddRestaurent(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
