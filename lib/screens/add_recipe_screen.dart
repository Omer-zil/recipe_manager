import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/recipe_bloc.dart';
import '../bloc/recipe_event.dart';

import '../models/recipe_model.dart';

import '../theme/app_theme.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final titleController = TextEditingController();

  final categoryController = TextEditingController();

  final areaController = TextEditingController();

  final instructionController = TextEditingController();

  final imageController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkColor,

      appBar: AppBar(title: const Text('Add Recipe')),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: formKey,

          child: ListView(
            children: [
              customField(titleController, 'Recipe Title'),

              const SizedBox(height: 20),

              customField(categoryController, 'Category'),

              const SizedBox(height: 20),

              customField(areaController, 'Area'),

              const SizedBox(height: 20),

              customField(imageController, 'Image URL'),

              const SizedBox(height: 20),

              customField(instructionController, 'Instructions', maxLines: 6),

              const SizedBox(height: 30),

              SizedBox(
                height: 60,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                  ),

                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final recipe = Recipe(
                        id: DateTime.now().toString(),

                        title: titleController.text,

                        category: categoryController.text,

                        area: areaController.text,

                        instructions: instructionController.text,

                        imageUrl: imageController.text,
                      );

                      context.read<RecipeBloc>().add(AddRecipe(recipe));

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Recipe Added Successfully'),
                        ),
                      );

                      Navigator.pop(context);
                    }
                  },

                  child: const Text(
                    'Add Recipe',

                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customField(
    TextEditingController controller,
    String hint, {
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,

      maxLines: maxLines,

      style: const TextStyle(color: Colors.white),

      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Required Field';
        }

        return null;
      },

      decoration: InputDecoration(
        hintText: hint,

        hintStyle: const TextStyle(color: Colors.white54),

        filled: true,

        fillColor: Colors.white10,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),

          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
