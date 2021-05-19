import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);
  final url =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPg_r7-255SHFnzImyFmu97bCtrEhNPvmPjExskeTtXFTWePPjOYC43yO1qBf-2XJ0mB8&usqp=CAU";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.green,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountEmail: Text('tsaini063@gmail.com'),
                  accountName: Text('Tarun Saini'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(url),
                  ),
                )),
            ListTile(
              leading: Icon(CupertinoIcons.home,color: Colors.white,),
                title: Text(
                  'Home',
                  textScaleFactor: 1.2
                  ,style: TextStyle(
                    color: Colors.white),
                )
            ),
            ListTile(
                leading: Icon(CupertinoIcons.profile_circled,color: Colors.white,),
                title: Text(
                  'Profile',
                  textScaleFactor: 1.2
                  ,style: TextStyle(
                    color: Colors.white),
                )
            ),
            ListTile(
                leading: Icon(CupertinoIcons.eject,color: Colors.white,),
                title: Text(
                  'Exit',
                  textScaleFactor: 1.2
                  ,style: TextStyle(
                    color: Colors.white),
                )
            )
          ],
        ),
      ),
    );
  }
}
