class FoodItem {
  final String name;
  final double calories;
  final String servingUnit;
  final double protein;
  final double carbs;
  final double fats;
  final Map<String, String> otherNutrition;

  const FoodItem({
    required this.name,
    required this.calories,
    required this.servingUnit,
    required this.protein,
    required this.carbs,
    required this.fats,
    this.otherNutrition = const {},
  });
}

final List<FoodItem> frequentlyAddedFoods = [
  FoodItem(
    name: 'White Rice',
    calories: 135,
    servingUnit: 'serving',
    protein: 2.7,
    carbs: 29,
    fats: 0.3,
    otherNutrition: {
      'Saturated Fat': '0.10g',
      'Polyunsaturated Fat': '0.09g',
      'Monounsaturated Fat': '0.09g',
      'Cholesterol': '0mg',
      'Sodium': '1mg',
      'Fiber': '0.40g',
      'Sugar': '0.00g',
      'Potassium': '35mg',
      'Vitamin A': '0μg',
      'Vitamin C': '0.00mg',
      'Calcium': '10mg',
      'Iron': '1.20mg',
    },
  ),
  FoodItem(
    name: 'Egg',
    calories: 74,
    servingUnit: 'large',
    protein: 6,
    carbs: 0,
    fats: 4,
    otherNutrition: {
      'Saturated Fat': '1g',
      'Polyunsaturated Fat': '0.00g',
      'Monounsaturated Fat': '1g',
      'Cholesterol': '212mg',
      'Sodium': '70mg',
      'Fiber': '0.00g',
      'Sugar': '0.00g',
      'Potassium': '67mg',
      'Vitamin A': '70μg',
      'Vitamin C': '0.00mg',
      'Calcium': '26mg',
      'Iron': '0.00mg',
    },
  ),
  FoodItem(
    name: 'Fried Tofu',
    calories: 35,
    servingUnit: 'piece',
    protein: 2.4,
    carbs: 1.5,
    fats: 2.3,
    otherNutrition: {
      'Saturated Fat': '0.30g',
      'Polyunsaturated Fat': '1.30g',
      'Monounsaturated Fat': '0.50g',
      'Cholesterol': '0mg',
      'Sodium': '2mg',
      'Fiber': '0.20g',
      'Sugar': '0.60g',
      'Potassium': '42mg',
      'Vitamin A': '0μg',
      'Vitamin C': '0.10mg',
      'Calcium': '65mg',
      'Iron': '0.60mg',
    },
  ),
];