import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newspaper_app/app/data/models/newspaper_model.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body:
       Obx((){
         if(!controller.isLoadingData.value){
           return const Center(child: Text('No Data Found!'));
         }else{
           return  ListView.builder(
             itemCount: controller.newsDataList.length,
             itemBuilder: (BuildContext context, int index) {
               NewsPaperModel data =controller.newsDataList[index];
               return _newsCardWidget(data);
             },
           );
         }

       })

    );
  }

  _newsCardWidget( NewsPaperModel data) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
        margin: const EdgeInsets.only(left: 10,right: 10,top: 8),
        height: 220.0,
        width: 800,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.withOpacity(0.4),
        ),

        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
              margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
              height: 150.0,
              width: 800,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.7),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(data.urlToImage??'',fit: BoxFit.fill,filterQuality: FilterQuality.high,

                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return const Text('no Image ');
                    },
                  ),

              ),
            ),
             Text(data.title??''),
            const Text('POSTED AT '),
          ],
        ),
      ),
    );
  }
}
