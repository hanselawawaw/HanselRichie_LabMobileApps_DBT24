import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'food_model.dart';

class SelectedFoodPage extends StatefulWidget {
  final FoodItem food;

  const SelectedFoodPage({super.key, required this.food});

  @override
  State<SelectedFoodPage> createState() => _SelectedFoodPageState();
}

class _SelectedFoodPageState extends State<SelectedFoodPage> {
  String _selectedMeasurement = 'Large';
  int _servings = 1;
  bool _showNumpad = false;
  String _numpadInput = '';

  final List<String> _measurements = ['Large', 'Medium', 'G', 'Small'];

  double get _multiplier => _servings.toDouble();

  double get _displayCalories => widget.food.calories * _multiplier;
  double get _displayProtein => widget.food.protein * _multiplier;
  double get _displayCarbs => widget.food.carbs * _multiplier;
  double get _displayFats => widget.food.fats * _multiplier;

  void _onNumpadKey(String key) {
    setState(() {
      if (key == '⌫') {
        if (_numpadInput.isNotEmpty) {
          _numpadInput = _numpadInput.substring(0, _numpadInput.length - 1);
        }
      } else if (key == 'Log') {
        _showNumpad = false;
        if (_numpadInput.isNotEmpty) {
          _servings = int.tryParse(_numpadInput) ?? _servings;
          _numpadInput = '';
        }
      } else {
        _numpadInput += key;
        _servings = int.tryParse(_numpadInput) ?? _servings;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Top bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
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
                        'Selected food',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Food name
                        Text(
                          widget.food.name,
                          style: GoogleFonts.poppins(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Measurement label
                        Text(
                          'Measurement',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Colors.grey.shade600,
                          ),
                        ),

                        const SizedBox(height: 8),

                        // Measurement chips
                        Row(
                          children: _measurements.map((m) {
                            final selected = m == _selectedMeasurement;
                            return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: GestureDetector(
                                onTap: () => setState(() => _selectedMeasurement = m),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: selected ? Colors.black : Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: selected ? Colors.black : Colors.grey.shade300,
                                    ),
                                  ),
                                  child: Text(
                                    m,
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: selected ? Colors.white : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),

                        const SizedBox(height: 20),

                        // Number of servings
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Number of Servings',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setState(() {
                                _showNumpad = !_showNumpad;
                                _numpadInput = '';
                              }),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      '$_servings',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    const Icon(Icons.edit, size: 14, color: Colors.grey),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Calories card
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.local_fire_department,
                                  color: Color(0xFF4CAF50), size: 22),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Calories',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  Text(
                                    _displayCalories.toStringAsFixed(0),
                                    style: GoogleFonts.poppins(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 12),

                        // Macros row
                        Row(
                          children: [
                            _MacroCard(
                              label: 'Protein',
                              value: '${_displayProtein.toStringAsFixed(0)}g',
                              color: const Color(0xFFE53935),
                              changed: _servings > 1,
                            ),
                            const SizedBox(width: 10),
                            _MacroCard(
                              label: 'Carbs',
                              value: '${_displayCarbs.toStringAsFixed(0)}g',
                              color: const Color(0xFFFB8C00),
                              changed: _servings > 1,
                            ),
                            const SizedBox(width: 10),
                            _MacroCard(
                              label: 'Fats',
                              value: '${_displayFats.toStringAsFixed(0)}g',
                              color: const Color(0xFF1E88E5),
                              changed: _servings > 1,
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        // Other nutrition facts
                        Text(
                          'Other nutrition facts',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 12),

                        ...widget.food.otherNutrition.entries.map((entry) {
                          return _NutritionRow(
                            label: entry.key,
                            value: entry.value,
                          );
                        }),

                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Numpad overlay
            if (_showNumpad)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: _NumpadWidget(
                  currentValue: _numpadInput.isEmpty ? '$_servings' : _numpadInput,
                  onKey: _onNumpadKey,
                  onLog: () {
                    setState(() => _showNumpad = false);
                  },
                ),
              ),

            // Log button (when numpad hidden)
            if (!_showNumpad)
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, {'logged': true, 'servings': _servings});
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: const Size(double.infinity, 52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Log',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _MacroCard extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  final bool changed;

  const _MacroCard({
    required this.label,
    required this.value,
    required this.color,
    required this.changed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        value,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      if (changed) ...[
                        const SizedBox(width: 4),
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NutritionRow extends StatelessWidget {
  final String label;
  final String value;

  const _NutritionRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(fontSize: 13, color: Colors.black87),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

class _NumpadWidget extends StatelessWidget {
  final String currentValue;
  final Function(String) onKey;
  final VoidCallback onLog;

  const _NumpadWidget({
    required this.currentValue,
    required this.onKey,
    required this.onLog,
  });

  static const keys = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9'],
    ['+*#', '0', '⌫'],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // Log button inside numpad area
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: ElevatedButton(
              onPressed: onLog,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 0,
              ),
              child: Text(
                'Log',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          // Numpad keys
          ...keys.map((row) {
            return Row(
              children: row.map((key) {
                return Expanded(
                  child: GestureDetector(
                    onTap: () => onKey(key),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade100),
                        color: Colors.white,
                      ),
                      alignment: Alignment.center,
                      child: key == '⌫'
                          ? const Icon(Icons.backspace_outlined, size: 20)
                          : Text(
                              key,
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                    ),
                  ),
                );
              }).toList(),
            );
          }),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}