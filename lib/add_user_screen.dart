import 'dart:math';

import 'package:flutter/material.dart';

class AddUserScreen extends StatefulWidget {
  @override
  _AddUserScreenState createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {

  String nome, profissao;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Usuário'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Nome', border: OutlineInputBorder()),
                  validator: (String nome) => nome.isEmpty ? 'Campo obrigatório' : null,
                  onSaved: (String n) => nome = n,
                ),
                SizedBox(height: 12.0,),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Profissão', border: OutlineInputBorder()),
                  validator: (String profissao) => profissao.isEmpty ? 'Campo obrigatório' : null,
                  onSaved: (String p) => profissao = p,
                ),
                SizedBox(height: 12.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      width: 160.0,
                      child: RaisedButton(
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            formKey.currentState.save();
                            Navigator.pop(context, {
                              'id': Random().nextInt(999),
                              'nome': nome,
                              'profissao': profissao
                            });
                          }
                        },
                        color: Colors.green,
                        child: Text('Salvar', style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
