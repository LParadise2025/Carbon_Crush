import 'package:flutter/material.dart';
import 'appState.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Save data
Future<void> saveData(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}

// Read data
Future<String?> readData(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

//stateful widget means that it must respond to changing data 
class CarbonCounter extends StatefulWidget {
  CarbonCounter({
    Key? key,
  }) : super(key: key);

  @override
  State<CarbonCounter> createState() => _CarbonCounterState();
}

class _CarbonCounterState extends State<CarbonCounter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carbon Crush"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<AppState>(
            builder: (context, appState, child) {
              // Accesses the total values from appState and makes sure that the values are not null
              int totalPlastic = appState.plasticItemTotal?? 0;
              int totalGlass = appState.glassItemTotal?? 0;
              int totalPaper = appState.paperItemTotal?? 0;
              int totalCardboard = appState.cardboardItemTotal?? 0;
              int totalMetal = appState.metalItemTotal?? 0; 


              // calculates the amount of CO2 prevented from entering the atmoshere and equivalent values
             // saves these values in variables 
              double carbonResult = calculateCarbon(
                  totalPlastic, totalGlass, totalPaper, totalCardboard, totalMetal);
              double milesResult = calculateMiles(
                  totalPlastic, totalGlass, totalPaper, totalCardboard, totalMetal);
              double gallonsResult = calculateGallons(
                  totalPlastic, totalGlass, totalPaper, totalCardboard, totalMetal);
              double poundsOfCoalResult = calculatePoundsOfCoal(
                  totalPlastic, totalGlass, totalPaper, totalCardboard, totalMetal);
              double barrelsResult = calculateBarrels(
                  totalPlastic, totalGlass, totalPaper, totalCardboard, totalMetal);
              double propaneResult = calculatePropaneCyllinders(
                  totalPlastic, totalGlass, totalPaper, totalCardboard, totalMetal);
              double smartphoneResult = calculateSmartPhones(
                  totalPlastic, totalGlass, totalPaper, totalCardboard, totalMetal);
              double windTurnbineResult = calculateWindTurbines(
                  totalPlastic, totalGlass, totalPaper, totalCardboard, totalMetal);
              double LEDResult = calculateLEDS(
                  totalPlastic, totalGlass, totalPaper, totalCardboard, totalMetal);
              double seedlingsResult = calculateSeedlings(
                  totalPlastic, totalGlass, totalPaper, totalCardboard, totalMetal);
              double acresResult = calculateAcres(
                  totalPlastic, totalGlass, totalPaper, totalCardboard,totalMetal);

              return Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 7, 93, 5),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // calculations based on https://www.epa.gov/energy/greenhouse-gas-equivalencies-calculator#results
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                   const Text('My recycling has prevented', style: TextStyle(fontSize: 18, color: Colors.black,
                                          fontWeight: FontWeight.bold,)),
                                          // Displays CO2 equivalent
                                      Text('$carbonResult kg', style: const TextStyle(fontSize: 24, color: Colors.black,
                                          fontWeight: FontWeight.bold,) ),
                                    const Text('of CO\u2082 from being emitted. ', style: TextStyle(fontSize: 18, color: Colors.black,
                                          fontWeight: FontWeight.bold,)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // gives spacing between elements
                     const  SizedBox(
                          height: 16.0,
                        ),

                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                          'This is the equialent of greenhouse gas emissions from: ', style: TextStyle(color: Colors.black,
                                          fontWeight: FontWeight.bold,)),
                                      Text(
                                          '$milesResult miles driven by average gasoline-powered passenger vehicals.'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      const  SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // displays the equivalent measurements (as calculated below) to the screen
                                     const Text(
                                          "This is the equivalent to CO2 emissions from:", style: TextStyle(color: Colors.black,
                                          fontWeight: FontWeight.bold,)),
                                      Text(
                                          "$gallonsResult gallons of gasoline consumed."),
                                      Text(
                                          "$poundsOfCoalResult pound of coal burned"),
                                      Text(
                                          "$barrelsResult barrels of oil consumed."),
                                      Text("$propaneResult propane cylinders."),
                                      Text(
                                          "$smartphoneResult smartphones charged."),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                       const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // displays more equivalencies
                                   const  Text(
                                          'This is the equivalent to greenhouse gas emissions avoided by:',  style: TextStyle(color: Colors.black,
                                          fontWeight: FontWeight.bold,)),
                                      Text(
                                          "$windTurnbineResult wind turbines running for a year."),
                                      Text(
                                          "$LEDResult incandescent lamps switched to LEDs."),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      const  SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // displays more equivalencies 
                                    const  Text(
                                          'This is the equivalent to carbon sequestered by:', style: TextStyle(color: Colors.black,
                                          fontWeight: FontWeight.bold,)),
                                      Text(
                                          "$seedlingsResult tree seedlings grown for 10 years."),
                                      Text(
                                          "$acresResult acres of U.S. forests in one year."),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
// methods to calculate the amount of CO2 prevented from entering the atmosphere and its equivalencies
  double calculateCarbon(totalPlastic, totalGlass, totalPaper, totalCardboard, totalMetal) {
    double kgPerGlassUnit = 0.071213944; // glass bottle
    double kgPerPaperUnit = 0.002295; // piece of A4 paper
    double kgPerPlasticUnit = 0.02028; // plastic water bottle
    double kgPerCardboardUnit = 0.03; // 12x12x12 box
    double kgPerMetalUnit = 0.114002; // aluminium can
    //kg of CO2 prevented from entering the atmosphere for variaous materials 
    
    // multiplies the number of each material type by the amount of CO2 prevented per unit of that material 
    double x = (totalGlass * kgPerGlassUnit) +
        (totalPaper * kgPerPaperUnit) +
        (totalPlastic * kgPerPlasticUnit) +
        (totalCardboard * kgPerCardboardUnit) + (totalMetal * kgPerMetalUnit);

    x = double.parse(x.toStringAsFixed(2));
    // rounds the amount to 2 decimal places 
    return x;
  }

  double calculateMiles(totalPlastic, totalGlass, totalPaper, totalCardboard, totalMetal) {
    double kgCarbon =
        calculateCarbon(totalPlastic, totalGlass, totalPaper, totalCardboard, totalMetal);

    double x = kgCarbon * (2564 / 1000);

    x = double.parse(x.toStringAsFixed(2));
    return x;
  }

  double calculateGallons(
      totalPlastic, totalGlass, totalPaper, totalCardboard, totalMetal) {
    double kgCarbon =
        calculateCarbon(totalPlastic, totalGlass, totalPaper, totalCardboard, totalMetal);

    double x = kgCarbon * (113 / 1000);

    x = double.parse(x.toStringAsFixed(2));
    return x;
  }

  double calculatePoundsOfCoal(
      totalPlastic, totalGlass, totalPaper, totalCardboard, totalMetal) {
    double kgCarbon =
        calculateCarbon(totalPlastic, totalGlass, totalPaper, totalCardboard, totalMetal);

    double x = kgCarbon * (1120 / 1000);

    x = double.parse(x.toStringAsFixed(2));
    return x;
  }

  double calculateBarrels(
      totalPlastic, totalGlass, totalPaper, totalCardboard, totalMetal) {
    double kgCarbon =
        calculateCarbon(totalPlastic, totalGlass, totalPaper, totalCardboard, totalMetal);

    double x = kgCarbon * (2.3 / 1000);

    x = double.parse(x.toStringAsFixed(2));
    return x;
  }

  double calculatePropaneCyllinders(
      totalPlastic, totalGlass, totalPaper, toatlCardboard, totalMetal) {
    double kgCarbon =
        calculateCarbon(totalPlastic, totalGlass, totalPaper, toatlCardboard, totalMetal);

    double x = kgCarbon * (45.9 / 1000);

    x = double.parse(x.toStringAsFixed(2));
    return x;
  }

  double calculateSmartPhones(
      totalPlastic, totalGlass, totalPaper, totalCardboard, totalMetal) {
    double kgCarbon =
        calculateCarbon(totalPlastic, totalGlass, totalPaper, totalCardboard, totalMetal);

    double x = kgCarbon * (121643 / 1000);

    x = double.parse(x.toStringAsFixed(2));
    return x;
  }

  double calculateWindTurbines(
      totalPlastic, totalGlass, totalPaper, totalCardboard, totalMetal) {
    double kgCarbon =
        calculateCarbon(totalPlastic, totalGlass, totalPaper, totalCardboard, totalMetal);

    double x = kgCarbon * (0.0003 / 1000);

    x = double.parse(x.toStringAsFixed(2));
    return x;
  }

  double calculateLEDS(totalPlastic, totalGlass, totalPaper, totalCardboard, totalMetal) {
    double kgCarbon =
        calculateCarbon(totalPlastic, totalGlass, totalPaper, totalCardboard, totalMetal);

    double x = kgCarbon * (37.9 / 1000);

    x = double.parse(x.toStringAsFixed(2));
    return x;
  }

  double calculateSeedlings(
      totalPlastic, totalGlass, totalPaper, totalCardboard, totalMetal) {
    double kgCarbon =
        calculateCarbon(totalPlastic, totalGlass, totalPaper, totalCardboard, totalMetal);

    double x = kgCarbon * (16.5 / 1000);

    x = double.parse(x.toStringAsFixed(2));
    return x;
  }

  double calculateAcres(totalPlastic, totalGlass, totalPaper, totalCardboard, totalMetal) {
    double kgCarbon =
        calculateCarbon(totalPlastic, totalGlass, totalPaper, totalCardboard, totalMetal);

    double x = kgCarbon * (1.2 / 1000);

    x = double.parse(x.toStringAsFixed(2));
    return x;
  }
}
