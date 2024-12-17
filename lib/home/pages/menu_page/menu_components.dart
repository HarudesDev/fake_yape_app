import 'package:fake_yape_app/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BottomMenuOptions extends StatelessWidget {
  const BottomMenuOptions(
      {super.key, required this.optionTitle, required this.optionIcon});

  final String optionTitle;
  final IconData optionIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                optionIcon,
                color: Colors.black54,
                size: 27,
              ),
              const Gap(20),
              Text(
                optionTitle,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MenuCategory(
          categoryTitle: "Novedades",
          rows: [
            MenuCategoryRow(
              imageAsset: 'assets/images/secure_keyboard.png',
              rowText: 'Viajar en bus',
            ),
            MenuCategoryRow(
              imageAsset: 'assets/images/secure_keyboard.png',
              rowText: 'Delivery Tambo',
            ),
          ],
        ),
        MenuCategory(
          categoryTitle: "Yapeos",
          rows: [
            MenuCategoryRow(
              imageAsset: 'assets/images/secure_keyboard.png',
              rowText: 'Recarga celular',
            ),
            MenuCategoryRow(
              imageAsset: 'assets/images/secure_keyboard.png',
              rowText: 'Yapear servicios',
            ),
            MenuCategoryRow(
              imageAsset: 'assets/images/secure_keyboard.png',
              rowText: 'Cambios dólares',
            ),
            MenuCategoryRow(
              imageAsset: 'assets/images/secure_keyboard.png',
              rowText: 'Código de aprobación',
            ),
          ],
        ),
        MenuCategory(
          categoryTitle: 'Finanzas',
          rows: [
            MenuCategoryRow(
              imageAsset: 'assets/images/secure_keyboard.png',
              rowText: 'Créditos',
            ),
            MenuCategoryRow(
              imageAsset: 'assets/images/secure_keyboard.png',
              rowText: 'Seguros',
            ),
            MenuCategoryRow(
              imageAsset: 'assets/images/secure_keyboard.png',
              rowText: 'SOAT',
            ),
            MenuCategoryRow(
              imageAsset: 'assets/images/secure_keyboard.png',
              rowText: 'Remesas',
            ),
          ],
        ),
        MenuCategory(
          categoryTitle: 'Compras',
          rows: [
            MenuCategoryRow(
              imageAsset: 'assets/images/secure_keyboard.png',
              rowText: 'Promos',
            ),
            MenuCategoryRow(
              imageAsset: 'assets/images/secure_keyboard.png',
              rowText: 'Tienda',
            ),
            MenuCategoryRow(
              imageAsset: 'assets/images/secure_keyboard.png',
              rowText: 'Entradas',
            ),
            MenuCategoryRow(
              imageAsset: 'assets/images/secure_keyboard.png',
              rowText: 'Gaming',
            ),
            MenuCategoryRow(
              imageAsset: 'assets/images/secure_keyboard.png',
              rowText: 'Pedir Gas',
            ),
            MenuCategoryRow(
              imageAsset: 'assets/images/secure_keyboard.png',
              rowText: 'Cobrar con YapeLink',
            ),
          ],
        ),
      ],
    );
  }
}

class MenuCategory extends StatelessWidget {
  const MenuCategory({
    super.key,
    required this.categoryTitle,
    required this.rows,
  });

  final String categoryTitle;
  final List<MenuCategoryRow> rows;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Gap(10),
      Card(
        shadowColor: Colors.transparent,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                categoryTitle,
                style: const TextStyle(
                  color: mainColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Gap(10),
              ...rows,
            ],
          ),
        ),
      ),
    ]);
  }
}

class MenuCategoryRow extends StatelessWidget {
  const MenuCategoryRow({
    super.key,
    required this.imageAsset,
    required this.rowText,
  });

  final String imageAsset;
  final String rowText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          thickness: 0.5,
          color: Colors.black12,
        ),
        const Gap(6.5),
        Row(
          children: [
            Image.asset(
              imageAsset,
              height: 30,
            ),
            const Gap(30),
            Text(
              rowText,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ],
        ),
        const Gap(6.5),
      ],
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.onPressed,
    required this.buttonIcon,
    required this.buttonText,
  });

  final Function() onPressed;
  final IconData buttonIcon;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () => onPressed(),
          icon: Icon(
            buttonIcon,
            color: Colors.white,
          ),
        ),
        Text(
          buttonText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
