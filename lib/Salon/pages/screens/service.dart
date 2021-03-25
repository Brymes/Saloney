import 'package:flutter/material.dart';
import 'package:starter_project/Salon/pages/screens/add_newservice.dart';

class ServiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Material(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        child: Row(
                          children: [
                            Text('Products'),
                            SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.black54,
                              maxRadius: 8,
                              child: FittedBox(
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text('20',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    FlatButton.icon(
                      color: Color(0xff9477cb),
                      icon: Icon(Icons.add, color: Colors.white),
                      label: Text(
                        'Add New',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddNewService()));
                      },
                    )
                  ],
                ),
              ),
            ),
            TabBar(
              indicatorColor: Color(0xff9477cb),
              labelColor: Color(0xff9477cb),
              unselectedLabelColor: Colors.black54,
              tabs: [
                Tab(
                  text: 'PUBLISHED',
                ),
                Tab(
                  text: 'UNPUBLISHED',
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: TabBarView(
                  children: [

                    PublishedService(),
                    PublishedService(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PublishedService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingRowColor: MaterialStateColor.resolveWith((states) => Colors.grey[300]),
      columns: [
        DataColumn(label: Text(
            'Product Name',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
        )),
        DataColumn(label: Text(
            'Image',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
        )),
        DataColumn(label: Text(
            'Actions',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
        )),
      ],
      rows: [
        for(int i = 0; i < 5; i++)
        DataRow(cells: [
          DataCell(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text('Carrot',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),),
                  SizedBox(height: 3),
                  Text('DJNAZA',
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              )
          ),
          DataCell(
            SizedBox(
              height: 50,
    width: 50,
      child: Image.asset('assets/2.png'),
    ),

          ),
          DataCell(Icon(Icons.more_vert_outlined)),
        ]),
      ],
    );
  }
}

