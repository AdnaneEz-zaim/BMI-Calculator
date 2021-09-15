import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BMIResultat extends StatelessWidget {
  double BMI=0.0;
  Icon icon= Icon(Icons.check,color: Colors.green,size: 120,);
  BMIResultat(this.BMI,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI RESULTAT',),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0,bottom: 20,left: 20,right: 20),
        child: Column(
          children: [
            Icon(BMI < 18.5 ? Icons.warning_amber_outlined :BMI < 25 ? Icons.check: BMI < 30? Icons.warning_amber_outlined:Icons.remove_circle_outline,color: getColor(BMI),size: 120,),
            SizedBox(height: 20,),
            Text("Your BMI categorie is",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.pink[400]),),
            SizedBox(height: 12,),
            Center(

              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[200],

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(


                      children: [
                        Text('BMI :',style: TextStyle(color: Colors.grey[400],fontSize: 26),),
                        SizedBox(height: 20,),
                        Text(BMI.toStringAsFixed(2),style:TextStyle(color: Colors.pink,fontSize: 25,fontWeight: FontWeight.w900),),
                        SizedBox(height: 20,),
                        Text(getStatue(BMI),style:TextStyle(color: getColor(BMI),fontSize: 25,fontWeight: FontWeight.w900),),
                      ],
                    ),
                  ),
                ),
              ),
            ),

        ],),
      ),
    );
  }
}

Color getColor(double val){
  if(val < 18.5){
    return Colors.yellow.shade700;
  } else if (val < 25){
    return Colors.green;
  } else if (val < 30){
    return Colors.yellow.shade700;
  }else{
    return Colors.red.shade600;
  }
}

String getStatue(double val){
  if(val < 18.5){
    return "Un poids insuffisant";
  } else if (val < 25){
    return "Normal";
  } else if (val < 30){
    return "Surpoids";
  }else{
    return "Obèse";
  }
}
