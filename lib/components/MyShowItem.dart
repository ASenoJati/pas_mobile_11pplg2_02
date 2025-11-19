import 'package:flutter/material.dart';
import 'package:pas_mobile_11pplg2_02/routes/static.dart';

class MyShowItem extends StatelessWidget {
  final String image;
  final String title;
  final String type;
  final String category;
  final VoidCallback onFavoriteTap;
  final String? text;
  final Icon? prefixIcon;
  final Color? buttonCollor;

  const MyShowItem({
    super.key,
    required this.image,
    required this.title,
    required this.type,
    required this.category,
    required this.onFavoriteTap,
    this.text,
    this.prefixIcon,
    this.buttonCollor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        shadowColor: AppStatic.neutraldark,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  image,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 15),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),
              Text(
                type,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 5),
              Text(
                category,
                style: TextStyle(fontSize: 13, color: AppStatic.neutraldark),
              ),

              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: onFavoriteTap,
                  icon:
                      prefixIcon ??
                      Icon(Icons.bookmark, color: AppStatic.neutrallight),
                  label: Text(
                    text ?? "Button",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppStatic.neutrallight,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonCollor ?? AppStatic.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
