import 'package:flutter/material.dart';
import 'package:form/widgets/input.dart';
import "package:intl/intl.dart";

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Activities"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 30,right: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
                InputFields(title: "Title", hint: "enter title here"),
                InputFields(title: "Description", hint: "enter description here"),
                InputFields(title: "Date", hint: DateFormat.yMd().format(_selectedDate) ),
            ],
          )),
      ),
    );
  }
}