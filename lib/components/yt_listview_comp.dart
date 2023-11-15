import 'package:flutter/material.dart';
import 'package:recipe_app/components/yt_videoplayer.dart';

class ListYtComp extends StatefulWidget {
  final double height;
  final List<String> vidIdList;
  ListYtComp({Key? key, required this.vidIdList, required this.height})
      : super(key: key);

  @override
  _ListYtCompState createState() => _ListYtCompState();
}

class _ListYtCompState extends State<ListYtComp> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        physics: PageScrollPhysics(),
        itemCount: widget.vidIdList.length,
        itemBuilder: (context, index) => YtPlayerComp(
              width: MediaQuery.of(context).size.width,
              height: widget.height,
              idListItem: widget.vidIdList[index],
            ));
  }
}
