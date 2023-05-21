import 'package:flutter/material.dart';
import '/app/core/base/base_project.dart';
import '/app/core/services/notification_service.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final token = await Get.find<NotificationService>().getDeviceFirebaseToken();
                controller.apiCall
                  ..httpClient.baseUrl = ""
                  ..httpClient.addRequestModifier((Request request) {
                    request.headers['Authorization'] =
                        'key=AAAAr7TXrww:APA91bEGiTJpOTQsGQV_xgrOpfXusCusoRm0CEaHLroIyGC54JussIXfIuU95CeCa-lI92DxmNO95ce9tDt-G-kPDGLV1QeMBuuIY5WkQEpiLAYPzjvs5p-i95RuQj8YPolNLwyKObqj';
                    return request;
                  })
                  ..onRequest(
                    "https://fcm.googleapis.com/fcm/send",
                    RequestMethod.POST,
                    body: {
                      "priority": "HIGH",
                      "data": {
                        "title": "Global Postman Message",
                        "body": "Topic(global) time: 12:388",
                        "image": "https://picsum.photos/536/354",
                        "priority": "HIGH",
                        "content_available": true
                      },
                      "notification": {
                        "title": "Global Postman Message",
                        "body": "Topic(global) time: 12:38",
                        "image": "https://picsum.photos/536/354",
                        "priority": "HIGH",
                        "content_available": true
                      },
                      "registration_ids": [
                        token,
                      ]
                    },
                  );
              },
              child: const Text('Push notification with api'),
            ),
          ],
        ),
      ),
    );
  }
}
