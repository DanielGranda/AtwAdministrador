
import 'package:administrador/utils/hexaColor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'botonAddPlantel.dart';
import 'botonAddProducto.dart';
import 'botonAddRoles.dart';


class RegistroUnidadEducativa extends StatefulWidget {
  RegistroUnidadEducativa({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new HomeWidgetState();
  }
}

class HomeWidgetState extends State<RegistroUnidadEducativa>
    with SingleTickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    new Tab(text: "Registro del Plantel"),
    new Tab(text: "Registro de Roles"),
    new Tab(text: "Registro del Producto"),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: cabecera(context),
      body: new TabBarView(controller: _tabController, children: <Widget>[
        AddPlantel(),
        AddRolesPlantel(),
        AddProducto(),
      ]),
    );
  }

  AppBar cabecera(BuildContext context) {
    return new AppBar(
      leading: IconButton(
        icon: Icon(
          
          FontAwesomeIcons.chevronCircleLeft,
          color: Color(hexColor('#61B4E5')),
          size: 30,
        ),
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'agregarUe');
        },
      ),
      backgroundColor: Colors.white,
      title: Text('Registro Unidad Educativa'.toUpperCase(),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(hexColor('#5CC4B8')),
          )),
      bottom: new TabBar(
        isScrollable: true,
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: new BubbleTabIndicator(
          indicatorHeight: 25.0,
          indicatorColor: Color(hexColor('#3A4A64')),
          tabBarIndicatorSize: TabBarIndicatorSize.tab,
        ),
        tabs: tabs,
        controller: _tabController,
      ),
    );
  }
}

class RegistroPlantel extends StatelessWidget {
  const RegistroPlantel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
                image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.dstIn),
              image: AssetImage("assets/backGround/FondoBlancoATW.png"),
              fit: BoxFit.contain,
            )),
          ),
         /*  StreamBuilder(
            stream: Firestore.instance.collection('user').document(user.uid)
                                  .collection('registroMonitorEps').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              List<DocumentSnapshot> docs = snapshot.data.documents;
              return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> data = docs[index].data;
                  return ListTile(
                    leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/imgEps/icoConductor.png') ,
                    ),
                    title: Row(
                      children: <Widget>[
                        Text(data['apellidos'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                        SizedBox(width:3,),
                        Text(data['nombre'], style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    subtitle: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                 Row(
                                   children: <Widget>[
                                     Icon(FontAwesome.id_badge, color: Colors.grey,),
                                     Text(data['cedula']),
                                   ],
                                 ),
                                 SizedBox(height: 5,),
                                 Row(
                                   children: <Widget>[
                                     Icon(FontAwesome.phone, color: Colors.grey,),
                                     Text(data['celular']),
                                   ],
                                 ),
                              ],
                            ),
                            Expanded(child: SizedBox()),
                             Icon(FontAwesome.edit, color: Color(hexColor('#F6C34F')),),
                                    SizedBox(width: 15,),
                             Icon(FontAwesome.trash, color: Color(hexColor('#E86A87')),),
                          ],
                        ),
                        Divider(color: Color(hexColor('#3A4A64')),thickness: 3,)
                      ],
                    ),
               
                  );
                },
              );
            },
          ), */
          /*    StreamBuilder<QuerySnapshot>(
            
            stream:
                Firestore.instance
                                  .collection('user')
                                  .document(user.uid)
                                  .collection('registroMonitorEps')
                                  
        .snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return new Text('Loading...');
                default:
                  return new ListView(
                    children: snapshot.data.documents
                        .map((DocumentSnapshot document) {
                      return new ListTile(
                        title: new Text(document['nombre']),
                       // subtitle: new Text(document['apellidos']),
                      );
                    }).toList(),
                  );
                  
              }
            },
          ), */
        ],
      ),
    );
  }
}
