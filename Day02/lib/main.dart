import 'package:flutter/material.dart';
enum SetClick{
  incresed,
  decriesd,
  none
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF090D22),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF090D22),
          foregroundColor: Colors.white,
        )
      ),
      home: const MyHomePage(title: 'MBI Calculator'),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  int height = 120,weight = 70, ages=25;

  void weightChange(SetClick setClick , SetClick age){
    setState(() {
      if((setClick == SetClick.incresed) && (age == SetClick.none)){
        if(weight>0 && weight < 200){
          weight++;
        }
      }else if((setClick == SetClick.decriesd) && (age == SetClick.none)){
        if(weight>0 && weight < 200){
          weight--;
        }
      }else if((setClick == SetClick.none) && (age == SetClick.incresed)){
        if(ages>0 && ages<120){
          ages++;
        }
      }else if((setClick == SetClick.none) && (age == SetClick.decriesd)){
        if(ages>0 && ages<120){
          ages--;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),

        leading: Icon(Icons.menu),
      ),
      body: Padding(padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                child: Column(
                  children: [
                    Icon(Icons.male),
                    Text("Male"),
                  ],
                ),
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20)
                  ),
              ),),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Icon(Icons.female),
                      Text("Female"),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),),

            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("HEIGH"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text("$height",style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                    ),),
                    Text("cm"),

              ],
            ),
    Slider(value: height.toDouble(), onChanged: (double newHeight){
    setState(() {
    height = newHeight.floor();
    });
    },max: 220.0,
    min: 100.0,)
    ],
    ),
            padding: EdgeInsets.symmetric(vertical: 20),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20)
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [

              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Text("Weight"),
                  Text("$weight",style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                  ),),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: (){
                              weightChange(SetClick.incresed, SetClick.none);
                            },
                            child: Center(
                              child: CircleAvatar(
                                child: Icon(Icons.add),
                                backgroundColor: Colors.red.shade700,
                              ),
                            ),
                          ),
                          GestureDetector(onTap: (){
                            weightChange(SetClick.decriesd, SetClick.none);
                          },
                            child: Center(
                              child: CircleAvatar(
                                child: Icon(Icons.remove),
                                backgroundColor: Colors.red.shade700,
                              ),
                            ),
                          )

                        ],
                      )
                    ],
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),),
              SizedBox(
                width: 10,
              ),

              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Text("Age"),
                      Text("$ages",style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold
                      ),),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: (){
                              weightChange(SetClick.none, SetClick.incresed);
                            },
                            child: Center(
                              child: CircleAvatar(
                                child: Icon(Icons.add),
                                backgroundColor: Colors.red.shade700,
                              ),
                            ),
                          ),
                          GestureDetector(onTap: (){
                            weightChange(SetClick.none, SetClick.decriesd);
                          },
                            child: Center(
                              child: CircleAvatar(
                                child: Icon(Icons.remove),
                                backgroundColor: Colors.red.shade700,
                              ),
                            ),
                          )

                        ],
                      )
                    ],
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),),
            ],
          ),
          SizedBox(
            height: 10,
          ),Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Calculate Your BMI"),
              ],
            ),
            padding: EdgeInsets.symmetric(vertical: 20),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20)
            ),
          ),

        ],
      ),)
    );
  }
}
