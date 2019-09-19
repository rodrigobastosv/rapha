import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'signup_screen.dart';

class SigninScreen extends StatefulWidget {

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  String login, senha;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/logo.png',),
                  SizedBox(height: 12.0,),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Login', border: OutlineInputBorder()),
                    validator: (String login) => login.isEmpty ? 'Campo Obrigatório' : null,
                    onSaved: (String l) => login = l,
                  ),
                  SizedBox(height: 12.0,),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Senha', border: OutlineInputBorder()),
                    validator: (String senha) => senha.isEmpty ? 'Campo Obrigatório' : null,
                    onSaved: (String s) => senha = s,
                  ),
                  SizedBox(height: 12.0,),
                  SizedBox(
                    width: 200.0,
                    child: RaisedButton(
                      color: Colors.green,
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          formKey.currentState.save();
                          print('Validar login: $login e senha: $senha');
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
                        }
                      },
                      child: Text('Entrar', style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupScreen()));
                    },
                    child: Text('Não tem uma conta? Criar conta!', style: TextStyle(color: Colors.green),),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
