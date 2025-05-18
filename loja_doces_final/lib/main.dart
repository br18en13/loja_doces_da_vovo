import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Produto {
  final String nome;
  final double preco;
  final String imagemUrl;

  Produto(this.nome, this.preco, this.imagemUrl);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loja de Doces',
      home: LojaDeDoces(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LojaDeDoces extends StatefulWidget {
  @override
  _LojaDeDocesState createState() => _LojaDeDocesState();
}

class _LojaDeDocesState extends State<LojaDeDoces> {
  double total = 0.0;

  final List<Produto> produtos = [
    Produto('Brigadeiro', 2.5, 'https://placehold.co/150x100/6F4E37/FFFFFF/png'),
    Produto('Beijinho', 2.0, 'https://placehold.co/150x100/FFFF00/000000/png'),
    Produto('Bala de Coco', 1.0, 'https://placehold.co/150x100/F5DEB3/000000/png'),
    Produto('Pé de Moleque', 3.0, 'https://placehold.co/150x100/FFA500/FFFFFF/png'),
    Produto('Doce de Leite', 2.8, 'https://placehold.co/150x100/FF0000/FFFFFF/png'),
    Produto('Maria Mole', 1.5, 'https://placehold.co/150x100/FFFFFF/000000/png')
  ];

  void adicionarAoCarrinho(double preco) {
    setState(() {
      total += preco;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🍭 Doçuras da Vovó'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: produtos.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final produto = produtos[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.pink[50],
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pink.withOpacity(0.2),
                      blurRadius: 4,
                      offset: Offset(2, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.network(
                      produto.imagemUrl,
                      height: 80,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.error, color: Colors.red),
                    ),
                    Text(produto.nome,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("R\$ ${produto.preco.toStringAsFixed(2).replaceAll('.', ',')}",
                        style: TextStyle(fontSize: 16)),
                    ElevatedButton(
                      onPressed: () => adicionarAoCarrinho(produto.preco),
                      child: Text('Adicionar'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pinkAccent,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        color: Colors.pink[100],
        child: Text(
          'Total: R\$ ${total.toStringAsFixed(2).replaceAll('.', ',')}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}