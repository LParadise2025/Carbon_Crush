import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'appState.dart';

class Stats extends StatelessWidget {
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
              // Access the total values from appState
              // These are updated whenever the user submits the log items form
              int totalPlastic = appState.plasticItemTotal ?? 0;
              int totalGlass = appState.glassItemTotal ?? 0;
              int totalPaper = appState.paperItemTotal ?? 0;
              int totalCardboard = appState.cardboardItemTotal ?? 0;

              int totalDirtyItems = appState.dirtyItemTotal ?? 0;
              int totalCleanedItems = appState.cleanItemTotal ?? 0;
              int totalMultiMaterial = appState.multiMaterialItemTotal ?? 0;
              int totalCorrectlySeparated =
                  appState.correctlySeparatedItemTotal ?? 0;
              int totalMetal = appState.metalItemTotal ?? 0;

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
                                    Text(
                                      'Stats',
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
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
                                    const Text(
                                      // displays the users stats in the volume category 
                                      // this includes their totals for each material type
                                      'Volume:',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('Plastic goods: $totalPlastic'),
                                    Text('Glass goods: $totalGlass'),
                                    Text('Paper goods: $totalPaper'),
                                    Text('Cardboard goods: $totalCardboard'),
                                    Text('Metal Goods: $totalMetal'),
                                    Text(
                                        'Total Material Recycled: ${totalPlastic + totalGlass + totalPaper + totalCardboard + totalMetal}'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
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
                                    const Text(
                                      // displays the users stats in the accuracy category
                                      // this includes their totals for cleaned/dirty items and mult-material/separated products
                                      // additionally it shows what percentage of their recyclables they have correctly cleaned/separated
                                      'Accuracy:',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('Total Dirty Items: $totalDirtyItems'),
                                    Text(
                                        'Total Washed Items: $totalCleanedItems'),
                                    Text(
                                      // this percentage is out of the number of total dirty materials not out of all the materials
                                        'Percentage of Clean Materials: ${((totalCleanedItems / totalDirtyItems) * 100).toStringAsFixed(2)}%'),
                                    const Text(" "),
                                    Text(
                                        'Total Multi-Material: $totalMultiMaterial'),
                                    Text(
                                        'Total Correctly Separated: $totalCorrectlySeparated'),
                                    Text(
                                      // this percentage is out of all the multi material products not of all the materials
                                      'Percentage of Correctly Separated Materials: ${((totalCorrectlySeparated / totalMultiMaterial) * 100).toStringAsFixed(2)}%',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            // this button allows the user to clear all the data in the app
                            // it resets every variable to 0
                            // calls the clearData method
                            onPressed: () => clearData(context),
                            child: const Text('Clear Data'),
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

// this method is run when the "clear data" button is pressed
// it clears the data shared in the prefs map
  void clearData(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.clear(); // Clears SharedPreferences
      Provider.of<AppState>(context, listen: false)
          .clearData(); // Clears app state
    });

    // Shows a snackbar to inform the user that data has been cleared
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('All data has been cleared.'),
      ),
    );
  }
}
