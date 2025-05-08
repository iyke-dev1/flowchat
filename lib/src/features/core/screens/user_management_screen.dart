// import 'package:flutter/material.dart';
//
//
// class UserManagementScreen extends StatelessWidget {
//   const UserManagementScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        body:  ListView.builder(
//             shrinkWrap: true,
//             itemCount: snapshot.data!.length,
//             itemBuilder: (c, index){
//               return
//                 Column(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                           color: Colors.blue.withAlpha(40),
//                           borderRadius: BorderRadius.circular(20)
//                       ),
//                       child: ListTile(
//                         iconColor: Colors.blue,
//                         leading: Icon(LineAwesomeIcons.user, size: 40,),
//                         title: Text("Name: ${snapshot.data![index].fullName}", style: Theme.of(context).textTheme.titleMedium,),
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(snapshot.data![index].phoneNo, style: Theme.of(context).textTheme.bodySmall,),
//                             Text(snapshot.data![index].email,style: Theme.of(context).textTheme.bodySmall,),
//                           ],
//                         ),
//                       ),
//                     ),
//
//                     SizedBox(height: 10,)
//                   ],
//                 );
//             });
//
//     );
//   }
// }
