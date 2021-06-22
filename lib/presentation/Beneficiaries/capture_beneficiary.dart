// import 'package:alummahbio/application/state/beneficiary_state.dart';
import 'package:alummahbio/app_theme.dart';
import 'package:alummahbio/custom_drawer/custom_drawer.dart';
import 'package:alummahbio/utils/my_navigator.dart';
import 'package:alummahbio/values/branding_color.dart';
import 'package:alummahbio/values/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:alummahbio/application/models/beneficiary/model.dart';
import 'package:alummahbio/application/models/beneficiary/result.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:validators/validators.dart' as validator;

class CaptureBeneficiary extends StatelessWidget {
  // const CaptureBeneficiary({Key key}) : super(key: key);

  // String gender_id;
  // List<String> gender = [
  //   "Male",
  //   "Brazil",
  // ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // scaffoldBackgroundColor: AppTheme.notWhite.withOpacity(1),
        textTheme: AppTheme.textTheme,
        fontFamily: AppTheme.fontName,
        primarySwatch: brandingColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Capture Beneficiary'),
        ),
        body: CaptureForm(),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Container(
                      child: Column(
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.all(Radius.circular(100.0)),
                        elevation: 10,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.asset(
                            Images.logo,
                            width: 100,
                            height: 100,
                          ),
                        ),
                      )
                    ],
                  ))),
              CustomListTitle(Icons.home, 'Dashboard',
                  () => {MyNavigator.goToDashboard(context)}),
              CustomListTitle(Icons.group, 'Beneficiaries',
                  () => {MyNavigator.goToBeneficiaries(context)}),
              CustomListTitle(Icons.person, 'New Beneficiaries',
                  () => {MyNavigator.goToNewBeneficiaries(context)}),
              CustomListTitle(Icons.person, 'Profile',
                  () => {MyNavigator.goToProfile(context)}),
              CustomListTitle(Icons.power_settings_new, 'Logout',
                  () => {MyNavigator.goToSinIn(context)}),
            ],
          ),
        ),
      ),
    );
  }
}

class CaptureForm extends StatefulWidget {
  // const CaptureForm({ Key? key }) : super(key: key);

  @override
  _CaptureFormState createState() => _CaptureFormState();
}

class _CaptureFormState extends State<CaptureForm> {
  final _formKey = GlobalKey<FormState>();

  Beneficiaries model = Beneficiaries();

  @override
  Widget build(BuildContext context) {
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;

    return Form(
      key: _formKey,
      child: Column(children: <Widget>[
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            width: halfMediaWidth,
            child: MyTextFormField(
              hintText: 'First Name',
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Enter First Name';
                }
                return null;
              },
              onSaved: (String value) {
                model.firstName = value;
              },
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            width: halfMediaWidth,
            child: MyTextFormField(
              hintText: 'Middle Name',
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Enter Middle Name';
                }
                return null;
              },
              onSaved: (String value) {
                model.middleName = value;
              },
            ),
          ),
        ]),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            width: halfMediaWidth,
            child: MyTextFormField(
              hintText: 'Surname',
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Enter Surname';
                }
                return null;
              },
              onSaved: (String value) {
                model.firstName = value;
              },
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            width: halfMediaWidth,
            child: MyTextFormField(
              hintText: 'Gender',
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Enter Gender';
                }
                return null;
              },
              onSaved: (String value) {
                model.middleName = value;
              },
            ),
          ),
        ]),
        MyTextFormField(
          hintText: 'Last Name',
          isEmail: true,
          validator: (String value) {
                if (value.isEmpty) {
                  return 'Enter Middle Name';
                }
                return null;
              },
          onSaved: (String value) {
            model.lastName = value;
          },
        ),
        MyTextFormField(
          hintText: 'Email',
          isEmail: true,
          validator: (String value) {
            if (!validator.isEmail(value)) {
              return 'Please enter a valid email';
            }
            return null;
          },
          onSaved: (String value) {
            model.email = value;
          },
        ),
        MyTextFormField(
          hintText: 'Password',
          isPassword: true,
          validator: (String value) {
            if (value.length < 6) {
              return 'Password should be minimum 6 characters';
            }

            _formKey.currentState.save();
            return null;
          },
          onSaved: (String value) {
            model.password = value;
          },
        ),
        MyTextFormField(
          hintText: 'Confirm Password',
          isPassword: true,
          validator: (String value) {
            if (value.length < 7) {
              return 'Password should be minimum 6 characters';
            } else if (model.password != null && value != model.password) {
              return 'password not matched';
            }
            return null;
          },
        ),
        ElevatedButton(
          // color: Theme.of(context).primaryColor,
          child: Text(
            'Sign Up',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Result(
                            model: this.model,
                          )));
            }
          },
        ),
      ]),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;

  MyTextFormField({
    this.hintText,
    this.validator,
    this.onSaved,
    this.isPassword = false,
    this.isEmail = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        obscureText: isPassword ? true : false,
        validator: validator,
        onSaved: onSaved,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }
}

// class CaptureBeneficiaryPage extends StatefulWidget {
//   CaptureBeneficiaryPage({Key key}) : super(key: key);

//   @override
//   _BeneficiariesPageState createState() => _BeneficiariesPageState();
// }

// class _BeneficiariesPageState extends State<CaptureBeneficiaryPage>
//     with AutomaticKeepAliveClientMixin {
//   final _beneficiariesStateRM = RM.get<BeneficiaryState>();
//   ScrollController _scrollController;

//   @override
//   void didChangeDependencies() {
//     _scrollController = ScrollController();
//     _getNewBeneficiaries();
//     _scrollController.addListener(() {
//       double currentPosition = _scrollController.position.pixels;
//       double maxScrollExtent = _scrollController.position.maxScrollExtent;

