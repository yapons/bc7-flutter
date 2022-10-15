import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:ebookflutter/networking/apirequest/dio_instance.dart';
import 'package:ebookflutter/networking/model/ebookdetail_response_manual.dart';
import 'package:ebookflutter/utilities/app_string.dart';
import 'package:ebookflutter/utilities/enum.dart';
import 'package:http/http.dart' as http;

class EbookDetailPage extends StatefulWidget {
  final ApiType type;
  final String? id;
  const EbookDetailPage({Key? key, required this.type,this.id}) : super(key: key);

  @override
  State<EbookDetailPage> createState() => _EbookDetailPageState();
}

class _EbookDetailPageState extends State<EbookDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: FutureBuilder(
        future: _future(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildList(snapshot.data);
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(AppString.errorSomething),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(AppString.back),
                  )
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _buildList(data) {
   //return Text(data.title);
    return SizedBox(
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: const Text(
                'Title',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle:  Text(data.title),
              leading: Icon(
                Icons.book_online,
                color: Colors.blue[500],
              ),
            ),
            //const Divider(),
            ListTile(
              title:  const Text(
                'Author',
                //style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle:  Text(data.authors),
              leading: const Text(''),
            ),
            ListTile(
              title:  const Text(
                'Publisher',
                //style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle:  Text(data.publisher),
              leading: const Text(''),
            ),
            ListTile(
              title:  const Text(
                'Year',
                //style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle:  Text(data.year),
              leading: _dataImg(),
            ),
          ],
        ),
      ),
    );
    // return ListView.separated(
    //   itemCount: data.length,
    //   itemBuilder: (context, index) => _ebookItem(data),
    //   separatorBuilder: (BuildContext context, int index) => const Divider(height: 2, color: Colors.grey),
    // );
  }

  Widget _dataImg() {
    //final String url = 'https://www.gravatar.com/avatar/e944138e1114aefe4b08848a46465589';
    http.get(Uri.parse('https://uxwing.com/wp-content/themes/uxwing/download/business-professional-services/computer-user-icon.png')).then((response) {
      //Uint8List bodyBytes = response.bodyBytes;
      return Image.memory(response.bodyBytes);
      //File('my_image.jpg').writeAsBytes(bodyBytes);
    });
    return Text('');
  }

  Widget _ebookItem(Object item) {
    if (item is EbookDetailResponseManual) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                item.title ?? "",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Text(item.subtitle ?? "", textAlign: TextAlign.justify),

          ],
        ),
      );

    } else {
      return Container(
        height: 100,
        width: double.infinity,
        color: Colors.amber,
      );
    }
  }

  Future _future() {
    return APIRequest.getEbookDetailManual(widget.id);

    }
  }



