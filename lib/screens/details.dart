import 'package:flutter/material.dart';
import 'package:trackin_n_bingein/buttons/buttons.dart';
import 'package:trackin_n_bingein/styling/styling.dart';

class Details extends StatefulWidget {
  final String title;

  const Details({Key? key, required this.title}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  double _value = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "lib/assets/ach.png",
                    fit: BoxFit.cover,
                    width: 150,
                    height: 200,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "A Certain Hunger",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 4),
                        Text(
                          "by Chelsea G. Summers",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 70),
                        Buttons.finishButton(context),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  // Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8, 
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: SizedBox(
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 15.0, 
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 12.0,
                            pressedElevation: 8.0,
                          ),
                          overlayShape: RoundSliderOverlayShape(
                            overlayRadius:
                                24.0, 
                          ),
                          activeTrackColor: Color.fromARGB(255, 8, 77, 65),
                          inactiveTrackColor: Color.fromARGB(255, 116, 197, 136),
                          thumbColor: Color.fromARGB(255, 6, 68, 39),
                          overlayColor: Color.fromARGB(
                              50, 6, 68, 39), 
                        ),
                        child: Slider(
                          min: 0.0,
                          max: 100.0,
                          divisions: 100,
                          value: _value,
                          label: '${_value.round()}',
                          onChanged: (value) {
                            setState(() {
                              _value = value;
                            });
                          },
                        ),
                      ),
                    ), 
                    
                    
                  ),
               
                  Icon(
                    Icons.add,
                    size: 30.0,
                    color: Styling.textColor3,
                  ),
                ],
                
              ),
              
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Food critic Dorothy Daniels loves what she does. Discerning, meticulous, and very, very smart, Dorothy's clear mastery of the culinary arts make it likely that she could, on any given night, whip up a more inspired dish than any one of the chefs she writes about. Dorothy loves sex as much as she loves food, and while she has struggled to find a long-term partner that can keep up with her, she makes the best of her single life, frequently traveling from Manhattan to Italy for a taste of both.",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
