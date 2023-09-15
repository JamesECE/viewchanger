import 'package:flutter/material.dart';

void main() {
  runApp(ViewSwitcherApp());
}

class ViewSwitcherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'View Switcher App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ViewSwitcherPage(),
    );
  }
}

class ViewSwitcherPage extends StatefulWidget {
  @override
  _ViewSwitcherPageState createState() => _ViewSwitcherPageState();
}

class _ViewSwitcherPageState extends State<ViewSwitcherPage> {
  bool _isListView = true;

  void _toggleView() {
    setState(() {
      _isListView = !_isListView;
    });
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: 69,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item $index'),
        );
      },
    );
  }

  Widget _buildTilesView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
      ),
      itemCount: 69,
      itemBuilder: (context, index) {
        return Card(
          child: Center(
            child: Text('Tile $index'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Switching App'),
        actions: [
          IconButton(
            icon: Icon(Icons.view_list),
            onPressed: () {
              _toggleView();
            },
          ),
        ],
      ),
      body: _isListView ? _buildListView() : _buildTilesView(),
    );
  }
}
