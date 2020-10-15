import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offpeak/pages/spendTDPItem.dart';
import 'package:offpeak/utils/size_config.dart';

class SpendTDP extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SpendTDP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
            "Spend the Day Packages",
            style: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal * 5,
              fontWeight: FontWeight.bold,
              color: Colors.black,

            )
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(13.0,0.0,10.0,0),
                  child: Column(
                    children: [
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
//                        scrollDirection: Axis.horizontal,
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        return SpendTDPItem();
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
