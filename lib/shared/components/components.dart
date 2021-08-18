import 'package:app01/layout/todo_app/cubit/todo_app_cubit.dart';
import 'package:app01/modules/news_app/web_view/web_view_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// reusable components

//1-) Timing
//2-) Refactor
//3-) Quality
//4-) Clean code

Widget defaultButton({
  @required VoidCallback onPressed,
  @required String text,
  double fontSize = 18,
  Color color = Colors.teal,
  double width = double.infinity,
  double height,
  ShapeBorder shape,
}) =>
    MaterialButton(
      shape: shape,
      minWidth: width,
      height: height,
      color: color,
      elevation: 7,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
        ),
      ),
    );

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Widget defaultTFF({
  @required TextEditingController controller,
  @required String labelText,
  Key key,
  double radius=0,
  IconData prefixIcon,
  IconData suffixIcon,
  Function onSuffixPressed,
  GestureTapCallback onTap,
  ValueChanged<String> onFieldSubmitted,
  ValueChanged<String> onChanged,
  FormFieldValidator<String> validator,
  TextInputType keyboardType,
  bool isPassword = false,
  Color psColor,
  Color sfColor,
  double width,
  double height,
  Color labelColor,
  EdgeInsetsGeometry padding,
  Color borderColor= Colors.black54,
  Color textColor,
}) =>
    Container(
      padding:padding ,
      width: width,
      height: height,
      child: TextFormField(
        key: key,
        style: TextStyle(color: textColor,),
        validator: validator,
        controller: controller,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        onTap: onTap,
        obscureText: isPassword,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            color: psColor,
          ),
          suffixIcon: suffixIcon == null
              ? null
              : IconButton(
                  onPressed: onSuffixPressed,
                  icon: Icon(
                    suffixIcon,
                    color: sfColor,
                  ),
                ),
          labelText: labelText,
          labelStyle: TextStyle(
            color: labelColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(radius),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
    );

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Widget buildTaskItems(
  Map model,
  BuildContext context, {
  @required bool isChecked,
  double radius = 40,
  Color backgroundColor = Colors.teal,
}) {
  return Dismissible(
    key: Key(model['id'].toString()),
    child: Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          CircleAvatar(
            radius: radius,
            child: Text(
              '${model['time']}',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.cyan[700],
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model['title']}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${model['date']}',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          IconButton(
            onPressed: () {
              isChecked ?ToDoAppCubit.get(context).updateToDB(model['status'],'new', model['id']):ToDoAppCubit.get(context).updateToDB(model['status'],'done', model['id']);
            },
            icon: Icon(
              isChecked ? Icons.check_circle_rounded : Icons.circle_outlined,
              color: Colors.green[300],
            ),
          ),
          IconButton(
            onPressed: () {
              ToDoAppCubit.get(context).updateToDB(model['status'],'archived', model['id']);
            },
            icon: Icon(
              Icons.archive_outlined,
              color: Colors.black45,
            ),
          ),
        ],
      ),
    ),
    onDismissed: (direction) =>
        ToDoAppCubit.get(context).deleteFromDB(model['status'],model['id']),
    background: Container(
      color: Colors.red[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.delete_forever,
            color: Colors.white,
            size: 50,
          ),
          Icon(
            Icons.delete_forever,
            color: Colors.white,
            size: 50,
          ),
        ],
      ),
    ),
  );
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Widget buildArticleItem(article,context) => InkWell(
  onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>WebViewScreen(article['url']))),
  child:   Padding(

      padding: const EdgeInsets.all(15),

      child: Row(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Container(

            height: 120,

            width: 120,

            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(10),

              image: DecorationImage(

                  image: NetworkImage(

                      article['urlToImage']!=null?article['urlToImage']:'https://images.ctfassets.net/23aumh6u8s0i/4TsG2mTRrLFhlQ9G1m19sC/4c9f98d56165a0bdd71cbe7b9c2e2484/flutter'),

                  fit: BoxFit.cover),

            ),

          ),

          SizedBox(

            width: 10,

          ),

          Expanded(

            child: Container(

              height: 120,

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Expanded(

                    child: Text(

                      article['title']!=null?article['title']:'Title',

                      maxLines: 3,

                      overflow: TextOverflow.ellipsis,

                      style: Theme.of(context).textTheme.bodyText1,

                    ),

                  ),

                  Text(

                    article['publishedAt']!=null?article['publishedAt']:'Date',

                    maxLines: 1,

                    overflow: TextOverflow.ellipsis,

                    style: TextStyle(color: Colors.grey),

                  ),

                ],

              ),

            ),

          ),

        ],

      ),

    ),
);
