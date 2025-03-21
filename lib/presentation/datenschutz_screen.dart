
import 'package:flutter/material.dart';

class DatenschutzScreen extends StatelessWidget {
  const DatenschutzScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: SizedBox(
          height: 150,
          child: Image.asset(
            "assets/images/logo2.png",
            fit: BoxFit.fitHeight,
          ),
        ),
        toolbarHeight: 180,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 500,
              width: 350,
              child: const SingleChildScrollView(
                child: Text("DatenschutzScreenerklärung\n\n………."),
              ),
            )
          ],
        ),
      ),
    );
  }
}
