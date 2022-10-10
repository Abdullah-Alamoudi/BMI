import 'package:flutter/material.dart';


class Result extends StatelessWidget {
  const Result(
      {Key? key, required this.result, required this.ismale, required this.age})
      : super(key: key);
  final double result;
  final bool ismale;
  final int age;
  
  String get resultOharse{
    //${result.toStringAsFixed(1)}
    String resultText='';
    if(result>=30) resultText='obese';
    else if(result>=25 && 30>result) resultText='Overweight';
    else if(result>=18.5 && 25>result) resultText='Normal';
    else resultText='thin';
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Result'),centerTitle: true,),
      body: Center(
        child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
            Text(
              'Gender : ${ismale ? 'Male' : 'Female'}',
              style:Theme.of(context).textTheme.headline1,
            ),
             Text(
              'Gender : $age',
              style:Theme.of(context).textTheme.headline1,
            ),
            Text(
              'Result : ${result.toStringAsFixed(2)}',
              style:Theme.of(context).textTheme.headline1,
            ),
            Text(
              'Healthiness : $resultOharse',
              style:Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
          ],
        )),
      ),
    );
  }
}
