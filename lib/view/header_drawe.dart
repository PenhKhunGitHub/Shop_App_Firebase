import 'package:flutter/material.dart';

class HeaderDrawer extends StatefulWidget {
  const HeaderDrawer({super.key});

  @override
  State<HeaderDrawer> createState() => _HeaderDrawerState();
}

class _HeaderDrawerState extends State<HeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.brown,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15.0),
              height: 70,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWiMK_4fSYTkK8A__zme9fH_7EkDcx2um7IH2O864HctemLveeMwWU-207XUTNAeOTP6o&usqp=CAU'
                  )
                )
              ),
            ),
            const Text(
              'Eng Peng Khun',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white
              ),
            ),
            const Text(
              'PengKhun3434@gmail.com',
              style: TextStyle(
                fontSize: 14,
                color: Colors.green
              ),
            ),
          ],
        ),
      ),
    );
  }
}
