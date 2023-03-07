import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';
void main() => runApp(const MaterialApp(
      home: MainApp(),
    ));

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<Quote> quotes = [
    Quote(text: 'first quote from me to you so be greatfull okay',author: 'ahmed'),
    Quote(text: 'second quote from me to you so be greatfull okay',author: 'ahmed'),
    Quote(text: 'third quote from me to you so be greatfull okay',author: 'ahmed'),
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.brown[900],
        title: const Text(
          'helooooo',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
          children: quotes.map((quote) => QuoteCard(
            quote:quote,
            delete:(){
              setState(() {
                quotes.remove(quote);
              });
            }
            )).toList(),
                  
                  ),
    );
  }
}