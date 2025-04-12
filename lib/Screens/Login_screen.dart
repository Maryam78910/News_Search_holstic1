import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testyyy/Provider/User_provider.dart';
import 'package:testyyy/Screens/Search_screen.dart';
import 'package:testyyy/Widgets/login_widget.dart';

class LoginPage extends StatelessWidget {

  final formkey =GlobalKey<FormState>();

  final TextEditingController emailcontrollerr=TextEditingController();
  final TextEditingController passwordcontrollerr=TextEditingController();

   LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

    final pro =Provider.of<UserProvider>(context);

    return Scaffold(
      appBar:  AppBar(
        title: Text("Login"),
      ),


      body: Form(
        key:formkey ,
          child:
          Column(
            children: [

              Text("Email"),
              TextFormField(
                controller: emailcontrollerr,
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
                controller: passwordcontrollerr,
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

              Consumer<UserProvider>(
                builder: (context, value, child) {

                  return ElevatedButton(

                    onPressed: ()async
                    {
                      if(formkey.currentState!.validate())
                      {
                        await value.getlogin(password: passwordcontrollerr.text, email: emailcontrollerr.text);
                        if(value.userdata?.status==true)
                        {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Done")));
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage(),));

                        }
                        else
                        {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("errrrrrrrrror")));
                        }

                      }
                      else
                      {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Errror")));

                      }

                    },

                    child: Text("Login"),
                  );
                },

              ),

            ],
          )

          ),





    );
  }
}
