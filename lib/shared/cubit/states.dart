
abstract class NewsApp_States{}

class NewsApp_InitialState extends NewsApp_States{}

class IndexItemSelected_State extends NewsApp_States{}

class getNews_Business_Loading_State extends NewsApp_States{}

class getNews_Business_Success_State  extends NewsApp_States{}

class getNews_Business_Error_State  extends NewsApp_States{

  final String error;
  getNews_Business_Error_State({required this.error});
}

