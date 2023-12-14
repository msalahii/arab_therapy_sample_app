import 'package:arab_therapy_app/core/utils/app_colors.dart';
import 'package:arab_therapy_app/core/utils/app_constants.dart';
import 'package:arab_therapy_app/presentation/controllers/sample_data_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SampleDataView extends GetView<SampleDataController> {
  static const routeName = '/startListView';
  SampleDataView({super.key});
  final sampleDataController = Get.put(SampleDataController(repository: Get.find()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.cyanColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: SvgPicture.asset("${AppConstants.svgsAssetsPath}/logo.svg"),
      ),
      backgroundColor: AppColors.cyanColor,
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
          child: sampleDataController.state.value == SampleDataControllerState.loading
              ? const SpinKitThreeBounce(size: 30, color: Color(0xff6DC09C))
              : ListView.builder(
                  itemCount: sampleDataController.sampleDataList.length,
                  itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 300,
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0, 10), color: Colors.black.withOpacity(0.04), blurRadius: 20)
                              ], color: Colors.white, borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                                    child: CachedNetworkImage(
                                      imageUrl: sampleDataController.sampleDataList[index].imageURL,
                                      height: 200,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      sampleDataController.sampleDataList[index].title,
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                    ),
                                    subtitle: Text(
                                      sampleDataController.sampleDataList[index].description,
                                      style: const TextStyle(color: Colors.grey, overflow: TextOverflow.ellipsis),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
        ),
      ),
    );
  }
}
