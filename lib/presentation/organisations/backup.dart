//  panel: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       left: 24, right: 24, top: 0, bottom: 0),
//                   child: Stack(
//                     clipBehavior: Clip.none, children: <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.only(top: 16, bottom: 16),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(8.0),
//                                 bottomLeft: Radius.circular(8.0),
//                                 bottomRight: Radius.circular(8.0),
//                                 topRight: Radius.circular(8.0)),
//                             boxShadow: <BoxShadow>[
//                               BoxShadow(
//                                   color: Colors.grey.withOpacity(0.4),
//                                   offset: Offset(1.1, 1.1),
//                                   blurRadius: 10.0),
//                             ],
//                           ),
//                           child: Stack(
//                             alignment: Alignment.topLeft,
//                             children: <Widget>[
//                               ClipRRect(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(8.0)),
//                                 child: SizedBox(
//                                   height: 74,
//                                   child: AspectRatio(
//                                     aspectRatio: 1.714,
//                                     child: Image.asset(
//                                         "assets/fitness_app/back.png"),
//                                   ),
//                                 ),
//                               ),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: <Widget>[
//                                   Row(
//                                     children: <Widget>[
//                                       Padding(
//                                         padding: const EdgeInsets.only(
//                                           left: 100,
//                                           right: 16,
//                                           top: 16,
//                                         ),
//                                         child: Text(
//                                           "You're doing great!",
//                                           textAlign: TextAlign.left,
//                                           style: TextStyle(
//                                             // fontFamily:
//                                             //     FitnessAppTheme.fontName,
//                                             fontWeight: FontWeight.w500,
//                                             fontSize: 14,
//                                             letterSpacing: 0.0,
//                                             color:
//                                                 Colors.deepPurple,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                       left: 100,
//                                       bottom: 12,
//                                       top: 4,
//                                       right: 16,
//                                     ),
//                                     child: Text(
//                                       "Keep it up\nand stick to your plan!",
//                                       textAlign: TextAlign.left,
//                                       style: TextStyle(
//                                         // fontFamily: FitnessAppTheme.fontName,
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: 10,
//                                         letterSpacing: 0.0,
//                                         color: Colors.grey
//                                             .withOpacity(0.5),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         top: -16,
//                         left: 0,
//                         child: SizedBox(
//                           width: 110,
//                           height: 110,
//                           child: Image.asset("assets/fitness_app/runner.png"),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],



//            Widget appBar() {
//     return SizedBox(
//       height: AppBar().preferredSize.height,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.only(top: 8, left: 8),
//             child: Container(
//               width: AppBar().preferredSize.height - 8,
//               height: AppBar().preferredSize.height - 8,
//             ),
//           ),
//           Expanded(
//             child: Center(
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 4),
//                 child: Text(
//                   'Flutter UI',
//                   style: TextStyle(
//                     fontSize: 22,
//                     color: Colors.black87,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 8, right: 8),
//             child: Container(
//               width: AppBar().preferredSize.height - 8,
//               height: AppBar().preferredSize.height - 8,
//               color: Colors.white,
//               child: Material(
//                 color: Colors.transparent,
//                 child: InkWell(
//                   borderRadius:
//                       BorderRadius.circular(AppBar().preferredSize.height),
//                   child: Icon(
//                     multiple ? Icons.dashboard : Icons.view_agenda,
//                     color: Colors.grey,
//                   ),
//                   onTap: () {
//                     setState(() {
//                       multiple = !multiple;
//                     });
//                   },
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }