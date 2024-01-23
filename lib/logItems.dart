import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'appState.dart';



class LogItems extends StatefulWidget {
  const LogItems({
    Key? key,
  }) : super(key: key);

  @override
  State<LogItems> createState() => _LogItemsState();
}

class _LogItemsState extends State<LogItems> {
  // lists of values for the dropdown menus 
  // the lists of material types and quantities are reused for each of the 3 material dropdowns 
  final materialTypes = ["plastic", "glass", "paper", "cardboard", "metal"];
  final quantities = ["1", "2", "3", "4", "5"];
  final contaminatedProducts = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15"
  ];
  final cleanedProducts = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
  ];
  final multiMaterialProducts = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15"
  ];
  final correctlySeparatedProducts = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15"
  ];
  // creates temporary values to hold the values in the dropdown menus 
  String? tempMaterialType1;
  String? tempQuantity1;
  String? tempMaterialType2;
  String? tempQuantity2;
  String? tempMaterialType3;
  String? tempQuantity3;
  String? tempContaminatedQuantity;
  String? tempCleanedQuantity;
  String? tempMMProducts;
  String? tempCorrectlySeparatedProducts;

// additional variables to hold the values in the dropdown menus 
// the ? means that it can be null
  String? selectedMaterialType1;
  String? selectedQuantity1;
  String? selectedMaterialType2;
  String? selectedQuantity2;
  String? selectedMaterialType3;
  String? selectedQuantity3;
  String? selectedContaminatedQuantity;
  String? selectedCleanedQuantity;
  String? selectedMMProducts;
  String? selectedCorrectlySeparatedProducts;

 
  // there is GlobalKey<FormState> for each dropdown menu
  // these allow the form to be reset after the user clicks submit 
  GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  GlobalKey<FormState> _formKey3 = GlobalKey<FormState>();
  GlobalKey<FormState> _formKey4 = GlobalKey<FormState>();
  GlobalKey<FormState> _formKey5 = GlobalKey<FormState>();
  GlobalKey<FormState> _formKey6 = GlobalKey<FormState>();
  GlobalKey<FormState> _formKey7 = GlobalKey<FormState>();
  GlobalKey<FormState> _formKey8 = GlobalKey<FormState>();
  GlobalKey<FormState> _formKey9 = GlobalKey<FormState>();
  GlobalKey<FormState> _formKey10 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Carbon Crush"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 7, 93, 5),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Column(children: [
                      Text("Log Your Recyclables",
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                      Center(
                        child: 
                        // instructions for the page
                        Text(
                            "Remember to only log materials that you have actually put in the recycling.",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            )),
                      ),
                      Text(
                          "If you have any questions, check out the references tab.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          )),
                    ])),
               const SizedBox(height: 16.0),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 7, 93, 5),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Wrap(
                    spacing: 16.0,
                    runSpacing: 8.0,
                    children: [
                     const Text("Select the material type and quantity. ",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          )),
                          // calls a method to build a dropdown pair and passes in the relative form keys
                          // this is where users will select the material type and quantity
                      buildDropdownPair(appState.selectedMaterialType1,
                          appState.selectedQuantity1, (materialType) {
                        tempMaterialType1 = materialType;
                      }, (quantity) {
                        tempQuantity1 = quantity;
                      }, _formKey1, _formKey6 // Pass keys
                          ),
                      buildDropdownPair(appState.selectedMaterialType2,
                          appState.selectedQuantity2, (materialType) {
                        tempMaterialType2 = materialType;
                      }, (quantity) {
                        tempQuantity2 = quantity;
                      }, _formKey2, _formKey7 // Pass keys
                          ),
                      buildDropdownPair(appState.selectedMaterialType3,
                          appState.selectedQuantity3, (materialType) {
                        tempMaterialType3 = materialType;
                      }, (quantity) {
                        tempQuantity3 = quantity;
                      }, _formKey3, _formKey8 // Pass keys
                          ),
                    ],
                  ),
                ),
              const SizedBox(height: 16.0),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 7, 93, 5),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    children: [
                     const Text(
                          "Select the number of food contaminated products and the number you cleaned.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          )),
                    const  Text("Ex. Peanutbutter jar or yogurt container",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          )),
                          // This is where users log the number of contaminated products and the number of those that they cleaned
                      buildDropdownPair2(appState.selectedContaminatedQuantity,
                          appState.selectedCleanedQuantity,
                          (contaminatedQuantity) {
                        tempContaminatedQuantity = contaminatedQuantity;
                      }, (cleanedQuantity) {
                        tempCleanedQuantity = cleanedQuantity;
                      }, _formKey4, _formKey9),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 7, 93, 5),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    children: [
                      const Text(
                          "Select the number of multi-material products and the number that you correctly separated.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          )),
                     const Text("Ex. Water bottle with plastic label. ",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          )),
                          // this is where users log the number of multi material products and the number that they correctly separated
                      buildDropdownPair3(appState.selectedMMProducts,
                          appState.selectedCorrectlySeparatedProducts,
                          (mmProducts) {
                        tempMMProducts = mmProducts;
                      }, (correctlySeparatedProducts) {
                        tempCorrectlySeparatedProducts =
                            correctlySeparatedProducts;
                      }, _formKey5, _formKey10),
                    ],
                  ),
                ),
               const SizedBox(height: 16.0),
               // this is the save button
               // it saves all of the form values to the AppState class and resets the formfield
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // Reset dropdowns
                      _formKey1.currentState?.reset();
                      _formKey2.currentState?.reset();
                      _formKey3.currentState?.reset();
                      _formKey4.currentState?.reset();
                      _formKey5.currentState?.reset();
                      _formKey6.currentState?.reset();
                      _formKey7.currentState?.reset();
                      _formKey8.currentState?.reset();
                      _formKey9.currentState?.reset();
                      _formKey10.currentState?.reset();

                      selectedMaterialType1 = tempMaterialType1;
                      selectedQuantity1 = tempQuantity1;
                      selectedMaterialType2 = tempMaterialType2;
                      selectedQuantity2 = tempQuantity2;
                      selectedMaterialType3 = tempMaterialType3;
                      selectedQuantity3 = tempQuantity3;
                      selectedContaminatedQuantity = tempContaminatedQuantity;
                      selectedCleanedQuantity = tempCleanedQuantity;
                      selectedMMProducts = tempMMProducts;
                      selectedCorrectlySeparatedProducts =
                          tempCorrectlySeparatedProducts;

                      // Reset temporary and selected values
                    });

                    // Check if selectedMaterialType and selectedQuantity are not null before updating
                    // this is where the vairables are saved to AppState 
                    // checks first dropdown
                    if (selectedMaterialType1 != null &&
                        tempQuantity1 != null) {
                          if (selectedMaterialType1 == 'plastic'){
                            appState.updatePlasticItemTotal(tempQuantity1);
                          }
                          else if (selectedMaterialType1 == 'glass'){
                            appState.updateGlassItemTotal(tempQuantity1);
                          }
                          else if (selectedMaterialType1 == 'cardboard'){
                            appState.updateCardboardItemTotal(tempQuantity1);
                          }
                          else if (selectedMaterialType1 == 'paper'){
                            appState.updatePaperItemTotal(tempQuantity1);
                          }
                           else if (selectedMaterialType1 == 'metal'){
                            appState.updateMetalItemTotal(tempQuantity1);
                          }
                    }
                    // checks second dropdown
                    if (selectedMaterialType2 != null &&
                        tempQuantity2 != null) {
                        if (selectedMaterialType2 == 'plastic'){
                            appState.updatePlasticItemTotal(tempQuantity2);
                          }
                          else if (selectedMaterialType2 == 'glass'){
                            appState.updateGlassItemTotal(tempQuantity2);
                          }
                          else if (selectedMaterialType2 == 'cardboard'){
                            appState.updateCardboardItemTotal(tempQuantity2);
                          }
                          else if (selectedMaterialType2 == 'paper'){
                            appState.updatePaperItemTotal(tempQuantity2);
                          }
                          else if (selectedMaterialType2 == 'metal'){
                            appState.updateMetalItemTotal(tempQuantity2);
                          }
                    }

                    // checks third dropdown 
                    if (selectedMaterialType3 != null &&
                        tempQuantity3 != null) {
                      if (selectedMaterialType3 == 'plastic'){
                            appState.updatePlasticItemTotal(tempQuantity3);
                          }
                          else if (selectedMaterialType3 == 'glass'){
                            appState.updateGlassItemTotal(tempQuantity3);
                          }
                          else if (selectedMaterialType3 == 'cardboard'){
                            appState.updateCardboardItemTotal(tempQuantity3);
                          }
                          else if (selectedMaterialType3 == 'paper'){
                            appState.updatePaperItemTotal(tempQuantity3);
                          }
                          else if (selectedMaterialType3 == 'metal'){
                            appState.updateMetalItemTotal(tempQuantity3);
                          }
                    }
                    
                    //checks contaminated and cleaned dropdowns
                    if (selectedContaminatedQuantity != null) {
                      appState
                          .updateDirtyItemTotal(selectedContaminatedQuantity);
                    }
                    if (selectedCleanedQuantity != null) {
                      appState.updateCleanItemTotal(selectedCleanedQuantity);
                    }
                    // checks multi material and separated dropdowns 
                    if (selectedMMProducts != null) {
                      appState.updateMultiMaterialItemTotal(selectedMMProducts);
                    }
                    if (selectedCorrectlySeparatedProducts != null) {
                      appState.updateCorrectlySepparatedItemTotal(
                          selectedCorrectlySeparatedProducts);
                    }

                    appState.saveData();
                    // saves the data using Shared Preferences

                    tempMaterialType1 = null;
                    tempQuantity1 = null;
                    tempMaterialType2 = null;
                    tempQuantity2 = null;
                    tempMaterialType3 = null;
                    tempQuantity3 = null;
                    tempContaminatedQuantity = null;
                    tempCleanedQuantity = null;
                    tempMMProducts = null;
                    tempCorrectlySeparatedProducts = null;

                    selectedMaterialType1 = null;
                    selectedQuantity1 = null;
                    selectedMaterialType2 = null;
                    selectedQuantity2 = null;
                    selectedMaterialType3 = null;
                    selectedQuantity3 = null;
                    selectedContaminatedQuantity = null;
                    selectedCleanedQuantity = null;
                    selectedMMProducts = null;
                    selectedCorrectlySeparatedProducts = null;

                    // resets all values to null so the form can be used again

                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
