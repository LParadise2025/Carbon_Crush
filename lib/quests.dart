import 'package:flutter/material.dart';
import 'appState.dart';
import 'package:provider/provider.dart';

class Quests extends StatelessWidget {
  Quests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carbon Crush"),
      ),

      body: SingleChildScrollView(
        // allows the page to scroll vertically
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<AppState>(
            builder: (context, appState, child) {
              // imports variables from the appState class 
              int totalPlastic = appState.plasticItemTotal ?? 0;
              int totalGlass = appState.glassItemTotal?? 0;
              int totalPaper = appState.paperItemTotal ?? 0;
              
              int totalCleanedItems = appState.cleanItemTotal ?? 0;
              int totalCorrectlySeparated =
                  appState.correctlySeparatedItemTotal ?? 0;


              //calculates the users progress towards quest 1, this is later used to set the amount of the linear progress indicator that is filled
              double progress = calculateProgressQuest1(totalPlastic, totalGlass,
                  totalPaper, totalCleanedItems, totalCorrectlySeparated);

              // caluclates the amount of each material type that the user still needs to recycle
              int remainingGlass = calculateRemainingQuest1(totalGlass);
              int remainingPaper = calculateRemainingQuest1(totalPaper);
              int remainingPlastic = calculateRemainingQuest1(totalPlastic);
              int remainingCleaned = calculateRemainingQuest1(totalCleanedItems);
              int remainingSeparated =
                  calculateRemainingQuest1(totalCorrectlySeparated);
      
              return Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 7, 93, 5),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // displays the Quest Name and Goal
                                    Text('Quest 1: Baby Steps',
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text(
                                        'Goal: Recycle 10 materials in each category',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        )),
                                        // for this first version, the gift card is given to the user in person, not through the app 
                                    Text('Reward: Gift card to an eco friendly company!',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        )),
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
                                  children: [
                                    const Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Progress:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    // creates a visual example of how much of the quest remains until the user earns their reward
                                    LinearProgressIndicator(
                                      value: progress,
                                      backgroundColor: Colors.white,
                                      valueColor: const AlwaysStoppedAnimation<Color>(
                                          Color.fromARGB(255, 7, 93, 5)),
                                      minHeight: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
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
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Column(
                                        children: [
                                          // displays the number of materials left in each category
                                          Text(
                                              'To reach your next checkpoint you need: ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.recycling),
                                          Text('$remainingGlass more glass products '),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.recycling),
                                          Text('$remainingPaper more paper products'),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.recycling),
                                          Text(
                                              '$remainingPlastic more plastic products'),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.recycling),
                                          Text(
                                              '$remainingCleaned more washed products'),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.recycling),
                                          Text(
                                              '$remainingSeparated more separated products'),
                                        ],
                                      ),
                                    ),
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
              );
            },
          ),
        ),
      ),
    );
  }

// calculates the users progress towards the quest as a decimal from 0-1
  double calculateProgressQuest1(totalPlastic, totalGlass, totalPaper,
      totalCleanedItems, totalCorrectlySeparated) {
    double x = 0;

    if (totalPlastic >= 10) {
      x += 0.2;
    } else {
      x += (totalPlastic / 10) * 0.2;
    }
    if (totalGlass >= 10) {
      x += 0.2;
    } else {
      x += (totalGlass / 10) * 0.2;
    }
    if (totalPaper >= 10) {
      x += 0.2;
    } else {
      x += (totalPaper / 10) * 0.2;
    }
    if (totalCleanedItems >= 10) {
      x += 0.2;
    } else {
      x += (totalCleanedItems / 10) * 0.2;
    }
    if (totalCorrectlySeparated >= 10) {
      x += 0.2;
    } else {
      x += (totalCorrectlySeparated / 10) * 0.2;
    }
    return x;
  }

// calculates how many materials are still needed for any category 
  int calculateRemainingQuest1(int total) {
    int x = 10;

    if (total >= 10) {
      x = 0;
    } else {
      x = 10 - total;
    }

    return x;
  }
}
