import 'package:flutter/material.dart';
import 'package:flutter_json_mac/utils/edcode_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: InfoTop(),
              flex: 1,
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5),child: Container(height:1.0,color: Colors.black,),),
            Expanded(
              child: ShowJsonBottom(),
              flex: 1,
            )
          ],
        ));
  }
}

class InfoTop extends StatefulWidget {
  bool isMd5 = false;
  String dataStr = "";

  InfoTop({Key? key}) : super(key: key);

  @override
  State<InfoTop> createState() => _InfoTopState();
}

class _InfoTopState extends State<InfoTop> {
  var controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    widget.dataStr = controller.text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: TextField(
              controller: controller,
              maxLines: 999,
              autofocus: true,
              decoration: const InputDecoration(
                  hintText: "Json数据",
                  border: OutlineInputBorder(
                    ///设置边框四个角的弧度
                    borderRadius: BorderRadius.all(Radius.circular(10)),

                    ///用来配置边框的样式
                    borderSide: BorderSide(
                      ///设置边框的颜色
                      color: Colors.red,

                      ///设置边框的粗细
                      width: 2.0,
                    ),
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(),
                      onPressed: () {},
                      child: Text("格式化")),
                  Row(
                    children: [
                      Text("MD5"),
                      Checkbox(
                          value: widget.isMd5,
                          onChanged: (value) {
                            setState(() {
                              widget.isMd5 = !widget.isMd5!;
                            });
                          })
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void startDecode() {
    var edcodeStr = DecodeUtils().decode(widget.dataStr);
  }
}

class ShowJsonBottom extends StatefulWidget {
  const ShowJsonBottom({Key? key}) : super(key: key);

  @override
  State<ShowJsonBottom> createState() => _ShowJsonBottomState();
}

class _ShowJsonBottomState extends State<ShowJsonBottom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: TextField(
              maxLines: 999,
              autofocus: true,
              decoration: const InputDecoration(
                  hintText: "Json数据",
                  border: OutlineInputBorder(
                    ///设置边框四个角的弧度
                    borderRadius: BorderRadius.all(Radius.circular(10)),

                    ///用来配置边框的样式
                    borderSide: BorderSide(
                      ///设置边框的颜色
                      color: Colors.red,

                      ///设置边框的粗细
                      width: 2.0,
                    ),
                  )),
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
