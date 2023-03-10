import 'package:flutter/material.dart';
import 'package:pratic1/Modal.dart';

class code extends StatefulWidget {
  const code({Key? key}) : super(key: key);

  @override
  State<code> createState() => _codeState();
}

class _codeState extends State<code> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtid = TextEditingController();
  TextEditingController txtbio = TextEditingController();

  List<modal> AllData = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: txtname,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Product name",
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: txtid,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Product Price",
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: txtbio,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Product Quantity"),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () {
                   modal m1 = modal(name: txtname.text,id: txtid.text,bio: txtbio.text);
                   setState(() {
                     AllData.add(m1);
                   });
                 // print("${AllData[0].name}");
                },
                child: Text("Add"),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'PAGE',arguments: AllData);
                },
                child: Text("Submit"),
              ),
              SizedBox(height: 10,),
              Expanded(
                child: ListView.builder(
                  itemCount: AllData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("${AllData[index].name}"),
                      subtitle: Text("${AllData[index].bio}"),
                      leading: Text("${AllData[index].id}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(onPressed: () {
                            txtname = TextEditingController();
                            txtid = TextEditingController();
                            txtbio = TextEditingController();
                            showDialog(context: context, builder: (context) {
                              return AlertDialog(
                                content: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      controller: txtname,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        hintText: "Product name",
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    TextField(
                                      controller: txtid,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        hintText: "Product Price",
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    TextField(
                                      controller: txtbio,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          hintText: "Product Quantity"),
                                    ),
                                    SizedBox(height: 10,),
                                    ElevatedButton(onPressed: () {
                                      setState(() {
                                        String name = txtname.text;
                                        String id = txtid.text;
                                        String bio = txtbio.text;
                                        modal m1 = modal(name: name,id: id,bio: bio);
                                        AllData[index] = m1;
                                        Navigator.pop(context);
                                      });
                                    }, child: Text("Edit"),),
                                  ],
                                ),
                              );
                            },);
                          }, icon: Icon(Icons.edit),),
                          InkWell(
                            onTap: () {
                              setState(() {
                                AllData.removeAt(index);
                              });
                            },
                              child: Icon(Icons.delete),),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
