// necessary imports

// relative imports
import './requests.dart';
import '../models/component.dart';

Future<List<String>>? getAllIds({String endpoint="components/get-all-ids"}) async{
  final response = await getRequest(endpoint);
  if(response){
    print(response);
    return response;
  }
  else{
    throw Exception("Failed to retrieve Ids!!");
  }
}


Future<List<Component>> getComponents(List<String> ids,{String endpoint="components/get-components-by-ids",int index=0}) async{
  List<Component> components = [];
  Map<String,dynamic> body = {
    "componentIds":ids,
    "index":index
  };
  final response = await postRequest("components", body);
  if(response){
    response.entries.map((entry){
      final component = Component.fromJson(entry.value,int.parse(entry.key));
      components.add(component);
    });
  }
  return components;
}
