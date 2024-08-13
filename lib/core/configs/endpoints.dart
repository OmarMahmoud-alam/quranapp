class EndPoints {
  static const String baseURL =
      'http://api-tickets.durrat-almuheat.net/new_dl/api';
  static const String login = '/login';
  static const String forgotPassword = '/v2/forgot-password';
  static const String verifyCode = '/v2/verify-code';
  static const String verifyResetPassword = '/v2/reset-password';
  static const String changePassword = '/change-password';
  static const String currentUser = '/v2/current-user';
  static const String createTicket = '/tickets';
  static const String getAndFilterTickets = '/v2/tickets/all';
  static const String reports = '/v2/tickets';
  static const String types = '/types';
  static const String stations = '/stations';
  static const String users = '/users';
  static const String getNotifications = '/v2/notifications/';
  static const String markNotificationAsRead = '/notifications';
  static const String updateFcmToken = '/users/addDeviceToken';
  static const String comments = '/comments';
  static const String homeCharts = '/v2/report/chart/';
}
