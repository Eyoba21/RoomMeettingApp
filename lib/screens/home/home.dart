import 'package:firebase/models/room.dart';
import 'package:firebase/services/database.dart';
import 'package:firebase/shared/navbar.dart';
import 'package:firebase/shared/room_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<RoomModel> _getRoomsFromApi;
  bool _isloading = true;
  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    _getRoomsFromApi = await NetworkHelper.getData();
    setState(() {
      _isloading = false;
    });
    print(_getRoomsFromApi);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: NavBar(),
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0.0,
        title: Center(
            child: Text(
          'HomePage',
          style: GoogleFonts.italianno(fontSize: 40),
        )),
        backgroundColor: Colors.blue[700],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Find the best office for you ",
              style: GoogleFonts.bebasNeue(
                fontSize: 50,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      showSearch(
                          context: context, delegate: CustomSearchDelegate());
                    },
                    icon: Icon(Icons.search),
                  ),
                  Text(
                    'Find your office .....',
                    style: GoogleFonts.bebasNeue(fontSize: 20),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 25),
          Expanded(
            child: _isloading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _getRoomsFromApi.length,
                    itemBuilder: (context, index) {
                      return RommTile(
                          roomName: _getRoomsFromApi[index].name,
                          address: "Bole Atlas",
                          avaliablity: "Avaliable",
                          roomImagePath: _getRoomsFromApi[index].image);
                    },
                  ),
          )
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> SearchTerms = [
    'Crown Down',
    'Prefrontal Engeagement',
    'Carnium Foucs',
    'Noodlin Space',
    'Nogging Chamber',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> MatchQuery = [];
    for (var room in SearchTerms) {
      if (room.toLowerCase().contains(query.toLowerCase())) {
        MatchQuery.add(room);
      }
    }
    return ListView.builder(
        itemCount: MatchQuery.length,
        itemBuilder: (context, index) {
          var result = MatchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> MatchQuery = [];
    for (var room in SearchTerms) {
      if (room.toLowerCase().contains(query.toLowerCase())) {
        MatchQuery.add(room);
      }
    }
    return ListView.builder(
        itemCount: MatchQuery.length,
        itemBuilder: (context, index) {
          var result = MatchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }
}
