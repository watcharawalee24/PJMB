import 'package:flutter/material.dart';



class moisturizer extends StatelessWidget {
  final List<String> imgUrls = [
    'https://www.cerave.ca/-/media/project/loreal/brand-sites/cerave/americas/ca/pdp/gal/3606000537415_gal_1_en.png?rev=6a3f6bf327dd4b0e9fbc6a2920fa75da&w=500&hash=E237FC680F7CB0022184F68EF12C22B9',
    'https://www.skinpharmacy.in/wp-content/uploads/2019/10/PHYSIOGEL-HYPOALLERGENIC-DAILY-MOISTURE-THERAPY-LOTION.png',
    'https://i5.walmartimages.com/seo/Cetaphil-Moisturizing-Lotion-for-All-Skin-Types-Fragrance-Free-20-fl-Oz_f8ea54f8-8b2a-4283-9d07-ad329e910139.5eddd6e0fdb734ae92abf7ced23f59a0.png?odnHeight=768&odnWidth=768&odnBg=FFFFFF',
    'https://www.priao.co.th/pub/media/catalog/product/cache/0db1bb6c1f94ef113b3fe8c61870b84d/3/3/3337875597371-1.png',
    'https://mizumithailand.com/wp-content/uploads/2022/09/sec1cica01.png',
    'https://smooth-e.com/wp-content/uploads/2014/08/1587947317.89525c4b45bad1d4ec4c7ebfc9419a26.png',
  ];
  final List<Map<String, String>> items = [
    {
      'name': 'Cerave',
      'description': 'Cleanser',
      'price': '699 ฿',
      'rating': '★★★★★'
    },
    {
      'name': 'PHYSIOGEL',
      'description': 'Clenaser',
      'price': '299 ฿',
      'rating': '★★★☆☆'
    },
    {
      'name': 'Cetaphil',
      'description': ' Clenaser',
      'price': '429 ฿',
      'rating': '★★★★★'
    },
    {
      'name': 'CeraVe',
      'description': 'Liquid Cleanser',
      'price': '490 ฿',
      'rating': '★★★☆☆'
    },
    {
      'name': 'biore',
      'description': ' Micellar Ultra',
      'price': '799 ฿',
      'rating': '★★★★★'
    },
    {
      'name': 'smooth-e',
      'description': 'Micellar Cleanser',
      'price': '690 ฿',
      'rating': '★★★☆☆'
    },
  ];

  moisturizer({Key? key});

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
                                const Color.fromARGB(255, 0, 0, 0), 
                          ),
                        ),
                        Text(
                          items[i]['rating'] ?? '',
                          style: TextStyle(
                            fontSize: 16,
                            color:
                                Color.fromARGB(255, 246, 194, 50), 
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 40, 
                    height: 40, 
                    margin: EdgeInsets.only(top: 0, right: 3),
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        size: 24, 
                        color: Colors.white,
                      ),
                      onPressed: () {
                       
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
