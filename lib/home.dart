import 'package:flutter/material.dart';
import 'package:fyp_demo/fitting.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cornerRadius = 22.0;
    double spacing = 15;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Home",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: spacing,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(cornerRadius),
                ),
                color: Colors.grey[350],
                child: InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(cornerRadius),
                  ),
                  onTap: () {},
                  child: const SizedBox(
                    width: 374,
                    height: 200,
                    child: Padding(
                      padding: EdgeInsets.only(top: 11, left: 28),
                      child: Text(
                        'Fitting Room',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: spacing,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(cornerRadius),
                ),
                color: Colors.grey[350],
                child: InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(cornerRadius),
                  ),
                  onTap: () {},
                  child: const SizedBox(
                    width: 374,
                    height: 200,
                    child: Padding(
                      padding: EdgeInsets.only(top: 11, left: 28),
                      child: Text(
                        'Routine Planning',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
