import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../core/constant/color.dart';

class Community extends StatelessWidget {
  const Community({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoute.specificCommunity);
      },
      child: Container(
        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 12, 12),
        child: Container(
          width: 230,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                blurRadius: 4,
                color: Color(0x34090F13),
                offset: Offset(0, 2),
              )
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: AppColor.secondaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(156, 255, 255, 255),
                                borderRadius: BorderRadius.circular(12)),
                            alignment: AlignmentDirectional(0, 0),
                            child: const Icon(Icons.people_alt_sharp,
                                color: Colors.white, size: 20)),
                        Text(
                          'An-Najah Students',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 150,
                        child: Stack(
                          alignment: AlignmentDirectional(-1, 0),
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.91, 0),
                              child: Container(
                                width: 28,
                                height: 28,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1610737241336-371badac3b66?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDV8fHVzZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.62, 0),
                              child: Container(
                                width: 28,
                                height: 28,
                                clipBehavior: Clip.antiAlias,
                                decoration:
                                    BoxDecoration(shape: BoxShape.circle),
                                child: Image.network(
                                    'https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDJ8fHVzZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                                    fit: BoxFit.fitWidth),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                        child: Text('30%'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 8, 0, 8),
                  child: LinearPercentIndicator(
                    percent: 0.3,
                    width: 210,
                    lineHeight: 16,
                    animation: true,
                    progressColor: AppColor.primaryColor,
                    backgroundColor: Color(0xFFE0E3E7),
                    barRadius: Radius.circular(12),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
