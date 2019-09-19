import 'package:flutter/material.dart';

import 'signin_screen.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/logo.png',),
                SizedBox(height: 12.0,),
                Text('Crie um login e senha para acessar o sistema', style: TextStyle(color: Colors.green),),
                SizedBox(height: 12.0,),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Login', border: OutlineInputBorder()),
                ),
                SizedBox(height: 12.0,),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Senha', border: OutlineInputBorder()),
                ),
                SizedBox(height: 12.0,),
                SizedBox(
                  width: 200.0,
                  child: RaisedButton(
                    color: Colors.green,
                    onPressed: () {},
                    child: Text('Registrar', style: TextStyle(color: Colors.white),),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SigninScreen()));
                  },
                  child: Text('Já possui uma conta? Entrar!', style: TextStyle(color: Colors.green),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
