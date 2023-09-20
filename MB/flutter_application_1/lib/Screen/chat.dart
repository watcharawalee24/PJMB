import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
          .copyWith(secondary: Colors.green),
    ),
    home: ChatScreen(), // หรือคลาสหน้าแชทของคุณ
  ));
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}



class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isUserMessage: true, // สร้างข้อความของผู้ใช้
    );
    setState(() {
      _messages.insert(0, message);
    });

    // เพิ่มตรงนี้
    // ตัวอย่างบทสนทนา
    if (text.toLowerCase().contains('เวชสำอางค์')) {
      _addBotResponse('เวชสำอางค์คือที่เหมาะสำหรับคุณ ตามประเภทของผิวหนัง คุณมีผิวหน้าลักษณะใด');
    } else if (text.toLowerCase().contains('ประเภทผิวมัน')) {
      _addBotResponse('ขอแนะนำใช้เป็น Cerave สูตรโลชั่นค่ะ');
    } else {
      _addBotResponse('ฉันไม่เข้าใจคำถามของคุณ กรุณาถามคำถามใหม่');
    }
  }

  void _addBotResponse(String text) {
    ChatMessage botMessage = ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, botMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.brown),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Color.fromARGB(255, 222, 208, 203),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (_, int index) => _messages[index],
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(
                  hintText: 'พิมพ์ข้อความ...',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  _handleSubmitted(_textController.text);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUserMessage;
  

  ChatMessage({required this.text, this.isUserMessage = false});

  @override
  Widget build(BuildContext context) {
    final CrossAxisAlignment crossAxisAlignment = isUserMessage
        ? CrossAxisAlignment.end
        : CrossAxisAlignment.start;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: isUserMessage
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: crossAxisAlignment,
        children: <Widget>[
          if (!isUserMessage)
            CircleAvatar(
              // แสดงรูปภาพผู้ส่ง
              backgroundColor: const Color.fromARGB(255, 215, 228, 239),
              backgroundImage: NetworkImage(
                  'https://cdn.icon-icons.com/icons2/979/PNG/256/Doctor_Female_icon-icons.com_75050.png'),
              radius: 20.0,
            ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: isUserMessage ? Color.fromARGB(255, 126, 90, 77) : Color.fromARGB(255, 113, 95, 89),
                borderRadius: BorderRadius.circular(60.0),
              ),
              child: ListTile(
                title: Text(
                  text,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 254, 254),
                    fontSize: 16,
                    
                  ),
                ),
                leading: SizedBox.shrink(), // ลบ leading ที่ถูกสร้างอัตโนมัติ
              ),
            ),
          ),
          if (isUserMessage)
            CircleAvatar(
              // แสดงรูปภาพผู้รับ
              backgroundColor: const Color.fromARGB(255, 245, 251, 245),
              backgroundImage: NetworkImage(
                  'https://cdn.icon-icons.com/icons2/979/PNG/256/Patient_Female_icon-icons.com_75052.png'),
              radius: 20.0,
            ),
        ],
      ),
    );
  }
}
