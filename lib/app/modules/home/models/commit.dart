// To parse this JSON data, do
//
//     final commitList = commitListFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<CommitList> commitListFromJson(String str) =>
    List<CommitList>.from(json.decode(str).map((x) => CommitList.fromJson(x)));

String commitListToJson(List<CommitList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommitList {
  CommitList({
    required this.commit,
    required this.author,
  });

  Commit commit;
  CommitListAuthor author;

  factory CommitList.fromJson(Map<String, dynamic> json) => CommitList(
        commit: Commit.fromJson(json["commit"]),
        author: CommitListAuthor.fromJson(json["author"]),
      );

  Map<String, dynamic> toJson() => {
        "commit": commit == null ? null : commit.toJson(),
        "author": author == null ? null : author.toJson(),
      };
}

class CommitListAuthor {
  CommitListAuthor({
    required this.login,
    required this.avatarUrl,
    required this.url,
  });

  String login;
  String avatarUrl;
  String url;

  factory CommitListAuthor.fromJson(Map<String, dynamic> json) =>
      CommitListAuthor(
        login: json["login"] == null ? null : json["login"],
        avatarUrl: json["avatar_url"] == null ? null : json["avatar_url"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "login": login == null ? null : login,
        "avatar_url": avatarUrl == null ? null : avatarUrl,
        "url": url == null ? null : url,
      };
}

class Commit {
  Commit({
    required this.author,
    required this.message,
  });

  CommitAuthor author;
  String message;

  factory Commit.fromJson(Map<String, dynamic> json) => Commit(
        author: CommitAuthor.fromJson(json["author"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "author": author == null ? null : author.toJson(),
        "message": message == null ? null : message,
      };
}

class CommitAuthor {
  CommitAuthor({
    required this.name,
    required this.date,
  });

  String name;
  String date;

  factory CommitAuthor.fromJson(Map<String, dynamic> json) => CommitAuthor(
        name: json["name"] == null ? null : json["name"],
        date: json["date"] == null ? null : json["date"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "date": date == null ? null : date,
      };
}
