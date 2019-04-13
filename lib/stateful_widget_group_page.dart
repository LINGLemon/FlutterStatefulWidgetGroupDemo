import 'package:flutter/material.dart';

class StatefulWidgetGroupPage extends StatefulWidget {
  @override
  _StatefulWidgetGroupPageState createState() =>
      _StatefulWidgetGroupPageState();
}

class _StatefulWidgetGroupPageState extends State<StatefulWidgetGroupPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StatefulWidget Group Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('StatefulWidget Group Demo'),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.blue,
                ),
                title: Text('首页'),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.list,
                  color: Colors.blue,
                ),
                title: Text('列表'),
              ),
            ]),
        floatingActionButton: FloatingActionButton(
          child: Text('tap'),
          onPressed: () {
            print('hahahaha');
          },
        ),
        body: _currentIndex == 0
            ? RefreshIndicator(
                child: ListView(
                  children: <Widget>[
                    Container(
                      color: Colors.green,
                      alignment: Alignment.center,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            // 百度首页logo图片，好像显示不了。。。
                            Image.network(
                              'https://www.baidu.com/s?wd=%E4%BB%8A%E6%97%A5%E6%96%B0%E9%B2%9C%E4%BA%8B&tn=SE_PclogoS_8whnvm25&sa=ire_dl_gh_logo&rsv_dl=igh_logo_pcs',
                              width: 100,
                              height: 100,
                            ),
                            TextField(
                              // 输入文本样式
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                hintText: '请输入',
                                hintStyle: TextStyle(fontSize: 20),
                              ),
                            ),
                            Container(
                              height: 100,
                              margin: EdgeInsets.only(top: 10),
                              decoration:
                                  BoxDecoration(color: Colors.lightBlueAccent),
                              child: PageView(
                                children: <Widget>[
                                  _item('111', Colors.green),
                                  _item('222', Colors.blue),
                                  _item('333', Colors.red),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                onRefresh: _handleRefresh,
              )
            : Text('list'),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 100));
    return null;
  }

  _item(String str, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(
        str,
        style: TextStyle(color: Colors.white, fontSize: 22),
      ),
    );
  }
}