//       if (currentPosition >= maxScrollExtent &&
//           !_beneficiariesStateRM.state.loading) {
//         _getNewBeneficiaries();
//       }
//     });

//     super.didChangeDependencies();
//   }

//   void _getNewBeneficiaries() {
//     _beneficiariesStateRM
//         .setState((beneficiaryState) => beneficiaryState.getAllBeneciaries());
//   }

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Beneficiaries'),
//       ),
//       body: SingleChildScrollView(
//         controller: _scrollController,
//         child: StateBuilder<BeneficiaryState>(
//             observe: () => _beneficiariesStateRM,
//             builder: (_, model) {
//               return Column(
//                 children: <Widget>[
//                   buildSizedBox(215),
//                   ...model.state.beneficiaries.map((beneficiary) => Column(
//                         children: <Widget>[
//                           Container(
//                             child: Transform(
//                               transform: Matrix4.translationValues(
//                                   0.0, 50 * (1.0 - 5), 0.0),
//                               child: Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 24, right: 24, top: 16, bottom: 16),
//                                 child: InkWell(
//                                   splashColor: Colors.transparent,
//                                   onTap: () {},
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       borderRadius: const BorderRadius.all(
//                                           Radius.circular(16.0)),
//                                       boxShadow: <BoxShadow>[
//                                         BoxShadow(
//                                           color: Colors.grey.withOpacity(0.6),
//                                           offset: const Offset(4, 4),
//                                           blurRadius: 16,
//                                         ),
//                                       ],
//                                     ),
//                                     child: ClipRRect(
//                                       borderRadius: const BorderRadius.all(
//                                           Radius.circular(16.0)),
//                                       child: Stack(
//                                         children: <Widget>[
//                                           Column(
//                                             children: <Widget>[
//                                               AspectRatio(
//                                                 aspectRatio: 2,
//                                                 child: Image.asset(
//                                                   Images.beneficiacyimage,
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                               ),
//                                               Container(
//                                                 color: Colors.white,
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.center,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: <Widget>[
//                                                     Expanded(
//                                                       child: Container(
//                                                         child: Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                       .only(
//                                                                   left: 16,
//                                                                   top: 8,
//                                                                   bottom: 8),
//                                                           child: Column(
//                                                             mainAxisAlignment:
//                                                                 MainAxisAlignment
//                                                                     .center,
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .start,
//                                                             children: <Widget>[
//                                                               Text(
//                                                                 "${beneficiary.firstName}",
//                                                                 textAlign:
//                                                                     TextAlign
//                                                                         .left,
//                                                                 style:
//                                                                     TextStyle(
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w600,
//                                                                   fontSize: 22,
//                                                                 ),
//                                                               ),
//                                                               Row(
//                                                                 crossAxisAlignment:
//                                                                     CrossAxisAlignment
//                                                                         .center,
//                                                                 mainAxisAlignment:
//                                                                     MainAxisAlignment
//                                                                         .start,
//                                                                 children: <
//                                                                     Widget>[
//                                                                   Text(
//                                                                     "Date Create",
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             14,
//                                                                         color: Colors
//                                                                             .grey
//                                                                             .withOpacity(0.8)),
//                                                                   ),
//                                                                   const SizedBox(
//                                                                     width: 4,
//                                                                   ),
//                                                                   Icon(
//                                                                     FontAwesomeIcons
//                                                                         .user,
//                                                                     size: 12,
//                                                                     color: Colors
//                                                                         .white,
//                                                                   ),
//                                                                   Expanded(
//                                                                     child: Text(
//                                                                       'Date Created:',
//                                                                       overflow:
//                                                                           TextOverflow
//                                                                               .ellipsis,
//                                                                       style: TextStyle(
//                                                                           fontSize:
//                                                                               14,
//                                                                           color: Colors
//                                                                               .grey
//                                                                               .withOpacity(0.8)),
//                                                                     ),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                               right: 16,
//                                                               top: 8),
//                                                       child: Column(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .center,
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .end,
//                                                         children: <Widget>[
//                                                           Text(
//                                                             "${beneficiary.createdAt}",
//                                                             textAlign:
//                                                                 TextAlign.left,
//                                                             style: TextStyle(
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w600,
//                                                               fontSize: 22,
//                                                             ),
//                                                           ),
//                                                           Text(
//                                                             '/per night',
//                                                             style: TextStyle(
//                                                                 fontSize: 14,
//                                                                 color: Colors
//                                                                     .grey
//                                                                     .withOpacity(
//                                                                         0.8)),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           Positioned(
//                                             top: 8,
//                                             right: 8,
//                                             child: Material(
//                                               color: Colors.transparent,
//                                               child: InkWell(
//                                                 borderRadius:
//                                                     const BorderRadius.all(
//                                                   Radius.circular(32.0),
//                                                 ),
//                                                 onTap: () {},
//                                                 child: Padding(
//                                                   padding:
//                                                       const EdgeInsets.all(8.0),
//                                                   child: Icon(
//                                                       Icons.favorite_border,
//                                                       color: Colors.white),
//                                                 ),
//                                               ),
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       ))
//                 ],
//               );
//             }),
//       ),

//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           MyNavigator.goToSignUp(context);
//         },
//         tooltip: 'Capture Beneficiary',
//         child: Icon(Icons.add),
//       ),
//     );
//   }

//   SizedBox buildSizedBox(double height) {
//     return SizedBox(
//       height: height,
//     );
//   }

//   @override
//   bool get wantKeepAlive => true;
// }
