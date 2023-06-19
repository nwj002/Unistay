import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unistay/screens/register_screen.dart';
import 'package:unistay/screens/forgot_password_screen.dart';
import 'package:unistay/viewmodels/auth_provider_viewmodel.dart';


class LoginAsAdminScreen extends StatefulWidget {
const  LoginAsAdminScreen({super.key});

  @override
  State<LoginAsAdminScreen> createState() => _LoginAsAdminScreenState();
}

class _LoginAsAdminScreenState extends State<LoginAsAdminScreen> {
  final emailCtrl = TextEditingController();

  final passwordCtrl = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  bool valuefirst=false;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.deepOrangeAccent.shade100,
          Colors.orange.shade300,
          Colors.orange.shade300,
          Colors.orange.shade100,
        ])),
        
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
           
           const SizedBox(
              height: 200,
              width: 252,
              child: Center(
                
                
                child: Text(
                  "Sign In As Admin",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      ),
                ),
                
                
              ),
              
            ),
          const Text("We are delighted to see you again - Sign in ",
           style: TextStyle(
             color: Colors.black87,
             fontSize: 17,
             fontWeight: FontWeight.normal,
           ),),
          const SizedBox(height: 15,),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  decoration:const BoxDecoration(
                    color: Colors.white70, 
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
              
                  ),
                   
                  child: Column(
                    children: [
                      SizedBox(
                        height: 170,
                       
                        
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                             const SizedBox(height: 20,),
                              TextFormField(
                                controller: emailCtrl,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Email is required";
                                  }
                                  if (!RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value)) {
                                    return "Enter a valid email";
                                  }
                                  return null;
                                },
                                style: const TextStyle(
                                    fontFamily: 'WorkSansSemiBold',
                                    fontSize: 16.0,
                                    color: Colors.black),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  border: InputBorder.none,
                                  prefixIcon:const Icon(
                          Icons.email,
                          color: Colors.black,
                          size: 22.0,
                        ),
                                  hintText: 'Email Address',
                                  hintStyle: const TextStyle(
                                      fontFamily: 'WorkSansSemiBold', fontSize: 17.0),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: passwordCtrl,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Password is required";
                                  }
                                  return null;
                                },
                                style: const TextStyle(
                                    fontFamily: 'WorkSansSemiBold',
                                    fontSize: 16.0,
                                    color: Colors.black),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                      prefixIcon: const Icon(
                          Icons.lock,
                          size: 22.0,
                          color: Colors.black,
                        ),
                                  hintText: 'Password',
                                  hintStyle: const TextStyle(
                                      fontFamily: 'WorkSansSemiBold', fontSize: 17.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(  
                            checkColor: Colors.greenAccent,  
                            activeColor: Colors.blueGrey,  
                            value: valuefirst,  
                            onChanged: (bool? value) {  
                              setState(() {  
                                valuefirst = value ?? true;  
                              });  
                            },  
                          ),
                        const Text("Agree the term and conditions",),
                    ],
                  ),  
                  
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.orange.shade200),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                            
                                  borderRadius: BorderRadius.circular(10),
                                  side:  BorderSide(color: Colors.orange.shade200,))),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.symmetric(vertical: 10)),
                        ),
                        onPressed: () async {
                          String email = emailCtrl.text.trim();
                          String pass = passwordCtrl.text.trim();
                
                          if (_formkey.currentState!.validate()) {
                            final res = await context
                                .read<AuthProvider>()
                                .loginAsAdmin(email: email, password: pass);
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Logged In As Admin!")));
                            if (res == "OK") {
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(content: Text(res)));
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text("Please enter all the details")));
                          }
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(fontSize: 17,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          color: Colors.black,
                          
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                   Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ForgotPasswordScreen()));
                        },
                        child: const Text(
                          "Forgot password?",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                            letterSpacing: 1,
                            height: 1,
                          ),
                        ),
                      )),
                      const SizedBox(height: 15,),
                      const Text("OR",
                      style:TextStyle(
                        color: Colors.black,
              
                      ) ,),
                      const SizedBox(height: 15,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (){
              
                            },
                            child: Container(
                              height: 50,
                              width: 200,
                              
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius:BorderRadius.circular(10) ,
                                image:const DecorationImage(
                                 
                                  
                                  image: NetworkImage('https://w7.pngwing.com/pngs/989/129/png-transparent-google-logo-google-search-meng-meng-company-text-logo-thumbnail.png'),
                                
                                alignment: Alignment.topLeft,
                                ),
                          
                              ),
                              child:const Center(
                                child:  Text("    Google",
                                style: TextStyle(color: Colors.blueGrey,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                                
                                ),),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15,),
              
                          
                        ],
              
                      ),
                      const SizedBox(height: 15,),
              
                 const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text(
                        "New Here? ",
                        
                        style:  TextStyle(color: Colors.black,
                        letterSpacing: 2,
                        height: 1,
                        decoration: TextDecoration.underline),
                      ),
                       SizedBox(height: 15,),
                     
                    ],
                  ),
              
                  const  SizedBox(height: 15,),
                   InkWell(
                    onTap: (){
                      Navigator.pushReplacement(
                                    context, MaterialPageRoute(
                                      builder: (_)=> RegisterScreen()));
              
                    },
                     child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.orange.shade200,
                            borderRadius:BorderRadius.circular(10) ,
                          ),
                          child:const Center(
                            child:  Text("Create an account",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                              
                            ),),
                          ),
                        ),
                   ),
                   SizedBox(height: 50,)
                    ],
                  ),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}


