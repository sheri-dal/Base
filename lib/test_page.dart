// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:http_client/controller/test_controller.dart';
import 'package:get/get.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class TestPage extends StatelessWidget {
  final controller = Get.put(TestController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TestPage')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () async {
                controller.getData();
              },
              child: Text('GET Data', style: TextStyle(fontSize: 24)),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                controller.postData();
              },
              child: Text('POST Data', style: TextStyle(fontSize: 24)),
            ),
            Obx(
              () => Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: controller.lst.length,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    itemBuilder: (context, index) {
                      return Container(
                        //padding: EdgeInsets.all(25),
                        height: 100,
                        width: 50,
                        color: Colors.black,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                "Title: ${controller.lst[index]["title"].toString()}",
                                // controller.lst[index]["title"].toString(),
                                textAlign: TextAlign.center,
                                maxLines: 12,
                                style: TextStyle(
                                    letterSpacing: 1.3,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                              Text(
                                "User Id: ${controller.lst[index]["userId"].toString()}",
                                textAlign: TextAlign.center,
                                maxLines: 12,
                                style: TextStyle(
                                    letterSpacing: 1.3,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                              Text(
                                "Id: ${controller.lst[index]["id"].toString()}",
                                //   controller.lst[index]["id"].toString(),
                                textAlign: TextAlign.center,
                                maxLines: 12,
                                style: TextStyle(
                                    letterSpacing: 1.3,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                              Text(
                                "completed: ${controller.lst[index]["completed"].toString()}",
                                // controller.lst[index]["completed"].toString(),
                                textAlign: TextAlign.center,
                                maxLines: 12,
                                style: TextStyle(
                                    letterSpacing: 1.3,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
