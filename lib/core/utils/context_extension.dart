import 'package:flutter/material.dart';


/*
الملف ده فيه كذا حاجه
1-mediaQuerySize :MediaQuery.of(this).size ده بيرجع 
2- height:  بتاع الشاشه height ده بيرجع ال   
2- width:  بتاع الشاشه width ده بيرجع ال   
3-heightTransformer: ده بياخد حاجتين 
    -reducedBy : ده بتاع النسبه الي عايز تشيلها من الheight
    قيمه من 0الى 100 
    - dividedBy: reducedByعايز تاخد ايه من اللارتفاع بعد ما قللت  ب 
     لو عايز النص يبقى 2 وكذالك قيمتها اكبر من 1
4-widthTransformer: ده بياخد حاجتين 
    -reducedBy : ده بتاع النسبه الي عايز تشيلها من width
    قيمه من 0الى 100 
    - dividedBy: reducedByعايز تاخد ايه من العرض بعد ما قللت  ب 
     لو عايز النص يبقى 2 وكذالك قيمتها اكبر من 1
5-  isDarkMode => (theme.brightness == Brightness.dark);
6-   TextTheme get textTheme => Theme.of(this).textTheme;
 7- Orientation get orientation => MediaQuery.of(this).orientation;

  /// check if device is on landscape mode
 8- bool  isLandscape => orientation == Orientation.landscape;

 9- bool  isPortrait => orientation == Orientation.portrait;
 ///غير قيم حسب المشروع او حسب الى هيجيلك من ui
 10-bool  isPhone => (mediaQueryShortestSide < 600);
 11- bool  isSmallTablet => (mediaQueryShortestSide >= 600);
12-  bool  isLargeTablet => (mediaQueryShortestSide >= 720);
 13- bool  isTablet => isSmallTablet || isLargeTablet;
*/

extension MediaqueryContextExtensions on BuildContext {
  /// The same of [MediaQuery.of(context).size]
  Size get mediaQuerySize => MediaQuery.sizeOf(this);
  bool get alwaysUse24HourFormat => MediaQuery.of(this).alwaysUse24HourFormat;

  /// The same of [MediaQuery.of(context).size.height]
  /// Note: updates when you rezise your screen (like on a browser or
  /// desktop window)
  double get height => mediaQuerySize.height;

  /// The same of [MediaQuery.of(context).size.width]
  /// Note: updates when you rezise your screen (like on a browser or
  /// desktop window)
  double get width => mediaQuerySize.width;

  /// Gives you the power to get a portion of the height.
  /// Useful for responsive applications.
  ///
  /// [dividedBy] is for when you want to have a portion of the value you
  /// would get like for example: if you want a value that represents a third
  /// of the screen you can set it to 3, and you will get a third of the height
  ///
  /// [reducedBy] is a percentage value of how much of the height you want
  /// if you for example want 46% of the height, then you reduce it by 56%.
  double heightTransformer({double dividedBy = 1, double reducedBy = 0.0}) {
    return (mediaQuerySize.height -
            ((mediaQuerySize.height / 100) * reducedBy)) /
        dividedBy;
  }


  double ph(double v) {
    if (v > 0 && v <= 1) {
      return mediaQuerySize.height * v;
    }
    return 1;
  }

  double pw(double v) {
    if (v > 0 && v <= 1) {
      return mediaQuerySize.width * v;
    }
    return 1;
  }

  /// Gives you the power to get a portion of the width.
  /// Useful for responsive applications.
  ///
  /// [dividedBy] is for when you want to have a portion of the value you
  /// would get like for example: if you want a value that represents a third
  /// of the screen you can set it to 3, and you will get a third of the width
  ///
  /// [reducedBy] is a percentage value of how much of the width you want
  /// if you for example want 46% of the width, then you reduce it by 56%.
  double widthTransformer({double dividedBy = 1, double reducedBy = 0.0}) {
    return (mediaQuerySize.width - ((mediaQuerySize.width / 100) * reducedBy)) /
        dividedBy;
  }

  /// Divide the height proportionally by the given value
  double ratio({
    double dividedBy = 1,
    double reducedByW = 0.0,
    double reducedByH = 0.0,
  }) {
    return heightTransformer(dividedBy: dividedBy, reducedBy: reducedByH) /
        widthTransformer(dividedBy: dividedBy, reducedBy: reducedByW);
  }

  /// similar to [MediaQuery.of(context).padding]
  ThemeData get theme => Theme.of(this);

  /// Check if dark mode theme is enable
  bool get isDarkMode => (theme.brightness == Brightness.dark);

  /// give access to Theme.of(context).iconTheme.color
  Color? get iconColor => theme.iconTheme.color;

  /// similar to [MediaQuery.of(context).padding]
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// similar to [MediaQuery.of(context).padding]
  EdgeInsets get mediaQueryPadding => MediaQuery.of(this).padding;

  /// similar to [MediaQuery.of(context).padding]
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// similar to [MediaQuery.of(context).viewPadding]
  EdgeInsets get mediaQueryViewPadding => MediaQuery.of(this).viewPadding;

  /// similar to [MediaQuery.of(context).viewInsets]
  EdgeInsets get mediaQueryViewInsets => MediaQuery.of(this).viewInsets;

  /// similar to [MediaQuery.of(context).orientation]
  Orientation get orientation => MediaQuery.of(this).orientation;

  /// check if device is on landscape mode
  bool get isLandscape => orientation == Orientation.landscape;

  /// check if device is on portrait mode
  bool get isPortrait => orientation == Orientation.portrait;

  /// similar to [MediaQuery.of(this).devicePixelRatio]
  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;

  /// similar to [MediaQuery.of(this).textScaleFactor]

