import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BelajarAppBar(),
    );
  }
}

class BelajarAppBar extends StatelessWidget {
  final List lagu = [
    "Lagu 1",
    "Lagu 2",
    "Lagu 3",
    "Lagu 4",
    "Lagu 5",
    "Lagu 6",
    "Lagu 7",
    "Lagu 8",
    "Lagu 9",
    "Lagu 10"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Belajar SliverAppBar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      )),
                  background: Image(
                    image: NetworkImage('https://res.cloudinary.com/di5fbic64/image/upload/v1653283788/gambarku/aku1_gu9byz.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.deepPurple,
                    tabs: [
                      new Tab(icon: new Icon(Icons.audiotrack), text: "Songs"),
                      new Tab(icon: new Icon(Icons.collections), text: "Gallery"),
                      new Tab(icon: new Icon(Icons.favorite), text: "Play List"),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              Container(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(lagu[index], style: TextStyle(fontSize: 30)),
                      ),
                    );
                  },
                  itemCount: lagu.length,
                ),
              ),
              Container(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(10, (index) {
                    return Container(
                      child: Card(
                        color: Colors.deepPurpleAccent,
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage('https://source.unsplash.com/random?sig=$index'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: ListTile(
                            title: Text('Play List Lagu Aku', style: TextStyle(color: Colors.white, fontSize: 20.0)),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Container(
                color: Colors.white,
                child: ListView(
                  children: const [
                    Expanded(
                      child: ListTile(
                        leading: CircleAvatar(),
                        title: Text("Album 1-2"),
                        subtitle: Text("Ayo Jemput"),
                        trailing: Icon(Icons.more_vert),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        leading: CircleAvatar(),
                        title: Text("Album 3-4"),
                        subtitle: Text("Ayo Jemput"),
                        trailing: Icon(Icons.more_vert),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        leading: CircleAvatar(),
                        title: Text("Album 5-6"),
                        subtitle: Text("Ayo Jemput"),
                        trailing: Icon(Icons.more_vert),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        leading: CircleAvatar(),
                        title: Text("Album 7-8"),
                        subtitle: Text("Ayo Jemput"),
                        trailing: Icon(Icons.more_vert),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        leading: CircleAvatar(),
                        title: Text("Album 9-10"),
                        subtitle: Text("Ayo Jemput"),
                        trailing: Icon(Icons.more_vert),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);
  final TabBar _tabBar;

  double get minExtent => _tabBar.preferredSize.height;
  double get maxExtent => _tabBar.preferredSize.height;

  Widget build(BuildContext context, double shrinkOffset, bool overlabsContents) {
    return new Container(
      child: _tabBar,
    );
  }

  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
