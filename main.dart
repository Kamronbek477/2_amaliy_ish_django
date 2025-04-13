import 'package:flutter/material.dart';

void main() {
  runApp(OlchaApp());
}

class OlchaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Olcha Shop',
      theme: ThemeData(
        primarySwatch: Colors.red,
        useMaterial3: true,
      ),
      home: ProductListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Product {
  final String image;
  final String title;
  final String price;
  final String installment;
  final String discount;
  final String costPrice; // tan narxi
  final String color;
  final String model;
  final String brand;
  final int stockCount;

  Product({
    required this.image,
    required this.title,
    required this.price,
    required this.installment,
    required this.discount,
    required this.costPrice,
    required this.color,
    required this.model,
    required this.brand,
    required this.stockCount,
  });
}

class ProductListPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      image: 'https://i.ibb.co/tKQds2z/akb.jpg',
      title: 'Akkumulyator Delkor 60 Ah',
      price: '888 860 so\'m',
      installment: '105 000 so\'m x 12 oy',
      discount: '-2%',
      costPrice: '800 000 so\'m',
      color: 'Qora',
      model: '60Ah',
      brand: 'Delkor',
      stockCount: 15,
    ),
    Product(
      image: 'https://i.ibb.co/MPKRp7r/magnitola.jpg',
      title: 'Avtomagnitola Pioneer FH-S725BT',
      price: '1 739 500 so\'m',
      installment: '204 000 so\'m x 12 oy',
      discount: '-2%',
      costPrice: '1 600 000 so\'m',
      color: 'Qora',
      model: 'FH-S725BT',
      brand: 'Pioneer',
      stockCount: 10,
    ),
    Product(
      image: 'https://i.ibb.co/6tpXh7r/inspector.jpg',
      title: 'Radar detektor Inspector Star Air',
      price: '2 535 000 so\'m',
      installment: '634 000 so\'m x 4 oy',
      discount: '-14%',
      costPrice: '2 300 000 so\'m',
      color: 'Kulrang',
      model: 'Star Air',
      brand: 'Inspector',
      stockCount: 6,
    ),
    Product(
      image: 'https://i.ibb.co/mBvMh45/dominant.jpg',
      title: 'Avtosignalizatsiya Magicar Dominant 909',
      price: '2 806 720 so\'m',
      installment: '320 000 so\'m x 12 oy',
      discount: '-2%',
      costPrice: '2 500 000 so\'m',
      color: 'Qora',
      model: '909',
      brand: 'Magicar',
      stockCount: 8,
    ),
    Product(
      image: 'https://i.ibb.co/N9kMY2q/neoline.jpg',
      title: 'Radar-detektor Neoline X-COP 8800s',
      price: '2 873 360 so\'m',
      installment: '337 000 so\'m x 12 oy',
      discount: '-2%',
      costPrice: '2 600 000 so\'m',
      color: 'Qora',
      model: 'X-COP 8800s',
      brand: 'Neoline',
      stockCount: 12,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Olcha Mahsulotlar'),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (context, index) {
            return ProductCard(product: products[index]);
          },
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Bosilganda tafsilotlar sahifasiga o'tish
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(product: product),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.redAccent),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.network(
                    product.image,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      product.discount,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.title,
                style: TextStyle(fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                product.price,
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                product.installment,
                style: TextStyle(color: Colors.orange, fontSize: 12),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: Icon(Icons.shopping_cart),
                label: Text("В рассрочку"),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Center(
            child: Image.network(product.image, height: 200),
          ),
          SizedBox(height: 16),
          Text(product.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text('Narxi: ${product.price}', style: TextStyle(fontSize: 16, color: Colors.red)),
          Text('Tan narxi: ${product.costPrice}', style: TextStyle(fontSize: 16, color: Colors.grey)),
          SizedBox(height: 12),
          Text('Brend: ${product.brand}'),
          Text('Model: ${product.model}'),
          Text('Rang: ${product.color}'),
          Text('Ombordagi soni: ${product.stockCount} dona'),
          SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Savatga qo‘shildi')),
              );
            },
            icon: Icon(Icons.shopping_cart),
            label: Text("Savatga qo‘shish"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              padding: EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          )
        ],
      ),
    );
  }
}
