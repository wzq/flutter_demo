class UserInfo {
  bool admin;
  List<String> chapterTops;
  List<int> collectIds;
  String email;
  String icon;
  int id;
  String nickname;
  String password;
  String token;
  int type;
  String username;

  UserInfo(
      {this.admin,
        this.chapterTops,
        this.collectIds,
        this.email,
        this.icon,
        this.id,
        this.nickname,
        this.password,
        this.token,
        this.type,
        this.username});

  UserInfo.fromJson(Map<String, dynamic> json) {
    admin = json['admin'];
    if (json['chapterTops'] != null) {
      chapterTops = new List<String>();
      json['chapterTops'].forEach((v) {
        chapterTops.add(v);
      });
    }
    if (json['collectIds'] != null) {
      collectIds = new List<int>();
      json['collectIds'].forEach((v) {
        collectIds.add(v);
      });
    }
    email = json['email'];
    icon = json['icon'];
    id = json['id'];
    nickname = json['nickname'];
    password = json['password'];
    token = json['token'];
    type = json['type'];
    username = json['username'];
  }
}