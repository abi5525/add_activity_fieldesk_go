import 'package:flutter/material.dart';

class InputFields extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  const InputFields({super.key, required this.title, required this.hint, this.widget, this.controller,});

  @override
  Widget build(BuildContext context) {
    return Column (
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Text(
          title,style: TextStyle(
            fontSize: 15,
            
          ),
        ),
        SizedBox(height: 3,),
        Container(
          height: 52,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xffb3b3b3),
              width:1.0,
              
            ),
            borderRadius: BorderRadius.circular(5)
          ),
          child:Row(
            children: [
              Expanded(child: TextFormField(
                readOnly: widget==null?false:true,
                autofocus: false,
                controller: controller,
                decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 128, 126, 126),
                  fontWeight: FontWeight.w500
                ),
                
                // focusedBorder: UnderlineInputBorder(
                //   borderSide: BorderSide(
                //     color:Color(0xffb3b3b3),
                //     width: 0
                //   )
                // ),
                // enabledBorder:  UnderlineInputBorder(
                //   borderSide: BorderSide(
                //     color:Color(0xffb3b3b3),
                //     width: 0
                //   )
                // ),
                contentPadding: EdgeInsets.all(10),
                
                ),
                
              )),

              widget == null ? Container(): Container(child: widget,)

              
            ],
          )
        ),
        SizedBox(height:15)
      ],

    );
  }
}