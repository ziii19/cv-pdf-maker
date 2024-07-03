import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/cv-pdf.png'),
            ),
          ),
        ),
        const SizedBox(height: 50),
        _buildTile(
          icon: Icons.error_outline,
          title: 'About',
          onTap: () {},
        ),
        _buildTile(
          icon: Icons.security_rounded,
          title: 'Privacy Policy',
          onTap: () {},
        ),
        _buildTile(
          icon: Icons.help,
          title: 'Contact Us',
          onTap: () {},
        ),
        const Spacer(),
        Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.withOpacity(.2)),
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: const Text('CLOSE'))),
        const Text(
          'Version 0.0.1',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 30)
      ],
    ));
  }

  InkWell _buildTile({
    required Function() onTap,
    required String title,
    required IconData icon,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            border: Border(
          bottom: BorderSide(color: Colors.grey),
          top: BorderSide(color: Colors.grey),
        )),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
            ),
            const SizedBox(width: 20),
            Expanded(
                child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            )),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}

// class _BuildTile extends StatelessWidget {
//   const _BuildTile(
//       {required this.onTap, required this.title, required this.icon});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: const BoxDecoration(
//             border: Border(
//           bottom: BorderSide(color: Colors.grey),
//           top: BorderSide(color: Colors.grey),
//         )),
//         child: Row(
//           children: [
//             Icon(
//               icon,
//               size: 30,
//             ),
//             const SizedBox(width: 20),
//             Expanded(
//                 child: Text(
//               title,
//               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
//             )),
//             const Icon(
//               Icons.arrow_forward_ios_rounded,
//               size: 30,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
