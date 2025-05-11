// class VaccineTable {
//   static String get vaccine => 'vaccine';

//   static String get id => 'id';
//   static String get title => 'title';
//   static String get description => 'description';
  

//   static String get create => '''
//       CREATE TABLE IF NOT EXISTS `$vaccine' (
//             `$id` INTEGER PRIMARY KEY,
//             `$title` TEXT NOT NULL,
//             `$description` TEXT NOT NULL,
            
//        )''';
// }
class VaccineTable {
  static String get vaccine => 'vaccine';

  static String get id => 'id';
  static String get title => 'title';
  static String get description => 'description';
  

  static String get create => '''
      CREATE TABLE IF NOT EXISTS `$vaccine` (
            `$id` INTEGER PRIMARY KEY,
            `$title` TEXT NOT NULL,
            `$description` TEXT NOT NULL,
             
       )
  ''';
}