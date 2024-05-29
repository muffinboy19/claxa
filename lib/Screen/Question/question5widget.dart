import 'package:flutter/material.dart';

class question5widget extends StatefulWidget {
  const question5widget({Key? key}) : super(key: key);

  @override
  State<question5widget> createState() => _question5widget();
}

class _question5widget extends State<question5widget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, -1),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {},
                          child: Text(
                            'Participate in this conversation catered for you',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              color: Color(0xFF4E0760),
                              fontSize: 16,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(24, 64, 24, 0),
                        child: Text(
                          'ATTENTION',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Color(0xFF4E0760),
                            fontSize: 36,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(24, 32, 24, 0),
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xFFCAD7FB),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, -5),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(-1, -1),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              'Hello World',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                letterSpacing: 0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(24, 10, 24, 0),
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xFFF6A791),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, -5),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(-1, -1),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              'Hello World',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                letterSpacing: 0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
