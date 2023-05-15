typedef MoreDropDownSearchAsyncCallBack = Future<List> Function(dynamic);

class MoreDropDownSearchCustom {
  final String key;
  final String queryName;
  final MoreDropDownSearchAsyncCallBack apiCall;
  dynamic dataResponse;
  MoreDropDownSearchCustom({
    required this.key,
    required this.queryName,
    required this.apiCall,
    this.dataResponse,
  });
}
