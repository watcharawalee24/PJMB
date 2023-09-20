import 'package:flutter/material.dart';
import 'Login.dart';

class Begin extends StatefulWidget {
   static const routeName = '/';

  @override
  State<Begin> createState() => _BeginState();
}

class _BeginState extends State<Begin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://i.pinimg.com/564x/e0/13/b0/e013b0c4c8792a8f4e138a8bce2778dc.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Text(
                  'COSMECEUTICALS',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                  textAlign: TextAlign.center, // ให้ตัวอักษรอยู่บรรทัดเดียวกัน
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 140.0),
                child: Text(
                  'DO YOU WANT LOGIN YET ?',
                  style: TextStyle(
                    fontSize: 16.5,
                  ),
                  textAlign: TextAlign.center, // ให้ตัวอักษรอยู่บรรทัดเดียวกัน
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(150.0),
                child: SizedBox(
                  width: 700.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(200.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // นำทางไปยังหน้า Login ที่คุณต้องการ
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                Login(), // แทน LoginPage() ด้วยหน้า Login ของคุณ
                          ),
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 18, // ปรับขนาดฟอนต์ตามที่คุณต้องการ
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(
                                215, 158, 102, 98)), // เปลี่ยนสีพื้นหลังของปุ่ม
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.white), // เปลี่ยนสีขอบของปุ่ม
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
