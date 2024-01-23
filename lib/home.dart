import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'appState.dart';

class Home extends StatelessWidget {
  Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carbon Crush"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<AppState>(
          builder: (context, appState, child) {
            // Access the total values from appState
            int totalPlastic = appState.plasticItemTotal ?? 0;
            int totalGlass = appState.glassItemTotal ?? 0;
            int totalPaper = appState.paperItemTotal ?? 0;
            int totalCardboard = appState.cardboardItemTotal ?? 0;
            int totalMetal = appState.metalItemTotal ?? 0;

           // int totalDirtyItems = appState.dirtyItemTotal ?? 0;
            int totalCleanedItems = appState.cleanItemTotal ?? 0;
           // int totalMultiMaterial = appState.multiMaterialItemTotal ?? 0;
            int totalCorrectlySeparated = appState.correctlySeparatedItemTotal ?? 0;

            // calculates the users progress based on their materials and habits, this is the same as on the quest page
            double progress = calculateProgressQuest1(
                totalPlastic,
                totalGlass,
                totalPaper,
                totalCardboard,
                totalCleanedItems,
                totalCorrectlySeparated);
            int percent = (progress * 100).toInt();
            
            // calculates the amount of CO2 prevented from entering the atmosphere in the same manner as the carbonCounter class

            double carbonResult = calculateCarbon(
                totalPlastic, totalGlass, totalPaper, totalCardboard, totalMetal);

            // SingleChildScrollView allows the screen to scroll vertically
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16.0),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 7, 93, 5),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // displays amount of C02 prevented from entering the atmosphere 
                        const Text(
                          "My Impact",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        const Text(""),
                        Text(
                          '$carbonResult kg of CO\u2082 saved',
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const Text(""),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.green[500],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // tells the user which icon to press to see their carbon counter
                                Text(
                                  'Click ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    // determines what font fonst size to use based on the screen size
                                    fontSize: _getFontSize(context),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.compost,
                                  color: Colors.white,
                                  size: _getFontSize(context),
                                ),
                                Text(
                                  " to view your Carbon Counter!",
                                  style: TextStyle(
                                    color: Colors.white,
                                    // determines what font fonst size to use based on the screen size
                                    fontSize: _getFontSize(context),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 7, 93, 5),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Text(
                          "My Quests",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                       const Text(" "),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Column(
                              children: [
                                Text(
                                  "Current Quest:",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                // This is the users current quest
                                Text(
                                  "Baby Steps",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                           const SizedBox(
                                width: 16.0),
                             Container(
                              width: 80.0,
                              height: 80.0,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    // shows the users progress in the quest in a circular progress indicator
                                    child: CircularProgressIndicator(
                                      value: progress,
                                      backgroundColor: Colors.lightGreen,
                                      strokeWidth: 8.0,
                                    ),
                                  ),
                                  // shows the percent completed
                                  Text(
                                    '$percent%',
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Text(" "),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.green[500],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Tells the user which icon to click to see their quests 
                                Text(
                                  'Click ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: _getFontSize(context),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.workspace_premium,
                                  color: Colors.white,
                                  size: _getFontSize(context),
                                ),
                                Text(
                                  " to view your Quests!",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: _getFontSize(context),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                 const SizedBox(height: 16.0),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
// used to calculate the progress towards the quest
  double calculateProgressQuest1(totalPlastic, totalGlass, totalPaper, totalCardboard,
      totalCleanedItems, totalCorrectlySeparated) {
    double x = 0;

    if (totalPlastic >= 10) {
      x += 0.2;
    } else {
      x += (totalPlastic / 10) * .2;
    }
    if (totalGlass >= 10) {
      x += 0.2;
    } else {
      x += (totalGlass / 10) * .2;
    }
    if (totalPaper >= 10) {
      x += 0.2;
    } else {
      x += (totalPaper / 10) * .2;
    }
    if (totalCleanedItems >= 10) {
      x += 0.2;
    } else {
      x += (totalCleanedItems / 10) * .2;
    }
    if (totalCorrectlySeparated >= 10) {
      x += 0.2;
    } else {
      x += (totalCorrectlySeparated / 10) * .2;
    }
    return x;
  }

// detemerines what font size to use based on the screen size
  double _getFontSize(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 600
        ? 16.0
        : 10.0;
  }
// calculates the amount of CO2 prevented from entering the atmosphere in the same manner as the CarbonCounter class
  double calculateCarbon(totalPlastic, totalGlass, totalPaper, totalCardboard, totalMetal) {
    double kgPerGlassUnit = 0.071213944;
    double kgPerPaperUnit = 0.002295;
    double kgPerPlasticUnit = 0.02028;
    double kgPerCardboardUnit = 0.03;
    double kgPerMetalUnit = 0.114002;

    double x = (totalGlass * kgPerGlassUnit) +
        (totalPaper* kgPerPaperUnit) +
        (totalPlastic * kgPerPlasticUnit) + (totalCardboard * kgPerCardboardUnit) + (totalMetal * kgPerMetalUnit);

    x = double.parse(x.toStringAsFixed(3));
    // returns with 3 recimal places of data instead of 2
    return x;
  }
}
