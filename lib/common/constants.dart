abstract class ServiceHosts{
  static const String LOGIN_SERVICE_HOST = 'http://192.168.1.4:5000';
  static const String USER_SERVICE_HOST = 'http://192.168.1.4:5000';
}

abstract class ServiceRoutes{
  static const String USER_SERVICE_ROUTE = '/v1/api/user/';
  static const String LOGIN_SERVICE_ROUTE = '/v1/api/session/';
  static const String PARTNER_SERVICE_ROUTE = '/v1/api/partner/';
}