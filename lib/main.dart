import 'package:bloc_pattern/cubit/FriendsCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (context)=> FriendsCubit(),
          child: MyHomePage(title: 'Flutter Demo Home Page')
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [

         Expanded(
           child: BlocBuilder<FriendsCubit,InitialFriends>(

               builder: (context,state){
                 return ListView.builder(
                     itemCount: state.friendsName.length,
                     itemBuilder: (context,index){
                       return Card(
                         elevation: 3,
                         child: ListTile(
                           leading: Text(index.toString()),
                           title: Text(state.friendsName[index]),
                           trailing: IconButton(icon: Icon(Icons.remove,color: Colors.red,), onPressed: ()=> BlocProvider.of<FriendsCubit>(context).removeAFriend(index)),
                         ),
                       );
                     }
                 );
               }

           ),
         ),

        ],
      )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
