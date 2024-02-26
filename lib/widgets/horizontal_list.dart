import 'package:house/screens/product_screen.dart';
import 'package:house/widgets/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_avif/flutter_avif.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HorList extends StatefulWidget {
  const HorList({required String sex, super.key});

  @override
  State<HorList> createState() => _HorListState();
}

class _HorListState extends State<HorList> {
  List<ItemModel> items = [
    ItemModel(
        itemName: 'Худі',
        itemGroup: 'Худі',
        itemPrice: '999',
        itemSex: 'man',
        itemImage: 'assets/images/hoodie1.avif',
        isFavorite: false),
    ItemModel(
        itemName: 'Футболка',
        itemGroup: 'Футболки',
        itemPrice: '550',
        itemSex: 'man',
        itemImage: 'assets/images/hoodie2.avif',
        isFavorite: false),
    ItemModel(
        itemName: 'Худі',
        itemGroup: 'Худі',
        itemPrice: '699',
        itemSex: 'man',
        itemImage: 'assets/images/hoodie3.avif',
        isFavorite: false),
    ItemModel(
        itemName: 'Футболка',
        itemGroup: 'Футболки',
        itemPrice: '499',
        itemSex: 'man',
        itemImage: 'assets/images/hoodie4.avif',
        isFavorite: false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'ДЛЯ НЬОГО',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(child: SvgPicture.asset('assets/images/logo.svg')),
              ListTile(
                title: const Text('ОДЯГ'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('ВЗУТТЯ ТА АКСЕСУАРИ'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('СКОРО В ПРОДАЖУ'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          //scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              for (final item in items)
                ClothesListItem(
                  imageUrl: item.itemImage,
                  name: item.itemName,
                  price: item.itemPrice,
                ),
            ],
          ),
        ));
  }
}

@immutable
class ClothesListItem extends StatelessWidget {
  const ClothesListItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
  });

  final String imageUrl;
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      child: AspectRatio(
        aspectRatio: 9 / 16,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: GestureDetector(
            child: Stack(
              children: [
                _buildParallaxBackground(context),
                _buildGradient(),
                _buildTitleAndSubtitle(),
              ],
            ),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => ProductScreen(imageUrl: imageUrl)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return Positioned.fill(
      child: Hero(
        tag: 'product',
        child: AvifImage.asset(
          imageUrl,
          fit: BoxFit.none,
        ),
      ),
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.6, 0.95],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndSubtitle() {
    return Positioned(
      left: 20,
      bottom: 20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            price,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}
