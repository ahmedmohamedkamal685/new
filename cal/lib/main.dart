import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyCalculator());
}

class MyCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      home:Calculator(),
    );

  }

}

class Calculator extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _Calculator();
  }
}
class _Calculator extends State<Calculator> {
  String text = '0';
  double num1 = 0;
  double num2 = 0;
  String result = '0';
  String finalresult = '0';
  String ope = '';
  String preope = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                        text,
                        style: TextStyle(color: Colors.white,
                            fontSize: 60

                        ),
                        maxLines: 1,
                        textAlign: TextAlign.right,
                      )
                  )
                ],

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  button("c", Colors.yellow),
                  button("+/-", Colors.grey),
                  button("%", Colors.grey),
                  button("/", Colors.orange),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  button("7", Colors.yellow),
                  button("8", Colors.grey),
                  button("9", Colors.grey),
                  button("*", Colors.orange),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  button("4", Colors.yellow),
                  button("5", Colors.grey),
                  button("6", Colors.grey),
                  button("-", Colors.orange),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  button("1", Colors.yellow),
                  button("2", Colors.grey),
                  button("3", Colors.grey),
                  button("+", Colors.orange),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  button("0", Colors.yellow),
                  button("00", Colors.grey),
                  button(".", Colors.grey),
                  button("=", Colors.orange),

                ],
              ),

            ]
        ),

      ),
    );
  }

  Widget button(String btnTxt, Color color) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: RaisedButton(
        onPressed: () {calculate(btnTxt);},
        child: Text(btnTxt,
          style: TextStyle(
              fontSize: 30
          ),
        ),
        color: color,
        padding: EdgeInsets.all(20),
        shape: CircleBorder(),
      ),
    );
  }

  void calculate(txtBtn) {
    if (txtBtn == 'c') {
       text = '0';
       num1 = 0;
       num2 = 0;
       result = '';
       finalresult = '0';
       ope = '';
       preope = '';
    }else if(ope=='='&&txtBtn=='='){
      switch(preope){
        case'+':
          finalresult=add();
          break;
        case'-':
          finalresult=sub();
          break;
        case'*':
          finalresult=mul();
          break;
        case'/':
          finalresult=div();
          break;
      }
    }
    else if( txtBtn=='+'|| txtBtn=='-'|| txtBtn=='*'|| txtBtn=='/'||txtBtn=='='){
      if(num1==0){
        num1=double.parse(result);
      }else{
        num2=double.parse(result);
      }
      switch(ope){
        case'+':
          finalresult=add();
          break;
        case'-':
          finalresult=sub();
          break;
        case'*':
          finalresult=mul();
          break;
        case'/':
          finalresult=div();
          break;
      }
      preope=ope;
      ope=txtBtn;
      result='';
    }else if(txtBtn=='%'){
      result=(num1/100).toString();
      finalresult=result;
    }else if(txtBtn=='.'){
     if(!result.contains('.'))
       result += '.';
     finalresult=result;
    }else if(txtBtn=='+/-'){
      result.startsWith('-')? result=result.substring(1):result='-' + result;
      finalresult=result;
    }
    else{
      if(result=='0')
        result=txtBtn;
      else
      result=result+txtBtn;
      finalresult=result;
    }
    setState(() {
      text=finalresult;
    });
  }
  String add(){
    result=(num1+num2).toString();
    num1=double.parse(result);
    return result;
  }
  String sub(){
    result=(num1-num2).toString();
    num1=double.parse(result);
    return result;
  }
  String mul(){
    result=(num1*num2).toString();
    num1=double.parse(result);
    return result;
  }
  String div(){
    result=(num1/num2).toString();
    num1=double.parse(result);
    return result;

  }
}
