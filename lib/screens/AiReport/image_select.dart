import 'dart:io';

import 'package:ecology_collect/screens/AiReport/ai_report.dart';
import 'package:ecology_collect/screens/AiReport/ai_report_fault.dart';
import 'package:ecology_collect/widgets/top_appbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelect extends StatefulWidget {
  const ImageSelect({Key? key}) : super(key: key);

  @override
  _ImageSelectState createState() => _ImageSelectState();
}

class _ImageSelectState extends State<ImageSelect> {
  final ImagePicker picker = ImagePicker();
  XFile? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(
        title: '이미지 선택',
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_image != null) Image.file(File(_image!.path)),
            ElevatedButton(
              onPressed: () {
                _pickImage(ImageSource.camera);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffB8E3AA),
                minimumSize: const Size(95, 75),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Icon(
                Icons.add_a_photo_rounded,
                size: 40,
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            ElevatedButton(
              onPressed: () {
                _pickImage(ImageSource.gallery);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffB8E3AA),
                minimumSize: const Size(95, 75),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Icon(
                Icons.wallpaper_rounded,
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _pickImage(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);

    if (pickedFile != null) {
      _showAiReport(pickedFile);
    }
  }

  void _showAiReport(XFile pickedFile) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AiReport(
          //ai 인식 결과에 따라 화면 결정
          selectedImage: pickedFile,
        ),
      ),
    );
  }
}