// method to build material dropdown pairs
  Widget buildDropdownPair(
    String? selectedMaterialType,
    String? selectedQuantity,
    void Function(String?) onMaterialTypeChanged,
    void Function(String?) onQuantityChanged,
    GlobalKey<FormState> formKey1,
    GlobalKey<FormState> formKey2,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          buildDropdown(
            selectedMaterialType,
            materialTypes,
            "Material",
            onMaterialTypeChanged,
            formKey1,
          ),
          const SizedBox(width: .5), 
          buildDropdown(
            selectedQuantity,
            quantities,
            "Quantity",
            onQuantityChanged,
            formKey2,
          ),
        ],
      ),
    );
  }

// method to build contaminated and cleaned dropdowns
  Widget buildDropdownPair2(
    String? selectedContaminatedQuantity,
    String? selectedCleanedQuantity,
    void Function(String?) onContaminatedQuantityChanged,
    void Function(String?) onCleanedQuantityChanged,
    GlobalKey<FormState> formKey1,
    GlobalKey<FormState> formKey2,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          buildDropdown(
            selectedContaminatedQuantity,
            contaminatedProducts,
            "# Dirty Items",
            onContaminatedQuantityChanged,
            formKey1,
          ),
          const SizedBox(width: 0.5),
          buildDropdown(
            selectedCleanedQuantity,
            cleanedProducts,
            "# Washed Items",
            onCleanedQuantityChanged,
            formKey2,
          ),
        ],
      ),
    );
  }

