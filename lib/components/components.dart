import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/web_view.dart';


Widget newsItem({context, required List<dynamic> itemnews, index}) => InkWell(
    onTap: (){
      Navigator.push(context,
      MaterialPageRoute(builder: (context)=>  WebViewScreen(url: itemnews[index]["url"],),),);
    },
    child: Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
    height: 280,
    width: 400,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.blue[200]),
              width: 400,
              height: 200,
              child: itemnews[index]["urlToImage"] == null
                  ? Container(
                decoration: BoxDecoration(color: Colors.blue[200]),
              )
                  : Image.network("${itemnews[index]["urlToImage"]}")),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                  child: Text(
                    "${itemnews[index]["title"]}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${itemnews[index]["publishedAt"]}",
                style: TextStyle(fontSize: 15, color: Colors.grey[500]),
              ),
            ],
          ),
        ),
      ],
    ),
),
  );
Widget ListNewsItem({context, required List<dynamic> task, isSearch=false}) => BuildCondition(
  condition: task.length > 0,
  builder: (context) => ListView.builder(
    itemBuilder: (context, index) => newsItem(
      context: context,
      index: index,
      itemnews: task,
    ),
    itemCount: task.length,
  ),
  fallback: (context) => isSearch?Container(): Center(
    child: CircularProgressIndicator(),
  ),
);

 Widget TextFormFieldCusstom({
  required TextEditingController controller,
  var Validator,
  required String label,
  var PrifixIcon,
  var suffixIcon,
  var suffixPress,
  var onTap,
  var type,
   var onChanged,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      validator: Validator,
      onTap: onTap,
      onChanged:onChanged,
      decoration: InputDecoration(
        labelText: label,
        suffix:  Icon(suffixIcon),

         // icon: Icon(PrifixIcon),

        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(width: 1, color: Colors.white)),
      ),
    );

Widget customButton({
  Color color = Colors.blue,
  double width = double.infinity,
  required var function,
  required String text,
}) =>
    Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: MaterialButton(
          onPressed: function,
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ));