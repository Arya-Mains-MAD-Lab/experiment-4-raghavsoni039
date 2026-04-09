import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const MaterialApp(
      home: RSSPage(),
    );
  }
}
class RSSPage extends StatefulWidget{
  const RSSPage({super.key});
  @override
  State<RSSPage> createState()=> _RSSPageState();
}
class _RSSPageState extends State<RSSPage>{
  String data = "Loading ...";
  @override
  void initState(){
    super.initState();
    fetchData();
  }
  Future<void> fetchData() async{
    final response = await http.get(
      Uri.parse("https://api.allorigins.win/raw?url=https://www.w3schools.com/xml/note.xml"),
    );
    setState(() {
      data = response.body;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("RSS Feed"),
      ),
      body: Padding(padding: const EdgeInsetsGeometry.all(16),
      child: SingleChildScrollView(
        child: Text(data),
      ),),
    );
  }
}