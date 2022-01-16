import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/components/custom_images.dart';
import 'package:food_app/components/custom_loader.dart';
import 'package:food_app/components/custom_text.dart';
import 'package:food_app/components/image_tile.dart';
import 'package:food_app/models/restaurent_model.dart';
import 'package:food_app/providers/auth/user_provider.dart';
import 'package:food_app/providers/home/product_provider.dart';
import 'package:food_app/providers/home/restaurent_provider.dart';
import 'package:food_app/screens/main_screens/restaurent_details_screen/restaurent_details_screen.dart';
import 'package:food_app/utils/app_colors.dart';
import 'package:food_app/utils/util_functions.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class NearestRestaurentsSection extends StatefulWidget {
  const NearestRestaurentsSection({
    Key? key,
  }) : super(key: key);

  @override
  State<NearestRestaurentsSection> createState() => _NearestRestaurentsSectionState();
}

class _NearestRestaurentsSectionState extends State<NearestRestaurentsSection> {
  //stream
  Stream<List<DocumentSnapshot>>? stream;

//firestore instance
  final _firestore = FirebaseFirestore.instance;

  //geofire object
  final geo = Geoflutterfire();

  //radius ( distance)
  // var radius = BehaviorSubject<double>.seeded(20.0);
  double radius = 20;

  List<RestaurentModel> _resList = [];

  late GeoFirePoint center;

  @override
  void initState() {
    super.initState();

    // stream = geo.collection(collectionRef: collectionReference).within(center: center, radius: radius, field: 'position', strictMode: true);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<UserProvider>(
      builder: (context, value, child) {
        // get the collection reference or query
        var collectionReference = _firestore.collection('restaurents');

        if (value.userModel.address != null) {
          //determinig the center point (your location coordinates)
          center = geo.point(latitude: value.userModel.address!.latitude, longitude: value.userModel.address!.longitude);
        }

        return Container(
            margin: const EdgeInsets.only(left: 30),
            height: size.height / 5,
            // color: Colors.black,
            child: value.userModel.address == null
                ? const Center(
                    child: CustomText(
                    text: 'choose a delivery location \nto see the nearest restaurents',
                    textAlign: TextAlign.center,
                  ))
                : StreamBuilder(
                    stream: geo
                        .collection(collectionRef: collectionReference)
                        .within(center: center, radius: radius, field: 'position', strictMode: true),
                    builder: (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
                      if (snapshot.hasError) {
                        return const CustomText(text: 'something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CustomLoader();
                      }

                      Logger().w(snapshot.data!.length);

                      //clear the list
                      _resList.clear();

                      for (var i = 0; i < snapshot.data!.length; i++) {
                        Map<String, dynamic> data = snapshot.data![i].data() as Map<String, dynamic>;
                        var model = RestaurentModel.fromJson(data);
                        _resList.add(model);
                      }

                      Logger().w(_resList.length);

                      return _resList.isEmpty
                          ? const Center(child: CustomText(text: 'no nearest restaurents'))
                          : ListView.builder(
                              itemCount: _resList.length,
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return RestaurentTile(model: _resList[index]);
                              },
                            );
                    },
                  ));
      },
    );
  }
}

class RestaurentTile extends StatelessWidget {
  const RestaurentTile({
    Key? key,
    this.isOffer = false,
    required this.model,
  }) : super(key: key);

  final bool isOffer;
  final RestaurentModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //set the clicked single restaurent data
        Provider.of<RestaurentProvider>(context, listen: false).setSingleRes(model);

        //fetch the products of this restaurent by the restairent id
        Provider.of<ProductProvider>(context, listen: false).fetctProductsByResId(model.resId);

        //navigate to details screen
        UtilFunctions.navigateTo(context, const RestaurentDeailsScreen());
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageTile(
            isOffer: isOffer,
            imgUrl: model.img,
          ),
          const SizedBox(height: 5),
          CustomText(
            text: model.resName,
            fontSize: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: primaryColor,
                    size: 15,
                  ),
                  CustomText(
                    text: '${model.avgRating}  • ',
                    fontSize: 12,
                  )
                ],
              ),
              Row(
                children: const [
                  Icon(
                    Icons.timer,
                    color: greyColor,
                    size: 15,
                  ),
                  SizedBox(width: 3),
                  CustomText(
                    text: '15 min',
                    fontSize: 12,
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class OfferTag extends StatelessWidget {
  const OfferTag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        width: 79,
        height: 28,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: korange,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: const CustomText(
          text: '50% OFF',
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: kwhite,
        ),
      ),
    );
  }
}
