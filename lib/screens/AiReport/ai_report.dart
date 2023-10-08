import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ecology_collect/widgets/menu_bottom.dart';
import 'package:ecology_collect/widgets/menu_drawer.dart';
import 'package:ecology_collect/widgets/top_appbar.dart';
import 'package:image_picker/image_picker.dart';

class AiReport extends StatefulWidget {
  const AiReport({Key? key, this.selectedImage}) : super(key: key);

  final XFile? selectedImage; // 선택된 이미지를 전달 받습니다.

  @override
  _AiReportState createState() => _AiReportState();
}

// 나머지 부분은 동일

class _AiReportState extends State<AiReport> {
  final _hangangs = ['여의도 한강공원', '반포 한강공원', '이촌 한강공원', '망원 한강공원'];
  String? _selectedHangang;

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedHangang = _hangangs[0];
    });
  }

  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(
        title: '탐정 보고서',
      ),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuBottom(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0), // 왼쪽과 오른쪽 패딩 10
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                if (widget.selectedImage != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.file(
                      File(widget.selectedImage!.path),
                      height: 270,
                    ),
                  ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffB8E3AA),
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(
                      color: const Color(0xff395831),
                      width: 1.0, // 선의 너비
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 7,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '▼  수달 탐정의 분석 결과',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        'assets/image/cong.jpg', // 이미지 파일 경로
                        width: 180, // 이미지 가로 크기
                        height: 180, // 이미지 세로 크기
                        fit: BoxFit.cover, // 이미지가 박스를 채우도록 설정
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const SizedBox(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '수달', // 제목 텍스트
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '멸종위기 야생생물 I급으로 물가에 살며 야행성이지만 낮에 활동하기도 합니다. 털색은 암갈색이며 턱 아랫부분은 흰색입니다. 입 주변에 더듬이 역할을 하는 수염이 나있어 먹이를 찾는데 도움을 주며, 발가락 사이에 물갈퀴가 있습니다.',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: AutofillHints.creditCardSecurityCode,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '발견 위치 입력',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        DropdownButton(
                          value: _selectedHangang,
                          items: _hangangs
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedHangang = value!;
                            });
                          },
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '발견 시간 입력',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            final TimeOfDay? selectedTime =
                                await showTimePicker(
                              context: context,
                              initialTime: _selectedTime,
                            );

                            if (selectedTime != null &&
                                selectedTime != _selectedTime) {
                              setState(() {
                                _selectedTime = selectedTime;
                              });
                            }
                          },
                          child: Text(
                            _selectedTime.format(context),
                            style: const TextStyle(fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '도감에 저장하여 수달 탐정의 미션을 완료하세요!',
                      style: TextStyle(
                        color: Color(0xff87898E),
                        fontFamily: AutofillHints.creditCardSecurityCode,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                ElevatedButton(
                  onPressed: () {
                    // 버튼을 누를 때 실행될 동작을 추가하세요.
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffB8E3AA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(350, 65),
                    side: const BorderSide(
                      color: Color(0xff395831), // 선 색상
                      width: 1.0, // 선 너비
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '도감에 저장하기', // 버튼 텍스트
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                      ), // 저장 아이콘
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
