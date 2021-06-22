import 'package:alummahbio/application/state/beneficiary_state.dart';
import 'package:alummahbio/custom_drawer/custom_drawer.dart';
import 'package:alummahbio/utils/my_navigator.dart';
import 'package:alummahbio/values/images.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class BeneficiariesPage extends StatefulWidget {
  BeneficiariesPage({Key key}) : super(key: key);

  @override
  _BeneficiariesPageState createState() => _BeneficiariesPageState();
}

class _BeneficiariesPageState extends State<BeneficiariesPage>
    with AutomaticKeepAliveClientMixin {
  final _beneficiariesStateRM = RM.get<BeneficiaryState>();
  ScrollController _scrollController;

  @override
  void didChangeDependencies() {
    _scrollController = ScrollController();
    _getNewBeneficiaries();
    _scrollController.addListener(() {
      double currentPosition = _scrollController.position.pixels;
      double maxScrollExtent = _scrollController.position.maxScrollExtent;

      if (currentPosition >= maxScrollExtent &&
          !_beneficiariesStateRM.state.loading) {
        _getNewBeneficiaries();
      }
    });

    super.didChangeDependencies();
  }

  void _getNewBeneficiaries() {
    _beneficiariesStateRM
        .setState((beneficiaryState) => beneficiaryState.getAllBeneciaries());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Beneficiaries'),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: StateBuilder<BeneficiaryState>(
            observe: () => _beneficiariesStateRM,
            builder: (_, model) {
              return Column(
                children: <Widget>[
                  buildSizedBox(215),
                  ...model.state.beneficiaries.map((beneficiary) => Column(
                        children: <Widget>[
                          Container(
                            child: Transform(
                              transform: Matrix4.translationValues(
                                  0.0, 50 * (1.0 - 5), 0.0),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 24, right: 24, top: 16, bottom: 16),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(16.0)),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.6),
                                          offset: const Offset(4, 4),
                                          blurRadius: 16,
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(16.0)),
                                      child: Stack(
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              AspectRatio(
                                                aspectRatio: 2,
                                                child: Image.asset(
                                                  Images.beneficiacyimage,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Container(
                                                color: Colors.white,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Container(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 16,
                                                                  top: 8,
                                                                  bottom: 8),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              Text(
                                                                "${beneficiary.firstName + " " + beneficiary.middleName + " " + beneficiary.surname}",
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 22,
                                                                ),
                                                              ),
                                                              Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: <
                                                                    Widget>[
                                                                  Icon(
                                                                      Icons
                                                                          .calendar_today_rounded,
                                                                      size: 12, color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.8),),
                                                                  // Text(
                                                                  //   " Date Create:",
                                                                  //   style: TextStyle(
                                                                  //       fontSize:
                                                                  //           14,
                                                                  //       color: Colors
                                                                  //           .black
                                                                  //           .withOpacity(0.8)),
                                                                  // ),
                                                                  const SizedBox(
                                                                    width: 4,
                                                                  ),
                                                                  Expanded(
                                                                    child: Text(
                                                                      "${beneficiary.community}",
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color: Colors
                                                                              .grey
                                                                              .withOpacity(0.8)),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 16,
                                                              top: 8),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: <Widget>[
                                                          Text(
                                                            "${beneficiary.createdAt}",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 22,
                                                            ),
                                                          ),
                                                          Text(
                                                            '/per night',
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.8)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Positioned(
                                            top: 8,
                                            right: 8,
                                            child: Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(32.0),
                                                ),
                                                onTap: () {},
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                      Icons.person,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ))
                ],
              );
            }),
      ),

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
                      child: Padding(padding: EdgeInsets.all(8.0),
                      child: Image.asset(Images.logo, width: 100, height: 100,),),
                    )
                  ],
                ))),
            CustomListTitle(Icons.home, 'Dashboard', () => {MyNavigator.goToDashboard(context)}),
            CustomListTitle(Icons.group, 'Beneficiaries', () => {MyNavigator.goToBeneficiaries(context)}),
            CustomListTitle(Icons.person, 'New Beneficiaries', () => {MyNavigator.goToNewBeneficiaries(context)}),
            CustomListTitle(Icons.person, 'Profile', () => {MyNavigator.goToProfile(context)}),
            CustomListTitle(Icons.power_settings_new, 'Logout', () => {MyNavigator.goToSinIn(context)}),
          ],
        ),
      ),

      // drawer: HomeDrawer(screenIndex: DrawerIndex.Dashboard,),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MyNavigator.goToSignUp(context);
        },
        tooltip: 'Capture Beneficiary',
        child: Icon(Icons.add),
      ),
    );
  }

  

  SizedBox buildSizedBox(double height) {
    return SizedBox(
      height: height,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
