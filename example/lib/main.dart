import 'package:custom_text_field/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CustomTextField Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CustomTextFieldExample(),
    );
  }
}


class CustomTextFieldExample extends StatefulWidget {
  const CustomTextFieldExample({Key? key}) : super(key: key);

  @override
  _CustomTextFieldExampleState createState() => _CustomTextFieldExampleState();
}

class _CustomTextFieldExampleState extends State<CustomTextFieldExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Text Field"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                hint: "text field without icons",
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                height: 40,
                obscure: true,
                hint: "obscure text field",
              ),
              SizedBox(
                height: 50,
              ),
              CustomTextField(
                height: 25,
                hint: "text field with leading icon",
                leadingIcon: Icon(Icons.email),
              ),
              SizedBox(
                height: 50,
              ),
              CustomTextField(
                height: 30,
                hint: "text field with trailing icon",
                trailingIcon: Icon(Icons.search),
              ),
              SizedBox(
                height: 50,
              ),
              Flexible(
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        height: 20,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: CustomTextField(
                        height: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Flexible(
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        height: 20,
                        hint:  "Text field",
                        fillColor: Colors.pink,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: CustomTextField(
                        height: 20,
                        hint: "text field",
                        fillColor: Colors.orange,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: CustomTextField(
                        height: 20,
                        hint: "text field",
                        fillColor: Colors.blue,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
