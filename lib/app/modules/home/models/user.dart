// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.login,
    this.avatarUrl,
    this.url,
    this.bio,
    this.publicRepos,
    this.publicGists,
    this.followers,
    this.following,
  });

  String? login;
  String? avatarUrl = 'https://avatars3.githubusercontent.com/u/52709853?v=4';
  String? url;
  dynamic bio;
  int? publicRepos;
  int? publicGists;
  int? followers;
  int? following;

  factory User.fromJson(Map<String, dynamic> json) => User(
        login: json["login"] == null ? null : json["login"],
        avatarUrl: json["avatar_url"] == null ? null : json["avatar_url"],
        url: json["url"] == null ? null : json["url"],
        bio: json["bio"],
        publicRepos: json["public_repos"] == null ? null : json["public_repos"],
        publicGists: json["public_gists"] == null ? null : json["public_gists"],
        followers: json["followers"] == null ? null : json["followers"],
        following: json["following"] == null ? null : json["following"],
      );

  Map<String, dynamic> toJson() => {
        "login": login == null ? null : login,
        "avatar_url": avatarUrl == null ? null : avatarUrl,
        "url": url == null ? null : url,
        "bio": bio,
        "public_repos": publicRepos == null ? null : publicRepos,
        "public_gists": publicGists == null ? null : publicGists,
        "followers": followers == null ? null : followers,
        "following": following == null ? null : following,
      };
}
