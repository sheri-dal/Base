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
            ElevatedButton(
              onPressed: () async {
                controller.postData();
              },
              child: Text('POST Data', style: TextStyle(fontSize: 24)),
            ),
            Obx(
              () => Expanded(
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: controller.lst.length,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      width: 50,
                      color: Colors.amber,
                      child: Column(
                        children: [
                          Text(controller.lst[index]["title"].toString()),
                          Text(controller.lst[index]["userId"].toString()),
                          Text(controller.lst[index]["id"].toString()),
                          Text(controller.lst[index]["completed"].toString()),
                        ],
                      ),
                    );
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
