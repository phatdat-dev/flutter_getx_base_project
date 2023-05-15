import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';

import '../../custom/other/more_dropdown_search_custom.dart';
import '../../custom/other/search_controller_custom.dart';
import 'helper_reflect.dart';

class HelperWidget {
  static void showToast(String message) {
    FToast fToast = FToast()..init(Get.context!);
    fToast.showToast(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.red.shade100,
        ),
        child: Text(
          message,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
      gravity: ToastGravity.CENTER,
      toastDuration: const Duration(seconds: 10),
    );
  }

  //hight light occurrentces
  static List<TextSpan> highlightOccurrences(String text, String query) {
    final List<TextSpan> spans = [];
    final String lowercaseText = text.toLowerCase();
    final String lowercaseQuery = query.toLowerCase();

    int lastIndex = 0;
    int index = lowercaseText.indexOf(lowercaseQuery);

    while (index != -1) {
      spans.add(TextSpan(text: text.substring(lastIndex, index)));
      spans.add(TextSpan(text: text.substring(index, index + query.length), style: const TextStyle(fontWeight: FontWeight.bold)));
      lastIndex = index + query.length;
      index = lowercaseText.indexOf(lowercaseQuery, lastIndex);
    }

    spans.add(TextSpan(text: text.substring(lastIndex, text.length)));

    return spans;
  }

  static void showSnackBar({
    required String message,
    MaterialColor color = Colors.green,
    IconData iconData = Icons.task_alt,
    Duration duration = const Duration(seconds: 3),
    double? width,
  }) =>
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: Row(
          children: [
            Icon(iconData, color: color),
            const SizedBox(width: 10),
            Text(message, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
          ],
        ),
        backgroundColor: color.shade100,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), //StadiumBorder()
        margin: const EdgeInsets.all(10),
        width: width,
        duration: duration,
        //show snackbar animation bottom to top
      ));

  static Widget buildImage(String image) {
    final context = Get.context!;
    return GestureDetector(
      onTap: () {
        showDialog(
            //barrierDismissible: false,
            context: context,
            builder: (context) => Stack(
                  children: [
                    InteractiveViewer(
                      maxScale: 10,
                      child: Center(
                        child: Hero(
                          tag: image,
                          child: Image.network(
                            image,
                            // fit: BoxFit.fill,
                            alignment: Alignment.center,
                            errorBuilder: (context, error, stackTrace) => const Icon(Icons.image, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Material(
                        child: BackButton(),
                      ),
                    ),
                  ],
                ));
      },
      child: Hero(
        tag: image,
        child: Image.network(
          image,
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width / 2,
          // alignment: Alignment.center,
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.image, color: Colors.grey),
        ),
      ),
    );
  }

  static Widget buildFile(String file) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Image.asset(
            'assets/gif/attachment-file.gif',
            width: 100,
            height: 150,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          file.split('/').last,
          style: const TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 15),
        ),
      ],
    );
  }

  static Future<T?> showSearchDropDown<T extends SearchDelegateQueryName>({
    required Iterable<T> data,
    String? hintText = 'Search...',
  }) async {
    final ValueNotifier<List<T>> search = ValueNotifier(data.toList());
    final txtController = TextEditingController();
    return await showDialog<T>(
        // showGeneralDialog
        context: Get.context!,
        builder: (context) {
          final size = MediaQuery.of(context).size;
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            titlePadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            scrollable: true,
            title: Container(
              height: 40,
              margin: const EdgeInsets.all(10),
              child: TextField(
                controller: txtController,
                onChanged: (value) => HelperReflect.search(listOrigin: data, listSearch: search, nameModel: 'queryName', keywordSearch: value),
                decoration: InputDecoration(
                  hintText: hintText,
                  prefixIcon: const Icon(Icons.search_rounded),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            content: SizedBox(
              width: size.width,
              height: size.height / 2,
              child: ValueListenableBuilder(
                valueListenable: search,
                builder: (context, value, child) => ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.length,
                  itemBuilder: (context, index) => ListTile(
                    title: txtController.text.isEmpty
                        ? Text(value[index].queryName)
                        : RichText(
                            text: TextSpan(
                                children: highlightOccurrences(value[index].queryName, txtController.text),
                                style: TextStyle(color: Theme.of(context).colorScheme.onSurface)),
                          ),
                    onTap: () => Navigator.of(context).pop(value[index]),
                  ),
                ),
              ),
            ),
          );
        });
  }

  /// [initData] mạc định sẽ gọi api
  /// [moreDropDownSearch] sẽ tạo ra nút dropdown cho chọn, khi click vào sẽ đổi theo api tương ứng
  static Future<MoreDropDownSearchCustom?> showSearchDropDownApiCall({
    required BuildContext context,
    required MoreDropDownSearchCustom initData,
    String hintText = 'Search...',
    Iterable<MoreDropDownSearchCustom>? moreDropDownSearch,
  }) async {
    final ValueNotifier<List> search = ValueNotifier([]);
    final txtController = TextEditingController();
    final Debouncer debouncer = Debouncer(delay: const Duration(seconds: 1));
    return await showDialog(
        // showGeneralDialog
        context: context,
        builder: (context) {
          final size = MediaQuery.of(context).size;
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            titlePadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            scrollable: true,
            title: Container(
              height: 40,
              margin: const EdgeInsets.all(10),
              child: StatefulBuilder(
                builder: (context, setState) => TextField(
                  controller: txtController,
                  onChanged: (value) => debouncer(() async => search.value = await initData.apiCall(value)),
                  decoration: InputDecoration(
                    hintText: hintText,
                    prefixIcon: const Icon(Icons.search_rounded),
                    suffixIcon: moreDropDownSearch != null
                        ? PopupMenuButton<String>(
                            icon: const Icon(Icons.more_vert_rounded),
                            onSelected: (key) {
                              initData = moreDropDownSearch.firstWhere((element) => element.key == key);
                              setState(() => hintText = key);
                            },
                            itemBuilder: (BuildContext context) {
                              return moreDropDownSearch.map((e) => PopupMenuItem<String>(value: e.key, child: Text(e.key))).toList();
                            })
                        : null,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            content: SizedBox(
              width: size.width,
              height: size.height / 2,
              child: ValueListenableBuilder(
                valueListenable: search,
                builder: (context, value, child) => ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    final item = value[index];

                    return ListTile(
                      title: txtController.text.isEmpty
                          ? Text(
                              item[initData.queryName] ?? '',
                              maxLines: 2,
                            )
                          : RichText(
                              text: TextSpan(
                                  children: highlightOccurrences(item[initData.queryName] ?? '', txtController.text),
                                  style: TextStyle(color: Theme.of(context).colorScheme.onSurface)),
                              maxLines: 2,
                            ),
                      onTap: () => Navigator.of(context).pop(initData..dataResponse = item),
                    );
                  },
                ),
              ),
            ),
          );
        });
  }
}
