import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
  late TabController _tabController;
  late bool isLoggedIn = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoggedIn = FirebaseAuth.instance.currentUser != null ? true : false;
    if (isLoggedIn) {
      _tabController = TabController(length: 2, vsync: this);
    } else
      (isLoggedIn) {
        _tabController = TabController(length: 2, vsync: this);
      };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        backgroundColor: Colors.teal,
        title: isLoggedIn
            ? Text(
                "Orders",
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            : Text(
                "LogIN First",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
      ),
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            child: TabBar(
              indicatorColor: Colors.teal,
              indicatorWeight: 3,
              labelColor: Colors.teal,
              unselectedLabelColor: Theme.of(context).disabledColor,
              controller: _tabController,
              tabs: [
                Tab(
                  child: Text("current"),
                ),
                Tab(
                  child: Text("history"),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              Tab(
                child: Text('Current Order list'),
              ),
              Tab(
                child: Text('History Order list'),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
