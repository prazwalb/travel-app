import 'package:flutter/material.dart';

class Fromexample extends StatefulWidget {
  const Fromexample({super.key});

  @override
  State<Fromexample> createState() => _FromState();
}

class _FromState extends State<Fromexample> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController controllers = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controllers,
                keyboardType: TextInputType.phone,
                // enabled: false,
                onChanged: (value) {
                  print(value);
                },

                maxLength: 10,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 10)),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        controllers.clear();
                        controllers.text = 'hello';
                      },
                    ),
                    hintText: 'Enter Name'),
                buildCounter: (context,
                    {required currentLength,
                    required isFocused,
                    required maxLength}) {
                  return Text(
                    "$currentLength/$maxLength",
                    style: TextStyle(decoration: TextDecoration.underline),
                  );
                },
                validator: (value) {
                  if (value!.length < 4) {
                    return 'too short';
                  }
                  return null;
                },
              ),
              // switch
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      print("the form is validate");
                    }
                  },
                  child: Text('password'))
            ],
          )),
    );
  }
}
