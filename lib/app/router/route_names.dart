/// Named route paths for the application.
class RouteNames {
  RouteNames._();

  static const String today = '/';
  static const String reflection = '/reflection';
  static const String momentum = '/momentum';
  static const String stuck = '/stuck';
  static const String allPlans = '/plans';
  static const String planDetail = '/plan/:planId';
  static const String focus = '/focus/:planId';
  static const String settings = '/settings';

  static String planDetailPath(String planId) => '/plan/$planId';
  static String focusPath(String planId) => '/focus/$planId';
}
