import 'package:flutter/material.dart';

import 'add_user_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> users = [
    {'id': 1, 'nome': 'RodMaster', 'profissao': 'Lenhador'},
    {'id': 2, 'nome': 'FrangoLoiro', 'profissao': 'Padeiro'},
    {'id': 3, 'nome': 'Frango Barroso', 'profissao': 'Pertubador'},
    {'id': 4, 'nome': 'Anceta', 'profissao': 'Nada'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) => _buildItem(index),
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemCount: users.length
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        Map<String, dynamic> newUser = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddUserScreen()));
        if (newUser != null) {
          setState(() => users.add(newUser));
        }
      }, child: Icon(Icons.add),),
    );
  }

  _buildItem(int index) {
    final user = users[index];
    return ListTile(
      leading: CircleAvatar(child: Icon(Icons.person)),
      title: Text(user['nome']),
      subtitle: Text(user['profissao']),
      trailing: IconButton(onPressed: () =>_showConfirmDialog(index), icon: Icon(Icons.delete),),
    );
  }

  void _showConfirmDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Deseja excluir o usuário?"),
          content: Text("Essa operação é irreversível e excluirá o usuário permanentemente."),
          actions: <Widget>[
            FlatButton(
              child: Text("CANCELAR"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("EXCLUIR"),
              onPressed: () {
                Navigator.of(context).pop();
                print('Excluir usuário');
                setState(() {
                  users.removeAt(index);
                });
              },
            ),
          ],
        );
      },
    );
  }
}
