import 'package:flutter/material.dart';
import 'package:ecology_collect/widgets/top_appbar.dart';
import 'package:ecology_collect/widgets/menu_bottom.dart';
import 'package:ecology_collect/widgets/menu_drawer.dart';

class Withdrawal extends StatelessWidget {
  const Withdrawal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(
        title: '탈퇴하기',
      ),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuBottom(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '회원 탈퇴',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      '탈퇴 및 가입을 반복할 경우, 서비스 악용 방지를 위해',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    const Text(
                      '재가입이 제한됩니다. 최초 탈퇴 시에는 가입 시점을 기준으로',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    const Text(
                      '1일간 2회 이상 탈퇴를 반복할 경우 30일간 제한됩니다.',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                        child: FilledButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: ((context) => AlertDialog(
                                  title: const Text("정말 탈퇴하시겠습니까?"),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Cancel'),
                                      child: const Text('닫기'),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('확인'),
                                    ),
                                  ],
                                )));
                      },
                      child: const Text("회원탈퇴"),
                    ))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
