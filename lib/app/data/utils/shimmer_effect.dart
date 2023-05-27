import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

double _containerHeight = 20;
double _spaceHeight = 10;
Color _shimmerColor = Colors.grey;
Color _shimmerColorDark = Colors.grey.shade200;

class ShimmerLoading {
  static vListViewLoading() {
    return SafeArea(
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 19.9, 0),
                child: Shimmer.fromColors(
                  highlightColor: Colors.white,
                  baseColor: _shimmerColor!,
                  period: const Duration(milliseconds: 3000),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(left: 12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: _shimmerColor,
                        ),
                        height: 150,

                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0)),
                            color: Colors.white,
                          ),
                          child: Container(
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        padding: const EdgeInsets.only(left: 12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: _shimmerColor,
                        ),
                        height: _containerHeight,
                        child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0)),
                              color: Colors.white,
                            )),
                      ),
                      SizedBox(
                        height: _spaceHeight,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: _shimmerColor,
                        ),
                        height: _containerHeight,
                        child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0)),
                              color: Colors.white,
                            )),
                      ),


                    ],
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  color: _shimmerColor,
                  height: 1),
            ],
          );
        },
      ),
    );
  }
}
