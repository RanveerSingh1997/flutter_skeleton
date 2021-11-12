import 'package:flutter/material.dart';
import 'package:flutter_skeleton/data/app_state_manager.dart';
import 'package:flutter_skeleton/data/data_provider.dart';
import 'package:flutter_skeleton/models/search_model.dart';
import 'package:flutter_skeleton/service/network/api_service.dart';
import 'package:provider/provider.dart';

class MyApplicationScreen extends StatefulWidget {
  @override
  _MyApplicationScreenState createState() => _MyApplicationScreenState();
}

class _MyApplicationScreenState extends State<MyApplicationScreen> {
  final AppStateManager _appStateManager = AppStateManager();
  final DataProvider _dataProvider = DataProvider();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => _appStateManager,
        ),
        ChangeNotifierProvider<DataProvider>(
          create: (context) => _dataProvider,
        )
      ],
      child: SearchingScreen(),
    );
  }
}

class SearchingScreen extends StatelessWidget {
  final APIService _apiService = APIService();


  @override
  Widget build(BuildContext context) {
    var dataProvider = Provider.of<DataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          onChanged: (value) {
            dataProvider.query = value.toString().trim();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              dataProvider.gettingSearchResult();
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Builder(
        builder: (context) {

          var data = dataProvider.searchModel;
          return ListView.builder(
            itemCount: data.results.length,
            itemBuilder: (context, index) {
              Result result = data.results[index];
              return ListTile(
                title: Text(result.title),
                subtitle: Text(result.description),
              );
            },
          );
        },
      ),
    );
  }
}
