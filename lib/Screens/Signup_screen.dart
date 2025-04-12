

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testyyy/Provider/User_provider.dart';
import 'package:testyyy/Screens/Login_screen.dart';

class SignupPage extends StatelessWidget {

  final formkey =GlobalKey<FormState>();

  final TextEditingController emailcontroller=TextEditingController();
  final TextEditingController passwordcontroller=TextEditingController();
  final TextEditingController phonecontroller=TextEditingController();
  final TextEditingController namecontroller=TextEditingController();

  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {

  final pro =Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Signup"),
      ),


      body: Form(
        key:formkey ,
          child:
          Column(
            children: [
              Text("Name"),
              TextFormField(
                controller: namecontroller,
                decoration: InputDecoration( border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(7)))),
                validator: (value) {
                  if(value==null||value.isEmpty)
                    {
                      return "name invallid";
                    }
                  return null;
                },
              ),

              SizedBox(height: 8,),
              Text("Phone"),

              TextFormField(
                controller: phonecontroller,
                decoration: InputDecoration( border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(7)))),

                validator: (value) {
                  if(value==null||value.isEmpty)
                  {
                    return "phone invallid";
                  }
                  return null;
                },
              ),

              SizedBox(height: 8,),

              Text("Email"),
              TextFormField(
                controller: emailcontroller,
                decoration: InputDecoration( border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(7)))),
                validator: (value) {
                  if(value==null||value.isEmpty)
                  {
                    return "email invallid";
                  }
                  return null;
                },
              ),

              SizedBox(height: 8,),

              Text("Password",),
              TextFormField(

                controller: passwordcontroller,
                decoration: InputDecoration( border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(7)))),
                validator: (value) {
                  if(value==null||value.isEmpty)
                  {
                    return "password invallid";
                  }
                  return null;
                },

               // obscureText: true,
              ),

              SizedBox(height: 10,),

              ElevatedButton(

                  onPressed: ()async
                  {
                    if(formkey.currentState!.validate())
                      {
                        await pro.getsignup(name: namecontroller.text,
                            phone: phonecontroller.text,
                            password: passwordcontroller.text,
                            email: emailcontroller.text
                        );

                        if(pro.userdata?.status==true)
                          {
                            Navigator.push(context, MaterialPageRoute(builder:(context) => LoginPage(),));
                          }
                        else
                        {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Errror")));

                        }
                      }
                    else
                    {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Errror")));

                    }


                  },

                  child: Text("SignUp"),
              ),

               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text("Already have an account"),
                   TextButton(
                     onPressed: ()
                     {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                     },
                     child: Text("login"),
                   )
                 ],
               )





            ],
          )

      )




      );

  }
}
