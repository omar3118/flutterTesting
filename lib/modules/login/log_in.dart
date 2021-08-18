import 'package:app01/shared/components/components.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool b = true;
  final  emCont = TextEditingController();
  final  psCont = TextEditingController();
  final  fKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: Icon(
          Icons.menu,
          size: 27,
        ),
        centerTitle: true,
        title: Text(
          "Chating.io",
          style: TextStyle(
            fontSize: 30,
        ),
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),

            child: Icon(
              Icons.chat,
            ),
          ),

        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20
        ),
        child: Form(
          key: fKey,
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              defaultTFF(


                  validator: (value){
                    if(value.isEmpty)return"Must Has A Character";
                    return null;
                  },
                  radius: 3,
                  prefixIcon: Icons.email,
                  psColor: Colors.teal,
                  keyboardType: TextInputType.emailAddress,
                  controller: emCont,
                  labelText: 'email'
              ),
              SizedBox(
                height: 20,
              ),
              defaultTFF(
                controller: psCont,
                labelText: "password",
                validator: (value){
                  if(value.isEmpty)return"Must Has A Character";
                  return null;
                },
                radius: 3,
                isPassword: b,
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: Icons.password_rounded,
                psColor: Colors.teal,
                suffixIcon: b?Icons.visibility:Icons.visibility_off,
                sfColor: Colors.teal,
                onSuffixPressed:()=>setState(()=>b=!b),
              ),
              SizedBox(
                height: 10,
              ),
              defaultButton(
                onPressed: ()=> print('email ${emCont.text}'),
                text: "LOGIN",
              ),
              defaultButton(
                onPressed: ()=> print('password ${psCont.text}'),
                text: "LOGIN",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline:TextBaseline.alphabetic,
                children:<Widget>[
                  Container(
                    child: Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Colors.red,

                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                   children: [
                     TextButton(
                         onPressed: (){},
                         child: Text('Register now',)

                     ),
                     FloatingActionButton(

                       backgroundColor: Colors.teal[300],
                       onPressed:()=>print(''),

                       child: Icon(
                         Icons.add,
                         color: Colors.white,
                         semanticLabel: "Hello",
                         size: 29,
                       ),
                     ),
                     IconButton(

                       onPressed: (){},
                       icon: Icon(Icons.offline_pin_outlined),
                       iconSize: 40,
                       color: Colors.teal[400],
                       tooltip: "IconButton",
                     ),
                     MaterialButton(
                       height: 40,
                       onPressed: (){},
                       elevation: 10,
                       color: Colors.teal,
                       child: Text(
                         'Hello',
                         style:TextStyle(
                           color: Colors.white,
                         )
                       ),

                     ),

                   ],
                 ),


                ],
              ),


            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.teal[300],

        onPressed:()=>{
          if(fKey.currentState.validate())
            print('Success')
         else
           print("NOT Success")

        },

        icon: Icon(
          Icons.add,
          color: Colors.white,
          semanticLabel: "Hello",
          size: 29,
        ),
        label: Text("Press"),
      ),



    );
  }
}
