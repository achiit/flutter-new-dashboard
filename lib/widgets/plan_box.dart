import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class PlansBox extends StatefulWidget {
  final String text;
  final Widget field;

  final String benefit1;
  final String benefit2;
  void Function()? onpressed;
  final String benefit3;

  PlansBox({
   
    required this.onpressed,
    required this.benefit1,
    required this.benefit2,
    required this.benefit3,
    required this.field,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  _PlansBoxState createState() => _PlansBoxState();
}

class _PlansBoxState extends State<PlansBox> {
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.text,
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Stack(
          children: [
            Container(
              height: 400,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                color: Color(0xff2A2D3E),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(width: 200, child: widget.field),
                    SizedBox(height: 20),
                    Text(
                      'Pay with Metamask',
                      style: GoogleFonts.lexend(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 10),
                  
                    ElevatedButton(
                      onPressed:widget.onpressed,
                         /*  _isLoading ? null : () => _makePostRequest(context) */
                      child: Ink(
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              AssetImage("assets/images/download.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Includes:',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildBulletPoint(widget.benefit1),
                            SizedBox(
                              height: 10,
                            ),
                            _buildBulletPoint(widget.benefit2),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
           
          ],
        ),
      ],
    );
  }

  

  Widget _buildBulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Image.asset(
            "assets/images/BULLET.png",
            height: 13,
          ),
        ),
        Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ],
    );
  }
}
