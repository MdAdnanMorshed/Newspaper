import 'package:flutter/material.dart';
import 'package:newspaper_app/app/modules/news_details/views/news_details_view.dart';
import 'package:newspaper_app/app/routes/app_pages.dart';

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(Routes.NEWS_DETAILS);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: 300.0,
        width: 800,
        color: Colors.grey,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              height: 200.0,
              width: 800,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.tealAccent,
              ),

              child: const Icon(Icons.image),
            ),
            const Text('Title'),
            const Text('POSTED AT '),
          ],
        ),
      ),
    );
  }
}
