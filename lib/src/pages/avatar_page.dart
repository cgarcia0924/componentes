import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(8.5),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://scontent.feoh1-1.fna.fbcdn.net/v/t1.0-9/89601230_10156623638092583_7334807056320299008_n.jpg?_nc_cat=106&_nc_sid=85a577&_nc_oc=AQmVbFud1-uI-NUr3NAY58U24S_cNlQ8JtGrLeZVLhkTvBYQqyt2OcMDC7W_5phy8c8&_nc_ht=scontent.feoh1-1.fna&oh=680ced6dba845ebcf4389a8ef1e371eb&oe=5EE16C02'),
              radius: 20.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://scontent.feoh1-1.fna.fbcdn.net/v/t1.0-9/89601230_10156623638092583_7334807056320299008_n.jpg?_nc_cat=106&_nc_sid=85a577&_nc_oc=AQmVbFud1-uI-NUr3NAY58U24S_cNlQ8JtGrLeZVLhkTvBYQqyt2OcMDC7W_5phy8c8&_nc_ht=scontent.feoh1-1.fna&oh=680ced6dba845ebcf4389a8ef1e371eb&oe=5EE16C02'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}