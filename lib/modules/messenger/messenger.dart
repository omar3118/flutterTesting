import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Messenger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal[300],
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://setav.org/en/assets/uploads/2017/12/395862915996-1132x670.jpg'),
              radius: 22,
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              "Chats",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
              ),
            ),
          ],
        ),
        actions:<Widget> [
          IconButton(
            iconSize: 40,
            icon: CircleAvatar(
              backgroundColor: Colors.teal,
              child: Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,

              ),
            ),
            onPressed: () => print("Camera"),
          ),
          IconButton(
            iconSize: 40,
            icon: CircleAvatar(
              backgroundColor: Colors.teal,
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
            onPressed: () => print("Edit"),
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "search",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                  ),
                  prefixIcon: Icon(
                      Icons.search_rounded
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(// Container for fixed size, to scrollable list
               height:87,
               child: ListView.builder(
                 scrollDirection: Axis.horizontal,
                 itemBuilder:(context,index)=>itemBuilderStore(),
                 itemCount: 8,
               ),
             ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context,index)=>itemBuilder(),
                itemCount: 12,


              ),// second part

            ],
          ),
        ),
      ),
    );



  }
  Widget  itemBuilder()=> Padding(
    padding: const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 9,
    ),
    child: Row(
        children:<Widget>[
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://setav.org/en/assets/uploads/2017/12/395862915996-1132x670.jpg'),
                radius: 22,

              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 5.5,

              ),
              CircleAvatar(
                backgroundColor: Colors.green,
                radius: 5,

              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My Name is here",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "The messages are here",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.teal
                      ),
                    ),

                    Text(
                      '11:11 pm',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]

    ),
  );

  Widget itemBuilderStore()=> Padding(
    padding: const EdgeInsets.all(9.0),
    child: Row(
      children: [
        Container(
          width: 44,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://setav.org/en/assets/uploads/2017/12/395862915996-1132x670.jpg'),
                    radius: 22,

                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 5.5,

                  ),
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 5,

                  ),
                ],
              ),
              Text(
                'MyNameisverylong',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    ),
  );

}
