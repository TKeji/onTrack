class Course {
  final String code;
  final String title;
  final int credits;

  Course(this.code, this.title, this.credits);

  Course.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        title = json['title'],
        credits = json['credits'];

  Map<String, dynamic> toJson() => {
        'code': code,
        'title': title,
        'credits': credits,
      };

  toString() {
    return 'Course<${this.code}, ${this.title}, ${this.credits}>';
  }
}
