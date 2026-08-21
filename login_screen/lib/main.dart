import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: "Login",
      home:LoginScreen()
    );
  }
}

class LoginScreen extends StatefulWidget{

  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen>{


  @override
  Widget build(BuildContext context){

    return Scaffold(
      body:Center(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(30),
          width: 500,
          height: 500,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.grey[300]!,
              width: 1.5
            ),
          ),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Login"),
              SizedBox(height: 16),
              TextButton(
                onPressed: (){
                  print("Login with Google Pressed");
                }, 
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.g_mobiledata),
                    SizedBox(width: 10),
                    Text("Login with Google")
                  ],
                )
              ),
              SizedBox(height: 16),
              Row(
                children: 
                [

                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade300, 
                      thickness: 1,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "or sign up through email",
                      style: TextStyle(
                        color: Colors.grey.shade500, 
                        fontSize: 14,              
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
        
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade300, 
                      thickness: 1,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30,),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email ID',
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none
                  )
                ),
              ),
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none
                  )
                ),
              ),
              SizedBox(height: 50,),
              TextButton(
                onPressed: () => print("login pressed"),
                child: Text("Login"),
              ),
              
            ],

          )
        ),
      )
    );
  }

}
