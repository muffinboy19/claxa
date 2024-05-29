import 'package:flutter/material.dart';

class question4widget extends StatefulWidget {
  const question4widget({Key? key}) : super(key: key);

  @override
  State<question4widget> createState() => _question4widget();
}

class _question4widget extends State<question4widget> {
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
                      alignment: AlignmentDirectional(-1, -1),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                        child: Text(
                          'Strategy',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Color(0xFF4E0760),
                            fontSize: 24,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 630,
                            constraints: BoxConstraints(
                              maxWidth: 450,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFF2E5FF),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(-1, -1),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Text(
                                  'Some ',
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
