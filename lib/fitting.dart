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
      //注意 maxChildSize >= initialChildSize >= minChildSize
      //初始化占用父容器高度
      initialChildSize: 0.18,
      //占用父组件的最小高度
      minChildSize: 0.18,
      //占用父组件的最大高度
      maxChildSize: 0.5,
      //是否应扩展以填充其父级中的可用空间默认true 父组件是Center时设置为false,才会实现center布局，但滚动效果是向两边展开
      expand: true,
      //true：触发滚动则滚动到maxChildSize或者minChildSize，不在跟随手势滚动距离 false:滚动跟随手势滚动距离
      snap: true,
      // 当snapSizes接收的是一个数组[],数组内的数字必须是升序，而且取值范围必须在 minChildSize,maxChildSize之间
      //作用是可以控制每次滚动部件占父容器的高度，此时expand: true,
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
