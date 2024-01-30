import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:admin/widgets/plan_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:admin/provider/provider_web3.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isLoading = false;
  String walletid="";
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Scaffold(
          appBar: AppBar(
            actions: [
              Consumer<MetaMaskProvider>(
                builder: (context, provider, child) {
                  walletid=provider.currentAddress;
                  if (provider.isConnected && provider.isInOperatingChain) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: PopupMenuButton<String>(
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          PopupMenuItem<String>(
                            value: 'address',
                            child: ListTile(
                              leading: Icon(Icons.person_outline),
                              title: Text(provider.currentAddress),
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'logout',
                            child: ListTile(
                              leading: Icon(Icons.logout),
                              title: Text('Logout'),
                            ),
                          ),
                        ],
                        onSelected: (value) {
                          if (value == 'logout') {
                            // Handle logout action
                          }
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: IconButton(
                            onPressed: () {
                              // Open the popup menu
                              showMenu(
                                context: context,
                                position: RelativeRect.fromLTRB(100, 0, 0, 0),
                                items: [
                                  PopupMenuItem<String>(
                                    value: 'address',
                                    child: ListTile(
                                      leading: Icon(Icons.person_outline),
                                      title: Text(provider.currentAddress),
                                    ),
                                  ),
                                  PopupMenuItem<String>(
                                    value: 'logout',
                                    child: ListTile(
                                      leading: Icon(Icons.logout),
                                      title: Text('Logout'),
                                    ),
                                  ),
                                ],
                              );
                            },
                            color: Colors.white,
                            icon: Icon(Icons.person_outline),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Connect with wallet logic
                          Provider.of<MetaMaskProvider>(context, listen: false)
                              .connect();
                        },
                        child: Text("Connect with your wallet"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
            title: CircleAvatar(
              child: Image.asset(
                "assets/images/logo.jpg",
              ),
            ),
          ),
          backgroundColor: const Color(0xFF181818),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/lines.png",
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 600) {
                      // For larger screens, display text and image side by side
                      return Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    Text(
                                      'Cust2merAI',
                                      style: TextStyle(
                                          fontSize: 35.0,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 50,
                                        right: 50,
                                      ),
                                      child: Text(
                                        'Welcome to our landing page! This is where you can showcase your content and attract visitors. You can customize this layout to suit your needs.Welcome to our landing page! This is where you can showcase your content and attract visitors. You can customize this layout to suit your needs.Welcome to our landing page! This is where you can showcase your content and attract visitors. You can customize this layout to suit your needs.',
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(right: 30.0),
                                child: Image.asset(
                                  "assets/images/logo12.png",
                                  height: 400,
                                ),
                              )),
                            ],
                          ),
                          SizedBox(
                            height: 300,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PlansBox(
                                onpressed: () => _makePostRequest(context),
                                benefit1: 'Per Call Cost = 0.00043 Eth',
                                benefit2: 'Good Support',
                                benefit3: '',
                                field: TextField(
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 30),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Enter your desired amount',
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                                text: "Recharge Plans",
                              ),
                              SizedBox(
                                width: 70,
                              ),
                              PlansBox(
                                onpressed: () => _makePostRequest(context),
                                benefit1: 'Unlimited Calls',
                                benefit2: 'Mail Services',
                                benefit3: '',
                                field: TextField(
                                  enabled: false,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 30),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: '149\$ dollar of ETH',
                                    hintStyle: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                                text: "Yearly Plans",
                              ),
                            ],
                          ),
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
                              'Cust2merAI',
                              style: TextStyle(
                                  fontSize: 35.0,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'Welcome to our landing page! This is where you can showcase your content and attract visitors. You can customize this layout to suit your needs.',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                          Image.asset("assets/images/logo12.png"),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PlansBox(
                                onpressed: () => _makePostRequest(context),
                                walletid: Provider.of<MetaMaskProvider>(context,
                                        listen: false)
                                    .currentAddress,
                                benefit1: 'Per Call Cost = 0.00043 Eth',
                                benefit2: 'Good Support',
                                benefit3: '',
                                field: TextField(
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 30),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Enter your text here',
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 15),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                                text: "Recharge Plans",
                              ),
                              SizedBox(
                                height: 70,
                              ),
                              PlansBox(
                                onpressed: () => _makePostRequest(context),
                                benefit1: 'Unlimited Calls',
                                benefit2: 'Mail Services',
                                benefit3: '',
                                field: TextField(
                                  enabled: false,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 30),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: '149\$ dollar of ETH',
                                    hintStyle: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                                text: "Yearly Plans",
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              // PlansBox(
                              //   text: "Yearly Plans",
                              // )
                            ],
                          ),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        if (_isLoading)
          Container(
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }

  Future<void> _makePostRequest(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });

    final String url =
        'https://6bae-183-82-29-170.ngrok-free.app/initiate-transaction';

    final Map<String, dynamic> body = {
      "walletAddress": "${walletid}",
      "amount": "0.0002"
    };

    try {
      final response = await http.post(Uri.parse(url), body: body);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData['success'] == 'SUCCESS') {
          // Show transaction complete dialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Transaction Complete'),
                content: Text(
                    'Transaction hash: ${responseData['transactionHash']}'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        } else {
          // Handle other cases if needed
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
      // Handle error cases if needed
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
