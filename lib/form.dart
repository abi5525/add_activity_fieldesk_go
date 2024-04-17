import 'package:flutter/material.dart';
import 'package:form/widgets/input.dart';
import "package:intl/intl.dart";
import 'package:file_picker/file_picker.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  DateTime _selectedDate = DateTime.now();
  // String _endTime = "9:30 PM";
  // String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();

  //PRIORIY DROPDOWN
  String _selectedPriority = "low";
  List<String> priority = ["low", "medium", "high"];

  Future<void> onSelected(value) async {
    setState(() {
      _selectedPriority = value;
    });
  }
  //PRIORITY DROPDOWN

  //TASK DROPDOWN
    String _selectedTask = "select your task";
  List<String> task = ["task1", "task2", "task3"];

  Future<void> taskSelected(value) async {
    setState(() {
      _selectedTask = value;
    });
  }

  //TASK DROPDOWN

  //TIME PICKER
  TimeOfDay _startTime = TimeOfDay.now();

  Future<void> _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _startTime,
    );
    if (newTime != null) {
      setState(() {
        _startTime = newTime;
      });
    }
  }

  TimeOfDay _endTime = TimeOfDay.now();

  Future<void> _endTimeSelect() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _endTime,
    );
    if (newTime != null) {
      setState(() {
        _endTime = newTime;
      });
    }
  }
  //TIME PICKER

  //FILE UPLOAD
  String _filePath = 'upload documents here';

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result != null) {
      setState(() {
        _filePath = result.files.single.path!;
      });
    }
  }

  //FILE UPLOAD

  @override
  Widget build(BuildContext context) {
    //DATE PICKER
    _getDateFromUser() async {
      DateTime? _pickerDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2030));

      if (_pickerDate != null) {
        setState(() {
          _selectedDate = _pickerDate;
        });
      } else {
        print("no selection");
      }
    }
    //DATE PICKER

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Activities"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: SingleChildScrollView(
            child: Column(
          children: [
            InputFields(title: "Title", hint: "enter title here"),
            InputFields(title: "Description", hint: "enter description here"),
            Row(
              children: [
                Expanded(
                  child: InputFields(
                    title: "Priority",
                    hint: _selectedPriority,
                    widget: DropdownButton<String>(
                      icon: Icon(Icons.keyboard_arrow_down),
                      underline: Container(
                        height: 0,
                      ),
                      onChanged: onSelected, // Callback for item selection
                      items: priority
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: InputFields(
                                title: "Task",
                                hint: _selectedTask,
                                widget: DropdownButton<String>(
                  icon: Icon(Icons.keyboard_arrow_down),
                  
                  underline: Container(
                    height: 0,
                    
                  ),
                  onChanged: taskSelected, // Callback for item selection
                  items: task
                      .map((String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          ))
                      .toList(),
                                ),
                              ),
                ),
              ],
            ),
             
            InputFields(
                title: "Date",
                hint: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(
                  onPressed: () {
                    _getDateFromUser();
                  },
                  icon: Icon(Icons.calendar_today_outlined),
                  color: Color.fromARGB(255, 128, 126, 126),
                )),
            Row(
              children: [
                Expanded(
                    child: InputFields(
                  title: "Start Time",
                  hint: _startTime.format(context),
                  widget: IconButton(
                      onPressed: () {
                        _selectTime();
                      },
                      icon: Icon(Icons.access_time_rounded)),
                )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: InputFields(
                  title: "End Time",
                  hint: _endTime.format(context),
                  widget: IconButton(
                      onPressed: () {
                        _endTimeSelect();
                      },
                      icon: Icon(Icons.access_time_rounded)),
                )),
              ],
            ),
            InputFields(
              title: "Upload",
              hint: _filePath,
              widget: Container(
                decoration: BoxDecoration(
                  border: Border.all(color:Color(0xfffc8019)),
                  borderRadius: BorderRadius.circular(3),
                  color: Color(0xfffc8019),
                ),
                child: IconButton(
                  onPressed: () {
                    _pickFile();
                  },
                  icon: Icon(Icons.file_upload_outlined),
                  color: Colors.white,
                ),
              ),
            ),
            InputFields(title: "Remarks", hint: "enter remarks here"),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Add",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xfffc8019),
                      minimumSize: Size(90, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                      )
                          
                      ),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}

