import 'package:flutter/material.dart';
import 'package:ebookflutter/networking/apirequest/dio_instance.dart';
import 'package:ebookflutter/networking/model/ebooklist_response_manual.dart';
import 'package:ebookflutter/utilities/app_string.dart';
import 'package:ebookflutter/utilities/enum.dart';
import 'package:ebookflutter/presentation/ebookdetail_page.dart';

class EbookListPage extends StatefulWidget {
  final ApiType type;

  const EbookListPage({Key? key, required this.type}) : super(key: key);

  @override
  State<EbookListPage> createState() => _EbookListPageState();
}

class _EbookListPageState extends State<EbookListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ebook Online')),
      body: FutureBuilder(
        future: _future(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildList(snapshot.data as List);
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

  Widget _buildList(List data) {
    return ListView.separated(
      itemCount: data.length,
      itemBuilder: (context, index) => _ebookItem(data[index]),
      separatorBuilder: (BuildContext context, int index) => const Divider(height: 2, color: Colors.grey),
    );
  }

  Widget _ebookItem(Object item) {
    if (item is EbookResponseManual) {
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
            TextButton(onPressed: () => _navigateToEbookDetailPage(ApiType.dioQT,item.isbn13), child: const Text('Lihat Detail')),
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
  void _navigateToEbookDetailPage(ApiType type,String? id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EbookDetailPage(type: type,id:id),
      ),
    );
  }

  Future _future() {
    return APIRequest.getEbookListManual();

  }
}
