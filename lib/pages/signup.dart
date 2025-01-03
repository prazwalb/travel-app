import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.goNamed('signin');
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              'Sign up now',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Please fill the details and create an account',
            style: TextStyle(
              color: Colors.grey[800],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Enter your username',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Enter your email address',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          _emailController.clear();
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: '**********',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.hide_source),
                        onPressed: () {
                          _passwordController.clear();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'password must be 8 character',
                  style:
                      TextStyle(color: const Color.fromARGB(255, 11, 11, 11)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 5, 94, 248),
                  minimumSize: Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  return context.goNamed('homepage');
                }
              },
              child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 22),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have an account'),
              TextButton(
                onPressed: () {
                  return context.goNamed('signinpage');
                },
                child: Text(
                  'Sign in',
                  style: TextStyle(color: Colors.blueAccent),
                ),
              )
            ],
          ),
          Text('Or Connect'),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                'https://img.icons8.com/?size=96&id=uLWV5A9vXIPu&format=png',
                height: 50,
                width: 50,
                fit: BoxFit.contain,
              ),
              Image.network(
                'https://img.icons8.com/?size=96&id=Xy10Jcu1L2Su&format=png',
                height: 50,
                width: 50,
                fit: BoxFit.contain,
              ),
              Image.network(
                'https://img.icons8.com/?size=128&id=119014&format=png',
                height: 50,
                width: 50,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class Signup extends StatefulWidget {
//   const Signup({super.key});

//   @override
//   State<Signup> createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {
//   final formkey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             icon: Icon(Icons.arrow_back_ios_new_outlined),
//             onPressed: () => context.goNamed('signin')),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const Center(
//                 child: Text(
//               'Sign up now',
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold),
//             )),
//             const SizedBox(
//               height: 5,
//             ),
//             const Text('Please fill the details and create account'),
//             const SizedBox(
//               height: 5,
//             ),
//             Form(
//               key: formkey,
//               child: Column(
//                 children: [
//                   // TextFormField(controller:,
//                   // keyboardType: TextInputType.name,
//                   TextFormField(
//                     // controller: _emailController,
//                     keyboardType: TextInputType.emailAddress,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       hintText: 'Enter your email address',
//                       suffixIcon: IconButton(
//                         icon: Icon(Icons.clear),
//                         onPressed: () {
//                           // _emailController.clear();
//                         },
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   TextFormField(
//                     keyboardType: TextInputType.text,
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     )),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
