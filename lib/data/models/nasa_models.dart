
// ignore_for_file: camel_case_types

class nasaModel {
  final String date;
  final String explanation;
  final String imageUrl;
  final String title;

  nasaModel( {required this.title,required this.date, required this.explanation, required this.imageUrl});

  factory nasaModel.fromJson(Map<String, dynamic> json) {
    return nasaModel(
      title:json['title'],
      date: json['date'],
      explanation: json['explanation'],
      imageUrl: json['url']??'https://c8.alamy.com/compes/r3yw81/el-icono-de-imagen-no-disponible-vector-plana-r3yw81.jpg',
    );
  }
}
