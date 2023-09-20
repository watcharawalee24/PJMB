import 'package:flutter/material.dart';



class sunscreen extends StatelessWidget {
  final List<String> imgUrls = [
    'https://www.beauticool.com/product_images/61f7390860c34.png',
    'https://www.larocheposay-th.com/-/media/project/loreal/brand-sites/lrp/apac/th/products/physiological/micellar-water-ultra-sensitive/la-roche-posay-productpage-face-cleanser-physiological-micellar-ultra-400ml-3337872411595-front.png',
    'https://www.jeban.com/spotlight-item/banana-boat/Aqua-Daily-Moisture-UV-Protection-Sunscreen.png',
    'https://thmappbkk.blob.core.windows.net/boots/2021/5/12/98bc0a29-29ae-49d9-9321-95f834ca5960_large.jpg',
    'https://mizumithailand.com/wp-content/uploads/2022/09/sec1cica01.png',
    'https://smooth-e.com/wp-content/uploads/2014/08/1587947317.89525c4b45bad1d4ec4c7ebfc9419a26.png',
  ];
  final List<Map<String, String>> items = [
    {
      'name': 'Muzumi',
      'description': 'Sunscreen',
      'price': '899 ฿',
      'rating': '★★★★★'
    },
    {
      'name': 'Lo Roche',
      'description': 'Sunscreen',
      'price': '1099 ฿',
      'rating': '★★★☆☆'
    },
    {
      'name': 'Bananbota',
      'description': ' Sunscreen',
      'price': '1029 ฿',
      'rating': '★★★★★'
    },
    {
      'name': 'Eucerin',
      'description': 'Sunscreen',
      'price': '1090 ฿',
      'rating': '★★★☆☆'
    },
    {
      'name': 'biore',
      'description': ' Sunscreen',
      'price': '399 ฿',
      'rating': '★★★★★'
    },
    {
      'name': 'smooth-e',
      'description': 'Sunscreen',
      'price': '690 ฿',
      'rating': '★★★☆☆'
    },
  ];

  sunscreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 7, // ระยะห่างระหว่างรายการในแนวแกนหลัก
      crossAxisSpacing: 5, // ระยะห่างระหว่างรายการในแนวแกนข้าง
      shrinkWrap: true,
      childAspectRatio: (170 / 250),
      children: [
        for (int i = 0; i < imgUrls.length; i++)
        
          Container(
            
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 255, 255, 255),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 113, 76, 62),
                  spreadRadius: 1,
                  blurRadius: 2,
                ),
              ],
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    // ใส่โค้ดที่คุณต้องการเมื่อคลิกที่รูปภาพ
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: Image.network(
                      imgUrls[i],
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          items[i]['name'] ?? '',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                        Text(
                          items[i]['description'] ?? '',
                          style: TextStyle(
                            fontSize: 18,
                            color: const Color.fromARGB(255, 142, 107, 107),
                          ),
                        ),
                        Text(
                          items[i]['price'] ?? '',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                            color:
                                const Color.fromARGB(255, 0, 0, 0), // สีของราคา
                          ),
                        ),
                        Text(
                          items[i]['rating'] ?? '',
                          style: TextStyle(
                            fontSize: 16,
                            color:
                                Color.fromARGB(255, 246, 194, 50), // สีของดาว
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 40, // กำหนดความกว้างของปุ่ม
                    height: 40, // กำหนดความสูงของปุ่ม
                    margin: EdgeInsets.only(top: 0, right: 3),
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        size: 24, // กำหนดขนาดของไอคอน
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // ใส่โค้ดที่คุณต้องการเมื่อคลิกที่ปุ่ม +
                      },
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 51, 0),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
              
            ),
            
          ),
      ],
    );
  }
}
