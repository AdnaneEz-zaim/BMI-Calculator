import 'package:bmi_claculatrice/resultat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMane=true;
  double hauteur=170.0;
  double poids = 60.5;
  int age=22;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('BMI CALCULATOR',),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMane=!isMane;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(child: Icon(Icons.tag_faces_outlined,size: 70,color: isMane ? Colors.white :Colors.black87,),),
                            SizedBox(height: 12,),
                            Text("Homme",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,color: isMane ? Colors.white :Colors.black87,),)
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: isMane ? Colors.pinkAccent :Colors.grey[200],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMane=!isMane;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(child: Icon(Icons.tag_faces_outlined,size: 70,color: !isMane ? Colors.white :Colors.black87,),),
                            SizedBox(height: 12,),
                            Text("Femme",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,color: !isMane ? Colors.white :Colors.black87,),)
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: !isMane ? Colors.pinkAccent :Colors.grey[200],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
            Expanded(

                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[200]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                              Text("Hauteurs",style: TextStyle(color: Colors.grey[400],fontSize: 22),),
                              SizedBox(height: 15,),
                              Container(

                                child: Row(
                                  textBaseline: TextBaseline.alphabetic,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(hauteur.toString(),style: TextStyle(color: Colors.pink,fontSize: 25,fontWeight: FontWeight.w900),),
                                    SizedBox(width: 15,),
                                    Text("Cm",style: TextStyle(color: Colors.grey[400],fontSize: 22),)
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: Slider(value: hauteur,min: 70,max: 240,
                                  onChanged: (valeu){
                                    setState(() {
                                      hauteur=valeu.roundToDouble();
                                    }
                              );}))
                        ],
            ),
                    ),
                  ),
                )),
            Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[200]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                        children: [
                            Text('Age :',style: TextStyle(color: Colors.grey[400],fontSize: 22),),
                            SizedBox(height: 20,),
                            Text(age.toString(),style:TextStyle(color: Colors.pink,fontSize: 25,fontWeight: FontWeight.w900),),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(onPressed: (){
                                    setState(() {
                                      age++;
                                    });
                                  },child: Icon(Icons.add),),
                                  SizedBox(width: 15,),
                                  FloatingActionButton(onPressed: (){
                                    setState(() {
                                      age > 1 ?age--:age=1;
                                    });
                                  },child: Icon(Icons.remove),),
                                ],
                              ),
                            )
              ],
            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[200]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Text('poids :',style: TextStyle(color: Colors.grey[400],fontSize: 22),),
                                SizedBox(height: 20,),
                                Text(poids.toString(),style:TextStyle(color: Colors.pink,fontSize: 25,fontWeight: FontWeight.w900),),
                                Expanded(
                                    child: Slider(value: poids,min: 3,max: 140,
                                        onChanged: (valeu){
                                          setState(() {
                                            poids=double.parse(valeu.toStringAsFixed(2));
                                          }
                                          );}))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            MaterialButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => BMIResultat(poids/(hauteur*hauteur/(100*100)))));
              },
              child: Text('Resultat',style: TextStyle(color: Colors.white),),
              color: Colors.pink,
              minWidth: double.infinity,
              height: 55,
            )
          ],
        ),
      ),
    );
  }
}
