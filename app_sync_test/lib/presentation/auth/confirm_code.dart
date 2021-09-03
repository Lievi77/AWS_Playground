import 'package:app_sync_test/presentation/widgets/my_input_field.dart';
import 'package:flutter/material.dart';

class ConfirmCodeScreen extends StatefulWidget {
  const ConfirmCodeScreen({Key? key}) : super(key: key);

  @override
  _ConfirmCodeScreenState createState() => _ConfirmCodeScreenState();
}

class _ConfirmCodeScreenState extends State<ConfirmCodeScreen> {
  final TextEditingController _codeCtrller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm Account"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Enter code:"),
            MyInputField(
              controller: _codeCtrller,
              hint: "Enter code",
            ),
            MaterialButton(
              onPressed: () {},
              color: Colors.greenAccent,
              child: Text("Confirm"),
            )
          ],
        ),
      ),
    );
  }
}