// method to build multimaterial and separated products
  Widget buildDropdownPair3(
    String? selectedMMProducts,
    String? selectedCorrectlySeparatedProducts,
    void Function(String?) onMMProductsChanged,
    void Function(String?) onCorrectlySeparatedProductsChanged,
    GlobalKey<FormState> formKey1,
    GlobalKey<FormState> formKey2,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0), 
      child: Row(
        children: [
          buildDropdown(
            selectedMMProducts,
            multiMaterialProducts,
            "# Multi Material",
            onMMProductsChanged,
            formKey1,
          ),
          const SizedBox(width: 0.5), 
          buildDropdown(
            selectedCorrectlySeparatedProducts,
            correctlySeparatedProducts,
            "# Correctly Separated",
            onCorrectlySeparatedProductsChanged,
            formKey2,
          ),
        ],
      ),
    );
  }

// this method is called by the above builddropdownpair methods
// it creates a dropdown menu 
  Widget buildDropdown(
    String? selectedValue,
    List<String> items,
    String labelText,
    void Function(String?) onChanged,
    GlobalKey<FormState> formKey,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          child: Form(
            key: formKey,
            child: DropdownButtonFormField(
              value: selectedValue,
              items: items
                  .map(
                    (e) => DropdownMenuItem(
                      child: Text(
                        e,
                        style: const TextStyle(fontSize: 12, color: Colors.black),
                      ),
                      value: e,
                    ),
                  )
                  .toList(),
              onChanged: (val) {
                onChanged(val as String?);
              },
              decoration: InputDecoration(
                // styles the dropdowns 
                labelText: labelText,
                labelStyle: const TextStyle(fontSize: 10, color: Colors.black),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green), 
                  borderRadius: BorderRadius.circular(12.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              style: const TextStyle(fontSize: 12, color: Colors.black),
              icon: const Icon(Icons.arrow_drop_down,
                  color: Colors.green), 
            ),
          ),
        ),
      ),
    );
  }
}