  /// get the shortestSide from screen
  double get mediaQueryShortestSide => mediaQuerySize.shortestSide;

  /// True if width be larger than 800
  bool get showNavbar => (width > 800);

  /// True if the shortestSide is smaller than 600p


  /// True if the current device is Tablet

  /// Returns a specific value according to the screen size
  /// if the device width is higher than or equal to 1200 return
  /// [desktop] value. if the device width is higher than  or equal to 600
  /// and less than 1200 return [tablet] value.
  /// if the device width is less than 300  return [watch] value.
  /// in other cases return [mobile] value.
 
  // TYPOGRAPHY 2021

  /// Smallest of the headline styles.
  ///
  /// Headline styles are smaller than display styles. They're best-suited for
  /// short, high-emphasis text on smaller screens.
  TextStyle? get headlineSmall => textTheme.headlineSmall;

  /// The hover color used to indicate when a pointer is hovering over a
  /// component.
  Color get hoverColor => Theme.of(this).hoverColor;

  /// Largest of the label styles.
  ///
  /// Label styles are smaller, utilitarian styles, used for areas of the UI
  /// such as text inside of components or very small supporting text in the
  /// content body, like captions.
  ///
  /// Used for text on [ElevatedButton], [TextButton] and [OutlinedButton].
  TextStyle? get labelLarge => textTheme.labelLarge;

  /// Middle size of the label styles.
  ///
  /// Label styles are smaller, utilitarian styles, used for areas of the UI
  /// such as text inside of components or very small supporting text in the
  /// content body, like captions.
  TextStyle? get labelMedium => textTheme.labelMedium;

  /// Smallest of the label styles.
  ///
  /// Label styles are smaller, utilitarian styles, used for areas of the UI
  /// such as text inside of components or very small supporting text in the
  /// content body, like captions
  TextStyle? get labelSmall => textTheme.labelSmall;

  /// performs a simple [Theme.of(context).primaryColor] action and returns given [primaryColor]
  Color get primaryColor => Theme.of(this).primaryColor;

  /// A darker version of the [primaryColor].
  Color get primaryColorDark => Theme.of(this).primaryColorDark;

  /// A lighter version of the [primaryColor].
  Color get primaryColorLight => Theme.of(this).primaryColorLight;

  /// performs a simple [Theme.of(context).primaryTextTheme] action and returns given [primaryTextTheme]
  TextTheme get primaryTextTheme => Theme.of(this).primaryTextTheme;

  /// The default color of the [Material] that underlies the [Scaffold]. The
  /// background color for a typical material app or a page within the app.
  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;



  /// Largest of the title styles.
  ///
  /// Titles are smaller than headline styles and should be used for shorter,
  /// medium-emphasis text.
  TextStyle? get titleLarge => textTheme.titleLarge;

  /// Middle size of the title styles.
  ///
  /// Titles are smaller than headline styles and should be used for shorter,
  /// medium-emphasis text.
  TextStyle? get titleMedium => textTheme.titleMedium;

  /// Smallest of the title styles.
  ///
  /// Titles are smaller than headline styles and should be used for shorter,
  /// medium-emphasis text.
  TextStyle? get titleSmall => textTheme.titleSmall;
}

extension NavigatorExt on BuildContext {
  Object? get routeArguments => ModalRoute.of(this)?.settings.arguments;

  Object? get routeName => ModalRoute.of(this)?.settings.name;

  Object? get routeSettings => ModalRoute.of(this)?.settings;

  ///  just call this [canPop()] method and it would return true if this route can be popped and false if it’s not possible.
  bool canPop() => Navigator.canPop(this);

  /// performs a simple [Navigator.pop] action and returns given [result]
  void pop<T>({result}) => Navigator.pop(this, result);

  /// perform replash with routeName
  void popUntil(
    String screenName, {
    bool rootNavigator = false,
  }) =>
      Navigator.of(
        this,
        rootNavigator: rootNavigator,
      ).popUntil(ModalRoute.withName(screenName));

  /// performs a simple [Navigator.push] action with given [route]
  Future<dynamic> push(
    Widget screen, {
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool rootNavigator = false,
  }) async =>
      await Navigator.of(
        this,
        rootNavigator: rootNavigator,
      ).push(MaterialPageRoute(
        builder: (_) => screen,
        settings: settings,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
      ));

  /// perform push and remove route
  Future<dynamic> pushAndRemoveUntil(
    Widget screen, {
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool routes = false,
    bool rootNavigator = false,
  }) async =>
      await Navigator.of(
        this,
        rootNavigator: rootNavigator,
      ).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => screen,
            settings: settings,
            maintainState: maintainState,
            fullscreenDialog: fullscreenDialog,
          ),
          (Route<dynamic> route) => routes);

  /// perform push with routeName
  Future<dynamic> pushNamed(
    String screenName, {
    Object? arguments,
    bool rootNavigator = false,
  }) async =>
      await Navigator.of(
        this,
        rootNavigator: rootNavigator,
      ).pushNamed(screenName, arguments: arguments);

  /// performs a simple [Navigator.pushReplacement] action with given [route]
  Future<dynamic> pushReplacement(
    Widget screen, {
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool rootNavigator = false,
  }) async =>
      await Navigator.of(
        this,
        rootNavigator: rootNavigator,
      ).pushReplacement(MaterialPageRoute(
        builder: (_) => screen,
        settings: settings,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
      ));

  /// perform replash with routeName
  Future<dynamic> pushReplacementNamed(
    String screenName, {
    Object? arguments,
    bool rootNavigator = false,
  }) =>
      Navigator.of(
        this,
        rootNavigator: rootNavigator,
      ).pushReplacementNamed(screenName, arguments: arguments);
}
