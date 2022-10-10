import 'package:bmi/result.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MyHomepage extends StatefulWidget {
  // const MyHomepage({Key? key}) : super(key: key);

  const MyHomepage({
    Key? key,
  }) : super(key: key);
  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  bool isMale = false;
  double heightvsl = 170;
  int wieght = 50;
  int age = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Body Mass Index'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    ExpandedGender(context, 'Male'),
                    SizedBox(width: 15),
                    ExpandedGender(context, 'Female'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Hight',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(heightvsl.toStringAsFixed(1),
                                style: Theme.of(context).textTheme.headline1),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text('CM',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black))
                          ],
                        ),
                        Slider(
                            min: 0,
                            max: 300,
                            value: heightvsl,
                            onChanged: (val) {
                              setState(() {
                                heightvsl = val;
                              });
                            })
                      ]),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expandedheighandwidtht(context, 'Weight'),
                    SizedBox(width: 15),
                    Expandedheighandwidtht(context, 'Age'),
                  ],
                ),
              ),
            ),
            Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height/15 ,
                color: Colors.teal,
                child: TextButton(
                    onPressed: () {
                      var rresult = wieght / pow(heightvsl / 100, 2);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Result(
                            result: rresult, ismale: isMale, age: age);
                      }));
                    },
                    child: Text(
                      'Calculate',
                      style: Theme.of(context).textTheme.headline2,
                    )))
          ],
        )));
  }

  Expanded ExpandedGender(BuildContext context, String gen) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (gen == 'Male')
              isMale = true;
            else if (gen == 'Female') isMale = false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: (isMale && gen == 'Male') || (!isMale && gen == 'Female')
                  ? Colors.teal
                  : Colors.blueGrey),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(gen == 'Male' ? Icons.male : Icons.female,size: 90),
              const SizedBox(
                height: 15,
              ),
              Text(
                gen,
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded Expandedheighandwidtht(BuildContext context, String ag) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.blueGrey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ag,
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              ag == 'Age' ? '${age}' : '${wieght}',
              style: Theme.of(context).textTheme.headline1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: ag == 'Age' ? 'age--' : 'weight--',
                  onPressed: () {
                    setState(() {
                      ag == 'Age' ? age-- : wieght--;
                    });
                  },
                  child: Icon(Icons.remove),
                  mini: true,
                ),
                SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                  heroTag: ag == 'Age' ? 'age++' : 'weight++',
                  onPressed: () {
                    setState(() {
                      ag == 'Age' ? age++ : wieght++;
                    });
                  },
                  child: Icon(Icons.add),
                  mini: true,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
