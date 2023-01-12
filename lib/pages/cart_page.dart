import 'package:final_project/models/cart_get.dart';
import 'package:final_project/pages/product_detail.dart';
import 'package:final_project/services/network.dart';
import 'package:flutter/material.dart';

class cart_page extends StatefulWidget {
  const cart_page({super.key});

  @override
  State<cart_page> createState() => _cart_pageState();
}

class _cart_pageState extends State<cart_page> {
  List<Cartpost>? posts;
  bool isloaded = false;
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  getData() async {
    posts = await NetworkHelper().getposts();
    if (posts != Null) {
      setState(() {
        isloaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Container(
                      child: Row(
                        children: [
                          Text(
                            'Home',
                            style: TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 23, 22, 22),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   height: 10,
              // ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                child: Container(
                  child: Row(
                    children: [
                      Text(
                        'Good Afternoon, User',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 23, 22, 22),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Image.asset('assets/covidbanner.png'),
              SizedBox(
                height: 20,
              ),
              Visibility(
                visible: isloaded,
                child: Container(
                  // color: Colors.green,
                  child: ListView.builder(
                    itemCount: posts?.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 100,
                            width: 360,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(10),
                              color: Color.fromARGB(255, 255, 255, 255),
                              child: ListTile(
                                leading: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'http://mark.bslmeiyu.com/uploads/${posts![index].img}'),
                                    ),
                                  ),
                                ),
                                title: Container(
                                  child: Text(
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 18,

                                      // backgroundColor: Color.fromARGB(255, 66, 66, 66),
                                    ),
                                    posts![index].name ?? 'No Data',
                                  ),
                                ),
                                subtitle: Row(
                                  children: [
                                    Text(
                                      'Rs. ',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 19, 107, 189),
                                        fontSize: 18,

                                        // backgroundColor: Color.fromARGB(255, 66, 66, 66),
                                      ),
                                    ),
                                    Text(
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 19, 107, 189),
                                        fontSize: 18,

                                        // backgroundColor: Color.fromARGB(255, 66, 66, 66),
                                      ),
                                      posts![index].price.toString(),
                                    ),
                                  ],
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return ProductDetail(posts![index]);
                                      }),
                                    );
                                  },
                                  icon: Icon(Icons.arrow_forward),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                replacement: Center(child: CircularProgressIndicator()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
