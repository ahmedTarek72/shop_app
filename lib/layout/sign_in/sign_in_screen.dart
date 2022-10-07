import 'package:flutter/material.dart';
import 'package:shop_app/layout/register/shop_register.dart';

class SignIN extends StatelessWidget {
  SignIN({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('LOGIN', style: Theme.of(context).textTheme.headline5),
              Text(
                'LogIn Now To Browse our hot offers',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: Colors.grey),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,

                validator: (value) {
                  if (value!.isEmpty) {
                    return "please Enter your Email Address";
                  }
                },
                controller: emailController,
                decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 15,),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please Enter your password";
                  }
                },
                controller: emailController,
                decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    suffixIcon: IconButton( icon: Icon(Icons.visibility_outlined), onPressed: () {  },),

                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 15,),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: ( ){
                      if(formKey.currentState!.validate()){

                      }

                    }, child: Text("LOGIN")),
              ),
              SizedBox(height: 15,),
              Row(children: [
                Text("Don\'t have an account?"),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen(),));
                }, child: Text("register".toUpperCase()))
              ],)
            ],
          ),
        ),
      ),
    );
  }
}
