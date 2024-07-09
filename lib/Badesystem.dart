import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dynamic_icon/flutter_dynamic_icon.dart';
import 'package:shimmer/shimmer.dart';
// import 'package:flutter_vibrate/flutter_vibrate.dart';
// import 'package:vibration/vibration.dart';

class ShimmerEffect extends StatefulWidget {
  const ShimmerEffect({super.key});
  @override
  State<ShimmerEffect> createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<ShimmerEffect> {
  bool _canVibrate = true;
  @override
  void initState() {
    // _init();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }
  // Future<void> _init() async {
  //   //bool canVibrate = await Vibrate.canVibrate;
  //   setState(() {
  //     _canVibrate = canVibrate;
  //     _canVibrate
  //         ? debugPrint('This device can vibrate')
  //         : debugPrint('This device cannot vibrate');
  //   });
  // }

  @override
  var isLoading = true;
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 60,right: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.04),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.04),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.04),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ],
          ),
        ),

        ///package of shimmer
        // child: Container(
        //   child: Shimmer.fromColors(
        //     baseColor: Colors.grey,
        //     highlightColor: Colors.white,
        //     child: Text(
        //       'Shimmer',
        //       textAlign: TextAlign.center,
        //       style: TextStyle(
        //         fontSize: 40.0,
        //         fontWeight: FontWeight.w600,
        //       ),
        //     ),
        //   ),
        // ),
      )
          : Center(
        child:Padding(
          padding: const EdgeInsets.only(left: 60,right: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.yellow.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text('This is Text!',style: TextStyle(
                      fontWeight: FontWeight.w600,color: Colors.red
                  ),),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child:  ListTile(
                  title: const Text('Vibrate'),
                  leading: const Icon(Icons.vibration, color: Colors.teal),
                  onTap: () {
                    //HapticFeedback.vibrate();
                    // Vibration.vibrate(
                    //     pattern: [ 500, 1000, 500, 2000, 500, 1000]
                    // );
                    // if (_canVibrate) Vibrate.vibrate;
                  },
                ),
              ),



              SizedBox(height: 20,),
              Center(
                child: ElevatedButton(
                  child: Text('Batch No.'),
                  onPressed: ()=> setBatchNum(5,context),
                ),
              ),
            ],
          ),
        ),),
    );
  }
  setBatchNum(int count,BuildContext context)async{
    try{
      await FlutterDynamicIcon.setApplicationIconBadgeNumber(count);
    }on PlatformException{
      print('Exception!');
    }catch(e){
      print(e);
    }
    int BatchNumber = await FlutterDynamicIcon.getApplicationIconBadgeNumber();
    print('$BatchNumber');
  }
}

