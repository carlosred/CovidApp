class Constants {
//urls
  static const baseApiUrl = 'api.covidtracking.com';
  static const homeUrl = '/v1/us/current.json';
  static const getStatesCodes = '/v1/states/info.json';
  static const getStatesInfo = '/v1/states/current.json';
  static const getStateDetail = '/v1/states/{state}/info.json';

  //texts
  static const android = 'ANDROID';
  static const login = 'Login';
  static const title = 'Covid App';
  static const loading = 'Loading...';
  static const cc = 'CC';
  static const company = 'Evertec';
  static const totalDeaths = 'Fallecidos';
  static const dateChecked = 'Fecha Recolección Datos:';
  static const deviceName = 'Nombre del dispositivo';
  static const deviceBrand = 'Marca del dispositivo';
  static const deviceType = 'Tipo del dispositivo';
  static const deviceModel = 'Modelo del dispositivo';
  static const detailPerRegion = 'Detalles por region';
  static const disclaimer =
      'El proyecto COVID Tracking ha finalizado toda recopilación de datos a partir del 7 de marzo de 2021';
  static const documentNumber = 'Número de documento:';
  static const documentType = 'Tipo de documento:';
  static const error = 'Error:';
  static const inUci = 'En UCI';
  static const ios = 'IOS';
  static const ti = 'TI';
  static const totalCases = 'Casos totales';
  static const hospitalized = 'Hospitalizados';
  static const negatives = 'Pruebas negativas';
  static const noData = 'No data';
  static const notes = 'Notes';
  static const passport = 'Pasaporte';
  static const password = 'Contraseña:';
  static const pending = 'Pendientes';
  static const positives = 'Pruebas positivas';
  static const onVentilator = 'Con ventiladores';
  static const osVersion = 'Sistema operativo y su versión';
  static const seeMoreDetails = 'Ver Más Detalles';
  static const successfulLogin = 'Login Exitoso';
  static const wrongPassword = 'Documento o Contraseña Incorrectos';
  static const website = 'Web site:';
  static const String welcomeTo = 'Bienvenido a:';
  static const String registerUser = 'Registrar usuario';
  static const String facebook = 'Facebook';
  static const String google = 'Google';
  static const String instagram = 'Instagram';
  static const String lastUpdated = 'Última Modificación:';

  //assets

  static const splashImage = 'assets/images/splash.webp';
  static const homeImage = 'assets/images/home.jpg';
  static const loginImage = 'assets/images/login.webp';
}
