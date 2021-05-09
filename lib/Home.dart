import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'ToDo.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

//Color blue = Color.fromARGB(255,0,0,200);
//Color blue = Color.fromARGB(255,221,160,221);

Color bg = Color.fromARGB(255,35,39,42);
Color blue = Color.fromARGB(255,144,160,193);

class _HomeState extends State<Home> {
  int NbIndex = 0;

  addToDo(String input){
    ToDo.ToDoList.add(input);
    print(ToDo.ToDoList);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> bodyWidgets = [
    Center(
       // child: ListView.builder(
        //  itemCount: ToDo.ToDoList.length,
          //itemBuilder: (context, i) => ToDoContainer(index: i,)),
      //),
      ),
    ];
    return SafeArea(
      child: Scaffold(
        body: bodyWidgets[NbIndex],
        backgroundColor: Colors.black,
        appBar: AppBar(
            backgroundColor: blue,
            elevation: 0.0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left:0.0),
                  child: FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.black,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: blue,
                  ),
                  accountName:Text('Rawan AlShami'),
                  accountEmail: Text(
                    'RawanAlShami@gmail.com',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Color(0xFF56ccf2)
                        : Colors.black,
                    child: Text("RA",
                      style: TextStyle(fontSize: 40,
                          color: Colors.white),),
                  ),
                ),
                ListTile(
                  title: Text(
                      'Templates',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                        fontSize: 16,
                      )
                  ),
                  contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                  leading: Icon(Icons.bookmark_border, color: blue,size: 20.0),
                ),
                ListTile(
                  title: Text(
                      'Categories',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                        fontSize: 14,
                      )
                  ),
                  contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                  leading: Icon(Icons.widgets_outlined,color: blue,size: 20.0),
                ),
                ListTile(
                  title: Text(
                      'Analytics',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                        fontSize: 16,
                      )),
                  contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                  leading: Icon(Icons.show_chart, color: blue,size: 20.0),
                ),
                ListTile(
                  title: Text(
                      'Statistics',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                        fontSize: 16,
                      )),
                  contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                  leading: Icon(Icons.bubble_chart, color: blue,size: 20.0),
                ),
                ListTile(
                  title: Text(
                      'Settings',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                        fontSize: 16,
                      )),
                  contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                  leading: Icon(Icons.settings, color: blue,size: 20.0),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.black54,
          backgroundColor: blue,
          child: Icon(Icons.add_circle_outline,color: Colors.white,),
          mini: true,
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_)=>AddTaskScreen(),
              ),
          ),
        ),
      ),
    );
  }
}

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final formkey = GlobalKey<FormState>();
  String title=" ";
  String priority;
  DateTime _date=DateTime.now();
  TextEditingController _dateController=TextEditingController();

  final DateFormat _dateformatter= DateFormat('MMM dd,yyyy');
  final List<String> priorities=['Normal','Important','Very Important'];
  _handleDatePicker() async{
    final DateTime date=await showDatePicker(
        context: context,
        initialDate:_date,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
    );
    if(date!=null && date!=_date)
      setState(() {
        _date=date;
      });
    _dateController.text=_dateformatter.format(date);
  }

  submit() {
    if(formkey.currentState.validate()){
      formkey.currentState.save();
      print('$title,$_date, $priority ');
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(//SafeArea(
        child:Scaffold(
            backgroundColor: Colors.black,
            body:Container(
                padding: EdgeInsets.only(top:40.0,right: 20.0,left: 20.0),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget> [
                    GestureDetector(onTap: ()=>Navigator.pop(context),
                      child:Icon(Icons.arrow_back,color:blue,size:20),
                    ),
                    SizedBox(height:40.0),
                    Text(
                      'Add New Task',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Form(
                      key:formkey,
                      child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.0),
                              child:TextFormField(
                                style: TextStyle(fontSize: 16.0,color: Colors.white),
                                decoration: InputDecoration(
                                  labelText: 'Title',
                                  labelStyle: TextStyle(fontSize: 16.0,color: Colors.white,fontWeight: FontWeight.bold),
                                  border:OutlineInputBorder(
                                    borderRadius:BorderRadius.circular(10.0,),
                                  ),
                                ),
                                validator: (input)=>input.trim().isEmpty?'Please Enter A Task Title':null,
                                onSaved: (input)=>title=input,
                                initialValue: title,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.0),
                              child:TextFormField(
                                readOnly: true,
                                controller: _dateController,
                                style: TextStyle(fontSize: 16.0,color: Colors.white),
                                onTap: _handleDatePicker,
                                decoration: InputDecoration(
                                  labelText: 'Date',
                                  labelStyle: TextStyle(fontSize: 16.0,color: Colors.white,fontWeight: FontWeight.bold),
                                  border:OutlineInputBorder(
                                    borderRadius:BorderRadius.circular(10.0,),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.0),
                              child:DropdownButtonFormField(
                                dropdownColor: bg,
                                icon:Icon(Icons.arrow_drop_down_circle_outlined,color: Colors.white,size:20),
                                items: priorities.map((String priority){
                                  return DropdownMenuItem(
                                    value:priority,
                                    child:Text(
                                      priority,
                                      style:TextStyle(
                                          color:Colors.white,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                style: TextStyle(fontSize: 16.0,color:Colors.black),
                                decoration: InputDecoration(
                                  labelText: 'Priority',
                                  labelStyle: TextStyle(fontSize: 16.0,color: Colors.white,fontWeight: FontWeight.bold),
                                  border:OutlineInputBorder(
                                    borderRadius:BorderRadius.circular(10.0,),
                                  ),
                                ),
                                validator: (input)=>priority==null
                                    ?'Please Select Level Of Priority':null,
                                onChanged: (value){
                                  setState(() {
                                    priority=value;
                                  });
                                  },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical:20.0),
                              height: 49.0,
                              width:double.infinity,
                              decoration: BoxDecoration(
                                color:blue,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: FlatButton(
                                child: Text(
                                  'Add',
                                  style:TextStyle(
                                    color:Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: submit,
                              ),
                            )
                          ]
                      ),
                    )
                  ],
                )
            ),
        ),
    );
  }
}

class ToDoContainer extends StatefulWidget {
  @override
  _ToDoContainerState createState() => _ToDoContainerState();
}

class _ToDoContainerState extends State<ToDoContainer> {
  final int index;
  _ToDoContainerState({this.index,});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Text(
            ToDo.ToDoList[index],
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}