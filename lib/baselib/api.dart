class Api {
  static const String BASE_URL = "https://es.staq360.com/";
  static const String TEST_URL = "http://182.150.22.222:6061";

  static const String USER_ADMIN = "admin/";
  static const String USER_CONSTANTS = "user/";
  static const String COMMUNITY = "community/";
  static const String APP = "app/";

  //首页banner列表
  static const String HOME_BANNER_LIST =
      "${USER_ADMIN}cms/news/public/banner/list";

  //福利菜单列表
  static const String WELFARE_MENU_LIST =
      "${USER_ADMIN}public/sys/dict/type/WELFARE_MENU_CONFIG";

  //发现短视频列表
  static const String FIND_VIDEO_LIST =
      "${USER_ADMIN}cms/news/public/video/hot/list";
}
