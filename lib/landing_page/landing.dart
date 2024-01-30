import 'package:admin/provider/provider_web3.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Connect with wallet logic
                Provider.of<MetaMaskProvider>(context, listen: false).connect();
              },
              child: Text("Connect with your wallet"),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
              ),
            ),
          )
        ],
        title: CircleAvatar(
          child: Image.asset(
            "assets/images/logo.jpg",
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                // For larger screens, display text and image side by side
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Welcome to our landing page! This is where you can showcase your content and attract visitors. You can customize this layout to suit your needs.',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ),
                    Expanded(child: Image.asset("assets/images/logo12.png")),
                  ],
                );
              } else {
                // For smaller screens, display text above the image
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Welcome to our landing page! This is where you can showcase your content and attract visitors. You can customize this layout to suit your needs.',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Image.asset("assets/images/logo12.png")
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
