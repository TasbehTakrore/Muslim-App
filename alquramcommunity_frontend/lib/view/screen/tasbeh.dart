import 'dart:math'; 
 
import 'package:alquramcommunity_frontend/core/constant/color.dart'; 
import 'package:flutter/material.dart'; 
 
void main() { 
  runApp(MyApp()); 
} 
 
class MyApp extends StatefulWidget { 
  const MyApp({Key? key}) : super(key: key); 
 
  @override 
  State<MyApp> createState() => _MyAppState(); 
} 
 
class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin { 
  late AnimationController _controller; 
  late Animation<Offset> _animation; 
 
  @override 
  void initState() { 
    super.initState(); 
    _controller = AnimationController( 
      vsync: this, 
      duration: const Duration(milliseconds: 500), 
    ); 
 
    _animation = TweenSequence<Offset>([ 
      TweenSequenceItem( 
        tween: Tween(begin: const Offset(0, 0), end: const Offset(1, 0.3)), 
        weight: 1, 
      ), 
      TweenSequenceItem( 
        tween: Tween(begin: const Offset(1, 0.3), end: const Offset(1.3, 0.6)), 
        weight: 1, 
      ), 
      TweenSequenceItem( 
        tween: 
            Tween(begin: const Offset(1.3, 0.6), end: const Offset(1.6, 0.9)), 
        weight: 1, 
      ), 
      TweenSequenceItem( 
        tween: 
            Tween(begin: const Offset(1.6, 0.9), end: const Offset(1.9, 1.2)), 
        weight: 1, 
      ), 
      TweenSequenceItem( 
        tween: 
            Tween(begin: const Offset(1.9, 1.2), end: const Offset(2.3, 1.6)), 
        weight: 1, 
      ), 
      TweenSequenceItem( 
        tween: 
            Tween(begin: const Offset(2.3, 1.6), end: const Offset(2.7, 2.0)), 
        weight: 1, 
      ), 
      TweenSequenceItem( 
        tween: 
            Tween(begin: const Offset(2.7, 2.0), end: const Offset(3.1, 2.4)), 
        weight: 1, 
      ), 
      TweenSequenceItem( 
        tween: 
            Tween(begin: const Offset(3.1, 2.4), end: const Offset(3.5, 2.8)), 
        weight: 1, 
      ), 
      TweenSequenceItem( 
        tween: Tween(begin: const Offset(3.5, 2.8), end: const Offset(4, 3.3)), 
        weight: 1, 
      ), 
      TweenSequenceItem( 
        tween: Tween(begin: const Offset(4, 3.3), end: const Offset(4.2, 3.8)), 
        weight: 1, 
      ), 
      TweenSequenceItem( 
        tween: 
            Tween(begin: const Offset(4.2, 3.8), end: const Offset(4.4, 4.2)), 
        weight: 1, 
      ), 
      TweenSequenceItem( 
        tween: 
            Tween(begin: const Offset(4.4, 4.2), end: const Offset(4.6, 4.6)), 
        weight: 1, 
      ), 
      TweenSequenceItem( 
        tween: 
            Tween(begin: const Offset(4.6, 4.6), end: const Offset(4.8, 5.0)), 
        weight: 1, 
      ), 
      TweenSequenceItem( 
        tween: 
            Tween(begin: const Offset(4.8, 5.0), end: const Offset(5.2, 5.4)), 
        weight: 1, 
      ), 
      TweenSequenceItem( 
        tween: 
            Tween(begin: const Offset(5.2, 5.4), end: const Offset(5.2, 5.8)), 
        weight: 1, 
      ), 
    ]).animate(CurvedAnimation( 
      parent: _controller, 
      curve: Curves.linear, 
    )); 
 
    _controller.addStatusListener((status) { 
      if (status == AnimationStatus.completed) { 
        _controller.reset(); 
      } 
    }); 
  } 
 
  @override 
  void dispose() { 
    _controller.dispose(); 
    super.dispose(); 
  } 
 
  void _onTap() { 
    _controller.forward(); 
  } 
 
  @override 
  Widget build(BuildContext context) { 
    return Container( 
      color: AppColor.grey, 
      child: Column( 
        mainAxisSize: MainAxisSize.min, 
        mainAxisAlignment: MainAxisAlignment.center, 
        crossAxisAlignment: CrossAxisAlignment.end, 
        children: [ 
          Container( 
            color: AppColor.grey, 
            height: 400, 
          ), 
          Container( 
            color: AppColor.grey, 
            child: Row( 
              mainAxisSize: MainAxisSize.min, 
              mainAxisAlignment: MainAxisAlignment.end, 
              children: [ 
                Container( 
                  color: AppColor.grey, 
                  alignment: Alignment.centerLeft, 
                  child: GestureDetector(
onTap: _onTap, 
                    child: AnimatedBuilder( 
                      animation: _animation, 
                      builder: (context, child) { 
                        return Transform.translate( 
                          offset: _animation.value * 30, 
                          child: Opacity( 
                            opacity: 
                                _controller.status == AnimationStatus.completed 
                                    ? 0 
                                    : 1, 
                            child: child, 
                          ), 
                        ); 
                      }, 
                      child: Container( 
                        width: 50, 
                        height: 50, 
                        decoration: BoxDecoration( 
                          color: AppColor.primaryColor, 
                          shape: BoxShape.circle, 
                        ), 
                      ), 
                    ), 
                  ), 
                ), 
                Container( 
                  width: 25, 
                  height: 50, 
                  decoration: BoxDecoration( 
                    color: AppColor.secondaryColor, 
                    borderRadius: BorderRadius.only( 
                      topRight: Radius.circular(50), 
                      bottomRight: Radius.circular(50), 
                    ), 
                  ), 
                ), 
              ], 
            ), 
          ), 
        ], 
      ), 
    ); 
  } 
}