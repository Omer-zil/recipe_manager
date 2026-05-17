import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/recipe_bloc.dart';
import '../bloc/recipe_event.dart';

import '../models/recipe_model.dart';

import '../theme/app_theme.dart';

class EditRecipeScreen extends StatefulWidget {
  final Recipe recipe;

  const EditRecipeScreen({super.key, required this.recipe});

  @override
  State<EditRecipeScreen> createState() => _EditRecipeScreenState();
}

class _EditRecipeScreenState extends State<EditRecipeScreen> {
  late TextEditingController titleController;

  late TextEditingController categoryController;

  late TextEditingController areaController;

  late TextEditingController instructionController;

  late TextEditingController imageController;

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController(text: widget.recipe.title);

    categoryController = TextEditingController(text: widget.recipe.category);

    areaController = TextEditingController(text: widget.recipe.area);

    instructionController = TextEditingController(
      text: widget.recipe.instructions,
    );

    imageController = TextEditingController(text: widget.recipe.imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkColor,

      appBar: AppBar(title: const Text('Edit Recipe')),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: ListView(
          children: [
            field(titleController, 'Title'),

            const SizedBox(height: 20),

            field(categoryController, 'Category'),

            const SizedBox(height: 20),

            field(areaController, 'Area'),

            const SizedBox(height: 20),

            field(imageController, 'Image URL'),

            const SizedBox(height: 20),

            field(instructionController, 'Instructions', maxLines: 6),

            const SizedBox(height: 30),

            SizedBox(
              height: 60,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  foregroundColor: Colors.white,
                ),

                onPressed: () {
                  final updatedRecipe = Recipe(
                    id: widget.recipe.id,

                    title: titleController.text,

                    category: categoryController.text,

                    area: areaController.text,

                    instructions: instructionController.text,

                    imageUrl: imageController.text,
                  );

                  context.read<RecipeBloc>().add(UpdateRecipe(updatedRecipe));

                  Navigator.pop(context);
                },

                child: const Text('Update Recipe'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget field(
    TextEditingController controller,
    String hint, {
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,

      maxLines: maxLines,

      style: const TextStyle(color: Colors.white),

      decoration: InputDecoration(
        hintText: hint,

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
