import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatelessWidget {
  Map({Key? key}) : super(key: key);

  List bottomSheetWidget = [
    Center(
      child: Container(
        height: 3,
        width: 100,
        color: Colors.grey,
      ),
    ),
    SizedBox(
      height: 11,
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
          title: Text("設定起點"),
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
          title: Text("設定終點"),
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
              child: MapSample(),
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
      initialChildSize: 0.05,
      //占用父组件的最小高度
      minChildSize: 0.05,
      //占用父组件的最大高度
      maxChildSize: 0.3,
      //是否应扩展以填充其父级中的可用空间默认true 父组件是Center时设置为false,才会实现center布局，但滚动效果是向两边展开
      expand: true,
      //true：触发滚动则滚动到maxChildSize或者minChildSize，不在跟随手势滚动距离 false:滚动跟随手势滚动距离
      snap: true,
      // 当snapSizes接收的是一个数组[],数组内的数字必须是升序，而且取值范围必须在 minChildSize,maxChildSize之间
      //作用是可以控制每次滚动部件占父容器的高度，此时expand: true,
      snapSizes: [0.05, 0.3],
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
            padding: const EdgeInsets.only(top: 20),
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

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}
