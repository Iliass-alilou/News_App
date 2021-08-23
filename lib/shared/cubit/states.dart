
abstract class NewsApp_States{}

class NewsApp_InitialState extends NewsApp_States{}

class IndexItemSelected_State extends NewsApp_States{}



class getNews_Business_Loading_State extends NewsApp_States{}

class getNews_Business_Success_State  extends NewsApp_States{}

class getNews_Business_Error_State  extends NewsApp_States{

  final String error;
  getNews_Business_Error_State({required this.error});
}




class getNews_Sports_Loading_State extends NewsApp_States{}

class getNews_Sports_Success_State  extends NewsApp_States{}

class getNews_Sports_Error_State  extends NewsApp_States{

  final String error;
  getNews_Sports_Error_State({required this.error});
}



class getNews_Science_Loading_State extends NewsApp_States{}

class getNews_Science_Success_State  extends NewsApp_States{}

class getNews_Science_Error_State  extends NewsApp_States{

  final String error;
  getNews_Science_Error_State({required this.error});
}
