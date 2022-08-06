// @dart =2.9

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movierecommend/utils/text.dart';

class Description extends StatelessWidget {
  final String name, description, banner_url, poster_url, vote, launch_on;
  const Description(
      {Key key,
      this.name,
      this.description,
      this.banner_url,
      this.poster_url,
      this.vote,
      this.launch_on})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(children: [
          Container(
            height: 250,
            child: Stack(
              children: [
                Positioned(child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(banner_url,fit: BoxFit.cover,),
                )),
                Positioned(
                  bottom: 10,
                  child: modified_text(text: '  ⭐ Average Rating : '+ vote,size: 18,color: Colors.white60,))
              ],
            ),
          ),
          SizedBox(height: 15,),
          Container(padding: EdgeInsets.all(10),
          child: modified_text(text: name!=null?name:'Not available',size: 24,color: Colors.white,
          ),
          ),
          Container(padding: EdgeInsets.only(left:10),
          child: modified_text(text: "Releasing On  :"+launch_on,size: 14,color: Colors.white,),),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                height: 200,
                width: 100,
                child: Image.network(poster_url),
              ),
              Flexible(
                child: Container(
                  child: modified_text(text: description,size: 17,color: Colors.white,),
                ),
              )
            ],
          )
        

        ],
        ),
      ),
    );
  }
}
