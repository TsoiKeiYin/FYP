import 'package:babylonjs_viewer/babylonjs_viewer.dart';
import 'package:flutter/material.dart';

class Fitting extends StatelessWidget {
  Fitting({Key? key}) : super(key: key);

  List bottomSheetWidget = [
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: 11,
        children: [
          SizedBox(
            width: 28,
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: Colors.amber,
            ),
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: Color.fromARGB(255, 255, 228, 147),
            ),
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: Color.fromARGB(255, 255, 190, 212),
            ),
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: Color.fromARGB(255, 147, 206, 255),
            ),
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: Color.fromARGB(255, 142, 255, 146),
            ),
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: Colors.grey[350],
            ),
            child: Center(
                child: Icon(
              Icons.add_a_photo_rounded,
              size: 50,
              color: Colors.grey,
            )),
          ),
          SizedBox(
            width: 28,
          )
        ],
      ),
    ),
    SizedBox(
      height: 20,
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 0,
        color: Colors.grey[350],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text("Clothes"),
          trailing: Icon(Icons.chevron_right),
          onTap: () => {},
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 0,
        color: Colors.grey[350],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text("Pants"),
          trailing: Icon(Icons.chevron_right),
          onTap: () => {},
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              // color: Colors.grey,
              height: MediaQuery.of(context).size.height * 0.95,
              child: BabylonJSViewer(
                src: 'assets/3DModel.glb',
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: _buildDraggableScrollableSheet())
          ],
        ),
      ),
    );
  }

  Widget _buildDraggableScrollableSheet() {
    return DraggableScrollableSheet(
      //?????? maxChildSize >= initialChildSize >= minChildSize
      //??????????????????????????????
      initialChildSize: 0.18,
      //??????????????????????????????
      minChildSize: 0.18,
      //??????????????????????????????
      maxChildSize: 0.5,
      //?????????????????????????????????????????????????????????true ????????????Center????????????false,????????????center??????????????????????????????????????????
      expand: true,
      //true???????????????????????????maxChildSize??????minChildSize????????????????????????????????? false:??????????????????????????????
      snap: true,
      // ???snapSizes????????????????????????[],??????????????????????????????????????????????????????????????? minChildSize,maxChildSize??????
      //?????????????????????????????????????????????????????????????????????expand: true,
      snapSizes: [0.18, 0.5],
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(22.0),
              topRight: const Radius.circular(22.0),
            ),
            color: Colors.grey[200],
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: ListView.builder(
              controller: scrollController,
              itemCount: bottomSheetWidget.length,
              itemBuilder: (BuildContext context, int index) {
                return bottomSheetWidget[index];
              },
            ),
          ),
        );
      },
    );
  }
}
