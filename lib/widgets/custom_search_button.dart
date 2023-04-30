import 'package:flutter/material.dart';
import 'package:full_e_commerce_application/network/remote/dio_helper.dart';

import '../constants/primary_color.dart';

class CustomSearchButton extends StatelessWidget {
  const CustomSearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: MyCustomColor.defaultColor,
        ),
        child: TextButton(
          onPressed: (){
            DioHelper.getData(
                url: 'home',
                query:{}
            ).then((value) {
              //print(value.data.toString());
              //print(value.data['data']['banners'].length().toString());
              print(value.data['data']['products'].length().toString());

            }).catchError(
                    (err)
                {print(err.toString());}
            );
          },
          child: Row(
            children:  const [
              Padding(
                padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,

                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 26,
                  child: Icon(
                    Icons.search,
                    size: 28,
                  ),
                ),
              ),
              Text(
                'Find Something',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Icon(
                  Icons.filter_list,
                  size: 28,
                  color: Colors.white,

                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
