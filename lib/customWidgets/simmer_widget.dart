import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatefulWidget {
  const ShimmerLoading({super.key});

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.black87,
        highlightColor: Colors.black,
        enabled: true,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 190,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(18)),
              ),
              Container(
                height: 190,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(18)),
              ),
              Container(
                height: 190,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(18)),
              ),
              Container(
                height: 190,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(18)),
              ),
              Container(
                height: 190,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(18)),
              ),
              Container(
                height: 190,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(18)),
              ),
              Container(
                height: 190,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(18)),
              ),
              Container(
                height: 190,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(18)),
              ),
              Container(
                height: 190,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(18)),
              ),
              Container(
                height: 190,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(18)),
              ),
            ],
          ),
        ));
  }
}
