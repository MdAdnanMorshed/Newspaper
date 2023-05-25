import 'package:get/get.dart';
import 'package:newspaper_app/app/data/models/newspaper_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  List dummyData=[].obs;
  @override
  void onInit() {

    dummyData.add(NewsPaperModel(author: 'author',title: 'title 1',description: 'description',url: 'https://s.yimg.com/uu/api/res/1.2/LKRH31mzL9wqtcqoQ_lkjw--~B/Zmk9ZmlsbDtoPTYzMDtweW9mZj0wO3c9MTIwMDthcHBpZD15dGFjaHlvbg--/https://media-mbst-pub-ue1.s3.amazonaws.com/creatr-uploaded-images/2023-04/835a5670-e5f4-11ed-9db6-3febf57b7a4a.cf.jpg'));
    dummyData.add(NewsPaperModel(author: 'author',title: 'title 2',description: 'description',url: 'https://i.kinja-img.com/gawker-media/image/upload/c_fill,f_auto,fl_progressive,g_center,h_675,pg_1,q_80,w_1200/16e5700ae24064ff50deef40ec83875d.jpg'));
    dummyData.add(NewsPaperModel(author: 'author',title: 'White House proposes 30 percent tax on electricity used for crypto mining',description: 'description',url: 'https://s.yimg.com/uu/api/res/1.2/_0lUWxV0epaYKnRPQ1.Jxw--~B/Zmk9ZmlsbDtoPTYzMDtweW9mZj0wO3c9MTIwMDthcHBpZD15dGFjaHlvbg--/https://media-mbst-pub-ue1.s3.amazonaws.com/creatr-uploaded-images/2023-05/5d8f2740-e97d-11ed-b4b3-dfb213c6d348.cf.jpg'));
    dummyData.add(NewsPaperModel(author: 'author',title: 'White House proposes 30 percent tax on electricity used for crypto mining',description: 'description',url: ''));
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }




  void increment() => count.value++;
}
