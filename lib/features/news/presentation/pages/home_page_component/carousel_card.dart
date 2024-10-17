import 'package:flutter/material.dart';

class CarouselCard extends StatelessWidget {
  const CarouselCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 300, // Set a width for each card
        height: 400,
        child: Stack(
          children : [
          Container(
            width: 300,
            height: 400,
            child: Image.network('https://picsum.photos/400/400',
                fit: BoxFit.fill),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 150,
              width: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Crypto investors should be prepared to lose all their money, BOE governor says',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "I'm going to say this very bluntly again: Buy them only if you're prepared to lose all your money.",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          ] 
        ),
      ),
    );
  }
}
