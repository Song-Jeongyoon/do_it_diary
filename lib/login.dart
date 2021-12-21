import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';


class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> with SingleTickerProviderStateMixin {
  TextEditingController? _idTextController;
  TextEditingController? _pwTextController;

  @override
  void initState() {
    super.initState();
    _idTextController = TextEditingController();
    _pwTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Do it! Diary'),
        ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget> [
              SizedBox(
                width: 350,
                child: TextField(
                  controller: _idTextController,
                  maxLines: 1,
                  decoration: InputDecoration(labelText: '아이디',
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 350,
                child: TextField(
                  controller: _pwTextController,
                  obscureText: true, // 비밀번호 입력시 문자가 보이지 않게
                  maxLines: 1,
                  decoration: InputDecoration(labelText: '비밀번호',
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  if(_idTextController!.value.text.length == 0 ||
                      _pwTextController!.value.text.length == 0) {
                    makeDialog('아이디와 비밀번호를 입력해주세요');
                  } else {
                    // 아이디 혹은 비밀번호가 맞지 않습니다.
                  }},
                child: Text('로그인',
                            style: TextStyle(color: Colors.black),),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.amber,
                              minimumSize: Size(350.0 , 40.0)),),

                SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/sign');
                },
                child: Text('회원가입',
                  style: TextStyle(color: Colors.black),),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.yellow,
                    minimumSize: Size(100.0 , 40.0),
                  )),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),

    );
  }

  void makeDialog(String text) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(text),
        );
      });
  }

}
