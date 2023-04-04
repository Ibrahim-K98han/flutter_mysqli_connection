import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mysqli_connection/add_edit_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  Future getData() async {
    var url = 'http://192.168.0.104/php_mysql_crud/read.php';
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  // Future<void> insertrecored() async {
  //   if (name.text != "" || email.text != "" || password.text != "") {
  //     try {
  //       String uri = "http://localhost/practice_api/insert_record.php";
  //       var res = await http.post(Uri.parse(uri),body: {
  //         "name":name.text,
  //         "email":email.text,
  //         "password":password.text
  //       });
  //       var response = jsonDecode(res.body);
  //       if(response["success"]=="true"){
  //         print("Record Inserted");
  //       }else{
  //         print("some issue");
  //       }
  //     } catch (e) {
  //       print(e);
  //     }
  //   } else {
  //     print("please Fill All fields");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('MySql Crud'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
        onPressed: (){
            Get.to(AddEditPage());
        },
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      List list = snapshot.data;
                      return ListTile(
                        leading: InkWell(
                          child: Icon(Icons.edit),
                          onTap: () {
                            debugPrint('Edit Clicked');
                          },
                        ),
                        title: Text(
                            '${list[index]['firstname']} ${list[index]['lastname']}'),
                        subtitle: Text('${list[index]['phone']}'),
                        trailing: InkWell(
                          child: Icon(Icons.delete),
                          onTap: () {
                            debugPrint('Delete Clicked');
                          },
                        ),
                      );
                    },
                  )
                : CircularProgressIndicator();
          },
        ),

        // Column(
        //   children: [
        //     Container(
        //       margin: EdgeInsets.all(20),
        //       child: TextFormField(
        //         controller: firstName,
        //         decoration: InputDecoration(
        //             border: OutlineInputBorder(),
        //             label: Text('Enter the first Name')),
        //       ),
        //     ),
        //     Container(
        //       margin: EdgeInsets.all(20),
        //       child: TextFormField(
        //         controller: lastName,
        //         decoration: InputDecoration(
        //             border: OutlineInputBorder(),
        //             label: Text('Enter the Last Name')),
        //       ),
        //     ),
        //     Container(
        //       margin: EdgeInsets.all(20),
        //       child: TextFormField(
        //         controller: phone,
        //         decoration: InputDecoration(
        //             border: OutlineInputBorder(), label: Text('Enter Phone')),
        //       ),
        //     ),
        //     Container(
        //       margin: EdgeInsets.all(20),
        //       child: TextFormField(
        //         controller: address,
        //         decoration: InputDecoration(
        //             border: OutlineInputBorder(),
        //             label: Text('Enter address')),
        //       ),
        //     ),
        //     ElevatedButton(
        //         onPressed: () {
        //          // insertrecored();
        //         },
        //         child: Text('Insert'))
        //   ],
        // ),
      ),
    );
  }
}
