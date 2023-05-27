import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newspaper_app/app/data/models/newspaper_model.dart';
import 'package:newspaper_app/app/data/utils/app_space.dart';
import 'package:newspaper_app/app/data/utils/shimmer_effect.dart';
import 'package:newspaper_app/app/routes/app_pages.dart';

import '../controllers/bookmarkslist_controller.dart';

class BookmarksListView extends GetView<BookmarksListController> {
  const BookmarksListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        appBar: AppBar(
          title: const Text('BookMark List'),
          centerTitle: true,
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('abc@gmail.com')
              .snapshots(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: ShimmerLoading.vListViewLoading(),
              );
            }
            final doc = snapshot.data!.docs;
            return ListView.builder(
              itemCount: doc.length,
              itemBuilder: (BuildContext context, int index) {
                NewsPaperModel data =
                    NewsPaperModel.fromJson(doc[index].data());

                return _newsCardWidget(data);
              },
            );
          },
        ));
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
