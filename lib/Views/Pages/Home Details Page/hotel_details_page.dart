import 'package:earn_store/Controllers/Home%20Controllers/all_hotel_controller.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Widgets/Home%20Details%20Widgets/hotel_details_body.dart';
import 'package:earn_store/Views/Widgets/Home%20Details%20Widgets/hotel_details_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HotelDetailsPage extends StatefulWidget {
  final String hotelID;
  const HotelDetailsPage({
    super.key,
    required this.hotelID,
  });

  @override
  State<HotelDetailsPage> createState() => _HotelDetailsPageState();
}

class _HotelDetailsPageState extends State<HotelDetailsPage> {
  bool isLoading = true;
  AllHotelController controller = Get.put(
    AllHotelController(),
  );
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    debugPrint("HotelID: ${widget.hotelID}");
    await controller.getHotelDetails(
      hotelID: widget.hotelID,
    );
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const ScreenLoading()
        : RootDesign(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const HotelDetailsTop(),
                SizedBox(height: 20.h),
                const HotelDetailsBody(),
              ],
            ),
          );
  }
}
