import 'package:flutter/material.dart';
import 'package:get_x_first_trial/models/product.dart';

class Property {
  static Map properties = {
    'cpu': {'path': 'https://cdn-icons-png.flaticon.com/512/900/900618.png'},
    'storage': {
      'path': 'https://cdn-icons-png.flaticon.com/512/2906/2906274.png'
    },
    'system': {
      'path': 'https://cdn-icons-png.flaticon.com/512/2630/2630878.png'
    },
    'ram': {'path': 'https://cdn-icons-png.flaticon.com/512/543/543279.png'}
  };

  static splitFromJson1(Product product) {
    return '${product.ramsAndStorage[0].substring(0, product.ramsAndStorage[0].indexOf('/'))} GB';
  }

  static splitFromJson2(Product product) {
    return '${product.ramsAndStorage[0].substring(product.ramsAndStorage[0].indexOf('/') + 1)} GB';
  }

  static Color parseColor(String color) {
    return Color(int.parse(color));
  }
}

class PropertiesRow extends StatelessWidget {
  const PropertiesRow({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PropertyContainer(
          name: product.cpu,
          imagePath: Property.properties['cpu']['path'],
        ),
        PropertyContainer(
          name: Property.splitFromJson1(product),
          imagePath: Property.properties['storage']['path'],
        ),
        PropertyContainer(
          name: product.system,
          imagePath: Property.properties['system']['path'],
        ),
        PropertyContainer(
            name: Property.splitFromJson2(product),
            imagePath: Property.properties['ram']['path'])
      ],
    );
  }
}

class PropertyContainer extends StatelessWidget {
  final imagePath;
  final name;

  const PropertyContainer(
      {Key? key, required this.name, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image(height: 40, width: 40, image: NetworkImage(imagePath)),
          SizedBox(
            height: 10,
          ),
          Text(name)
        ],
      ),
    );
  }
}

class RamsContainer extends StatelessWidget {
  const RamsContainer({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 90,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        // shape: BoxShape.circle,
        color: Color.fromARGB(161, 13, 89, 175),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Text(product.ramsAndStorage[0]),
    );
  }
}
