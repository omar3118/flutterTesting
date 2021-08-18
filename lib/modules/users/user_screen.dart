import 'package:app01/models/user/user_model.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {

  List<DataModel>list1=[
    DataModel(id: 1, name: 'Omar', phone: '+962799324792'),
    DataModel(id: 2, name: 'Mohammad', phone: '+962795300825'),
    DataModel(id: 3, name: 'Ahmad', phone: '+962783923498'),
    DataModel(id: 4, name: 'Omar', phone: '+962799324792'),
    DataModel(id: 5, name: 'Mohammad', phone: '+962795300825'),
    DataModel(id: 6, name: 'Ahmad', phone: '+962783923498'),
    DataModel(id: 7, name: 'Omar', phone: '+962799324792'),
    DataModel(id: 8, name: 'Mohammad', phone: '+962795300825'),
    DataModel(id: 9, name: 'Ahmad', phone: '+962783923498'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: Icon(
          Icons.list,
          size: 30,
        ),
        centerTitle: true,
        title: Text(
          "Users",
        ),
      ),

      body: ListView.separated(
          itemBuilder: (context, index)=>ListViewItem(list1[index]),
          separatorBuilder: (context, index)=>Divider(
            indent: 18,
            color: Colors.teal,
          ),
           itemCount: list1.length,
    ),


    );
  }

  Widget ListViewItem(DataModel D)=>Padding(
    padding: const EdgeInsets.all(9.0),
    child: Row(

      children: [

        CircleAvatar(

          backgroundColor: Colors.teal[300],
          radius: 29,
          child: Text(
            D.id.toString(),
            style: TextStyle(
              color: Colors.white,
                fontSize: 22
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,

              children:[
                Text(
                  D.name,
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,

                ),
                Text(
                  D.phone,
                  style: TextStyle(
                    color: Colors.teal[300],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ]
          ),
        ),

      ],

    ),
  );
}

