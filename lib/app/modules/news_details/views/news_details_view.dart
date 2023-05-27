import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newspaper_app/app/data/models/newspaper_model.dart';
import 'package:newspaper_app/app/data/utils/app_space.dart';
import 'package:newspaper_app/app/data/utils/dbhelper.dart';
import 'package:newspaper_app/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/news_details_controller.dart';

class NewsDetailsView extends GetView<NewsDetailsController> {
  const NewsDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    NewsPaperModel data = Get.arguments;




    return Scaffold(
      appBar: AppBar(
        title: const Text('News Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          margin: const EdgeInsets.only(left: 0, right: 0, top: 0),
          height: Get.size.height,
          width: Get.size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            //   color: Colors.grey.withOpacity(0.4),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                height: Get.size.height / 3,
                width: Get.size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Colors.grey.withOpacity(0.7),
                ),
                child: Hero(
                  tag: data.title.toString(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: data.urlToImage.toString() == 'null'
                        ? Image.asset(
                            'assets/no_image.png',
                            fit: BoxFit.fill,
                          )
                        : Image.network(
                            data.urlToImage ?? '',
                            fit: BoxFit.fill,
                            filterQuality: FilterQuality.high,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
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
                    AppSpace.spaceH10,
                    Text(
                      data.title ?? '',
                      overflow: TextOverflow.clip,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    AppSpace.spaceH10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Author :${data.author}',
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                        InkWell(
                            onTap: () {
                                var mail='';
                              DBHelper.object.userMail().then((value) {
                                mail=value.toString();
                              });

                              if(mail==''){
                                 Get.toNamed(Routes.AUTHENTICATION);
                              }else{
                                print('NewsDetailsView.build $mail');
                                controller.addNewsFormBookMark(data,mail);
                              }
                            },
                            child: CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.red.withOpacity(0.8),
                                child: const Icon(
                                  Icons.bookmark_add,
                                  color: Colors.white,
                                  size: 25,
                                )))
                      ],
                    ),
                    Text(
                      'published At : ${data.publishedAt.toString().substring(0, 10)}',
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      'Source : ${data.source!.name ?? ''.toString().substring(0, 10)}',
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              AppSpace.spaceH10,
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Content',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    AppSpace.spaceH6,
                    Text(
                      data.content.toString().substring(0, 10),
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    AppSpace.spaceH20,
                    const Text(
                      'Description ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    AppSpace.spaceH6,
                    Text(
                      data.description ?? 'NO Description ',
                      overflow: TextOverflow.clip,
                      style: const TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  
}
