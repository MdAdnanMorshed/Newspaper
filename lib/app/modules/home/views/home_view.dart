import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newspaper_app/app/data/models/newspaper_model.dart';
import 'package:newspaper_app/app/data/utils/app_space.dart';
import 'package:newspaper_app/app/data/utils/dbhelper.dart';
import 'package:newspaper_app/app/data/utils/shimmer_effect.dart';
import 'package:newspaper_app/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        appBar: AppBar(
          title: const Text('News Paper'),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                print('HomeView.build Logout');
                Get.offNamedUntil(Routes.AUTHENTICATION, (route) => false);
              },
              child: const Icon(Icons.logout),
            ),
            AppSpace.spaceW12,
            InkWell(
              onTap: () {
                Get.toNamed(Routes.BOOKMARKSLIST);
              },
              child: const Icon(
                Icons.bookmark,
                color: Colors.orange,
                size: 25,
              ),
            ),
            AppSpace.spaceW12,
          ],
        ),
        body: Obx(() {
          if (!controller.isLoadingData.value) {
            return Center(
              child: ShimmerLoading.vListViewLoading(),
            );
          }
          else {
            if (controller.newsDataList.isEmpty) {
              return const Center(child: Text('No Data Found!'));
            } else {
              return ListView.builder(
                itemCount: controller.newsDataList.length,
                itemBuilder: (BuildContext context, int index) {
                  NewsPaperModel data = controller.newsDataList[index];
                  return _newsCardWidget(data);
                },
              );
            }
          }
        }));
  }

  _newsCardWidget(NewsPaperModel data) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.NEWS_DETAILS, arguments: data);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
        margin: const EdgeInsets.only(left: 10, right: 10, top: 8),
        height: Get.size.height / 3.8,
        width: Get.size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white.withOpacity(0.9),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
              margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
              height: Get.size.height / 6.5,
              width: Get.size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.7),
              ),
              child: Hero(
                tag: data.title.toString(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    data.urlToImage ?? '',
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.high,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Image.asset(
                        'assets/no_image.png',
                        fit: BoxFit.fill,
                      );
                    },
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'published At : ',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        data.publishedAt.toString().substring(0, 10),
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  AppSpace.spaceH4,
                  Text(
                    data.title ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}
