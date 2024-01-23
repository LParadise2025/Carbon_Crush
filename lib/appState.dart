import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class AppState extends ChangeNotifier {
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
    


  int dirtyItemTotal = 0;
  int cleanItemTotal = 0;
  int multiMaterialItemTotal = 0;
  int correctlySeparatedItemTotal = 0;
  int plasticItemTotal = 0; 
  int glassItemTotal = 0; 
  int paperItemTotal =0; 
  int cardboardItemTotal = 0; 
  int metalItemTotal = 0; 
  //initializes varibles and sets their default values
  // variables vreated by appstate can be accessed from all other classes where AppState is imported

  void updateDropdownValues({
    String? materialType1,
    String? quantity1,
    String? materialType2,
    String? quantity2,
    String? materialType3,
    String? quantity3,
    String? contaminatedQuantity,
    String? cleanedQuantity,
    String? mmProducts,
    String? correctlySeparatedProducts,
  }) {
    selectedMaterialType1 = materialType1;
    selectedQuantity1 = quantity1;
    selectedMaterialType2 = materialType2;
    selectedQuantity2 = quantity2;
    selectedMaterialType3 = materialType3;
    selectedQuantity3 = quantity3;
    selectedContaminatedQuantity = contaminatedQuantity;
    selectedCleanedQuantity = cleanedQuantity;
    selectedMMProducts = mmProducts;
    selectedCorrectlySeparatedProducts = correctlySeparatedProducts;

    notifyListeners();
  }

  Future<void> saveData() async {
    
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('dirtyItemTotal', dirtyItemTotal);
    prefs.setInt('cleanItemTotal', cleanItemTotal);
    prefs.setInt('multiMaterialItemTotal', multiMaterialItemTotal);
    prefs.setInt('correctlySeparatedItemTotal', correctlySeparatedItemTotal);
    prefs.setInt('plasticItemTotal', plasticItemTotal); 
    prefs.setInt('glassItemTotal', glassItemTotal); 
    prefs.setInt('paperItemTotal', paperItemTotal); 
    prefs.setInt('cardboardItemTotal', cardboardItemTotal); 
    prefs.setInt('metalItemTotal', metalItemTotal);
// uses Shared Preferences to persist data within the app 
// this is called whenever the values are changed

  }

  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dirtyItemTotal = prefs.getInt('dirtyItemTotal') ?? 0;
    cleanItemTotal = prefs.getInt('cleanItemTotal') ?? 0;
    multiMaterialItemTotal = prefs.getInt('multiMaterialItemTotal') ?? 0;
    correctlySeparatedItemTotal =
        prefs.getInt('correctlySeparatedItemTotal') ?? 0;
    plasticItemTotal = prefs.getInt('plasticItemTotal') ?? 0; 
    glassItemTotal = prefs.getInt('glassItemTotal') ?? 0; 
    paperItemTotal = prefs.getInt('paperItemTotal') ?? 0; 
    cardboardItemTotal = prefs.getInt('cardboardItemTotal') ?? 0; 
    metalItemTotal = prefs.getInt('metalItemTotal') ?? 0;
    print("data loaded!");


    notifyListeners();

    // Using the Shared Preferences plugin, this method sets the AppState variables to the value that had been persisted (as long as it is not zero)
    // this is called every time the app is opened 

  }

// these methods are called when a user submits the relative material type in the form in the logItems class
// when the material Item Total is changed, the value is updated where it is used in other classes by the notifyListeners() method
    void updatePlasticItemTotal(String? quantity) {
    if (quantity != null) {
      plasticItemTotal += int.parse(quantity); 
      notifyListeners();
    }
  }

    void updateGlassItemTotal(String? quantity) {
    if (quantity != null) {
      glassItemTotal += int.parse(quantity); 
      notifyListeners();
    }
  } 

   void updateMetalItemTotal(String? quantity) {
    if (quantity != null) {
      metalItemTotal += int.parse(quantity); 
      notifyListeners();
    }
  } 

    void updatePaperItemTotal(String? quantity) {
    if (quantity != null) {
      paperItemTotal += int.parse(quantity); 
      notifyListeners();
    }
  }

    void updateCardboardItemTotal(String? quantity) {
    if (quantity != null) {
      cardboardItemTotal += int.parse(quantity); 
      notifyListeners();
    }
  }

  void updateDirtyItemTotal(String? quantity) {
    if (quantity != null) {
      dirtyItemTotal += int.parse(quantity); 
      notifyListeners();
    }
  }

  void updateCleanItemTotal(String? quantity) {
    if (quantity != null) {
      cleanItemTotal += int.parse(quantity); 
      notifyListeners();
    }
  }
  void updateMultiMaterialItemTotal(String? quantity) {
    if (quantity != null) {
      multiMaterialItemTotal += int.parse(quantity); 
      notifyListeners();
    }
  }
  
    void updateCorrectlySepparatedItemTotal(String? quantity) {
    if (quantity != null) {
      correctlySeparatedItemTotal += int.parse(quantity); 
      notifyListeners();
    }
  }

//this method sets all of the variables used in the app to 0
// doing this allows the user to reset their progress
  void clearData(){

  dirtyItemTotal = 0;
  cleanItemTotal = 0;
  multiMaterialItemTotal = 0;
  correctlySeparatedItemTotal = 0;
  plasticItemTotal = 0; 
  glassItemTotal = 0; 
  paperItemTotal =0; 
  cardboardItemTotal = 0; 
  metalItemTotal = 0; 

    notifyListeners(); 
  }

}
