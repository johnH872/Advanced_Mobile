import 'package:flutter/material.dart';

class IntroductionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Introduction Screen'),
      ),
      body: const Center(
        child: Column(
          children: [
            Text('Họ và tên: Tạ Duy Hoàng', style: TextStyle(fontSize: 15) ),
            Text("MSSV: 20110488", style: TextStyle(fontSize: 15)),
            Text("Ngành học: Công nghệ thông tin", style: TextStyle(fontSize: 15)),
            Text('Họ và tên: Ngô Anh Lượng', style: TextStyle(fontSize: 15)),
            Text("MSSV: 20110521", style: TextStyle(fontSize: 15)),
            Text("Ngành học: Công nghệ thông tin", style: TextStyle(fontSize: 15)),
            Text("Đề tài: Xây dựng hệ thống quản lý nhân sự - HRM", style: TextStyle(fontSize: 15))
          ],
        ),
      ),
    );
  }
}