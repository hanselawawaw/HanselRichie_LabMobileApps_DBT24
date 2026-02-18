import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'food_model.dart';
import 'selected_food_page.dart';

class FoodDatabasePage extends StatefulWidget {
  const FoodDatabasePage({super.key});

  @override
  State<FoodDatabasePage> createState() => _FoodDatabasePageState();
}

class _FoodDatabasePageState extends State<FoodDatabasePage> {
  final TextEditingController _searchController = TextEditingController();
  List<FoodItem> loggedFoods = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _openFoodDetail(FoodItem food) async {
    final result = await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute(
        builder: (_) => SelectedFoodPage(food: food),
      ),
    );

    if (result != null && result['logged'] == true) {
      setState(() {
        if (!loggedFoods.any((f) => f.name == food.name)) {
          loggedFoods.add(food);
        }
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Food logged',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "If you'd like to make edits, click view to make changes",
                  style: GoogleFonts.poppins(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
            backgroundColor: Colors.white,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.all(16),
            action: SnackBarAction(
              label: 'View',
              textColor: Colors.black,
              onPressed: () {
                _openFoodDetail(food);
              },
            ),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.maybePop(context),
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.chevron_left, size: 22),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Food Database',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            // Search field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _searchController,
                  style: GoogleFonts.poppins(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'Describe what you ate',
                    hintStyle: GoogleFonts.poppins(
                      color: Colors.grey.shade400,
                      fontSize: 14,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Log empty meal button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.edit_outlined, size: 18, color: Colors.black54),
                label: Text(
                  'Log empty meal',
                  style: GoogleFonts.poppins(
                    color: Colors.black54,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  side: BorderSide(color: Colors.grey.shade300),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Recently logged title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Recently logged',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 4),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "You haven't uploaded any food. Here are our\nfrequently added food",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey.shade500,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Food list
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: frequentlyAddedFoods.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final food = frequentlyAddedFoods[index];
                  final isLogged = loggedFoods.any((f) => f.name == food.name);

                  return _FoodTile(
                    food: food,
                    isLogged: isLogged,
                    onTap: () => _openFoodDetail(food),
                    onAdd: () => _openFoodDetail(food),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FoodTile extends StatelessWidget {
  final FoodItem food;
  final bool isLogged;
  final VoidCallback onTap;
  final VoidCallback onAdd;

  const _FoodTile({
    required this.food,
    required this.isLogged,
    required this.onTap,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isLogged ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isLogged ? Colors.black : Colors.grey.shade200,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food.name,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isLogged ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(
                        Icons.local_fire_department,
                        size: 14,
                        color: isLogged ? Colors.white70 : const Color(0xFF4CAF50),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${food.calories.toInt()} cal · ${food.servingUnit}',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: isLogged ? Colors.white70 : Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: onAdd,
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: isLogged ? Colors.white : Colors.black,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isLogged ? Icons.check : Icons.add,
                  size: 18,
                  color: isLogged ? Colors.black : Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}