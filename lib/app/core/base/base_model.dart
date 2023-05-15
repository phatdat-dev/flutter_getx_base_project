// get generate model on response with assets/import_response.json
//get generate model with assets/import_response.json
abstract class BaseModel<R> {
  R fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}

// abstract class SearchDelegateQueryName {
//   String get queryName;
//   set queryName(String value) => queryName = value;
//   Object? objectt;
//   String? description;
// }

mixin BaseSelectedModel {
  bool isSelected = false;
}
