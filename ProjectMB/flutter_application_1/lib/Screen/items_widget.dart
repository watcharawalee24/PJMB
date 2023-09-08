import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ItemsWidget extends StatelessWidget {
  final List<String> imgUrls = [
    'https://www.cerave.co.th/-/media/Project/Loreal/BrandSites/CeraVe/Master/CeraveAPAC/Hong-Kong/Shared/Product/cleansers/CeraVe_FoamingCleanser_NEW_v021.png',
    'https://www.cetaphil.co.th/on/demandware.static/-/Sites-galderma-th-m-catalog/default/dw6e756fd1/HFCC/Packshot473mL_1200x1200.png',
    'https://www.larocheposay-th.com/-/media/project/loreal/brand-sites/lrp/apac/th/products/physiological/micellar-water-ultra-sensitive/la-roche-posay-productpage-face-cleanser-physiological-micellar-ultra-400ml-3337872411595-front.png',
    'https://acne-aid.in.th/wp-content/uploads/2021/12/95039_Product-Images-website-images-for-Acne-Aid-Liquid-cleanser-100ml-Bottle-Front_V0-e1662192157189.png',
    'https://www.biorethailand.com/media/product_image/aacb7ad0_aa47_11ea_82dc_d780b9030fa6.png',
    'https://smooth-e.com/wp-content/uploads/2014/08/1587947317.89525c4b45bad1d4ec4c7ebfc9419a26.png',
  ];
  final List<Map<String, String>> items = [
    {'name': 'Cerave', 'description': 'Cleanser', 'price': '699 ฿', 'rating': '★★★★★'},
    {'name': 'Cetaphil', 'description': 'Packshot', 'price': '599 ฿', 'rating': '★★★☆☆'},
    {'name': 'La Roche-Posay', 'description': ' Micellar Ultra', 'price': '1029 ฿', 'rating': '★★★★★'},
    {'name': 'Acne Aid', 'description': 'Liquid Cleanser', 'price': '490 ฿', 'rating': '★★★☆☆'},
    {'name': 'biore', 'description': ' Micellar Ultra', 'price': '799 ฿', 'rating': '★★★★★'},
    {'name': 'smooth-e', 'description': 'Micellar Cleanser', 'price': '690 ฿', 'rating': '★★★☆☆'},
  ];

  ItemsWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 10, // ระยะห่างระหว่างรายการในแนวแกนหลัก
      crossAxisSpacing: 10, // ระยะห่างระหว่างรายการในแนวแกนข้าง
      shrinkWrap: true,
      childAspectRatio: (150 / 200),
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
                  padding: EdgeInsets.only(bottom: 8),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          items[i]['name'] ?? '',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                        Text(
                          items[i]['description'] ?? '',
                          style: TextStyle(
                            fontSize: 16,
                            color: const Color.fromARGB(255, 142, 107, 107),
                          ),
                        ),
                        Text(
                          items[i]['price'] ?? '',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: const Color.fromARGB(255, 0, 0, 0), // สีของราคา
                          ),
                        ),
                        Text(
                          items[i]['rating'] ?? '',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 246, 194, 50), // สีของดาว
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 43, 11, 3),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Icon(
                            CupertinoIcons.add,
                            size: 20,
                          ),

                        ),
                      ],
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
