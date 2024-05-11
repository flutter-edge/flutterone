import 'package:first/about/aboutController.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  AboutController _controller=AboutController();
  int data=0;
  @override
  void initState() {
    _controller.inputNumber.add(data);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text("About Us"),
      ),
      body: Container(
        child: Column(
          children: [
            Center(child: Text("About Us"),),
            ElevatedButton(
              child: Text("Go to Home"),
              onPressed: () {
                Navigator.of(context)
                    .pop();
              },
            ),
            SizedBox(height: 15,),
            StreamBuilder<int>(
              stream: _controller.outputNumber,
              builder: (context, snapshot) {
                return Text(snapshot.hasData ? snapshot.data.toString() : '0',style: TextStyle(fontSize: 30),);
              },
            ),
            SizedBox(height: 15,),
            StreamBuilder<int>(
              stream: _controller.outputNumber,
              builder: (context, snapshot) {
                return Text(snapshot.hasData ? snapshot.data.toString() : '0',style: TextStyle(fontSize: 30),);
              },
            ),
            SizedBox(height: 10,),
          Obx(()=> Text(_controller.mynumber.toString(),style: TextStyle(fontSize: 35,color: Colors.redAccent),)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: FaIcon(FontAwesomeIcons.arrowDown91),
        onPressed: (){
         // _controller.inputNumber.add(data++);
          _controller.inputNumber.add(++data);
          print(data);
          _controller.mynumber.value=data;
        },
      ),
    );
  }
}
