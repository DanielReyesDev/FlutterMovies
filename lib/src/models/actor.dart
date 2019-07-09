import 'package:flutter/material.dart';

class Cast {
  List<Actor> actors;

  Cast.fromJsonList(List<dynamic> jsonList) {
    if(jsonList == null) return;
    jsonList.forEach( (item){
      final actor = Actor.fromJsonMap(item);
      actors.add(actor);
    });
  }
}

class Actor {
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Actor({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  Actor.fromJsonMap(Map<String, dynamic> json) {
    castId = json["cast_id"];
    character = json["character"];
    creditId = json["credit_id"];
    gender = json["gender"];
    id = json["id"];
    name = json["name"];
    order = json["order"];
    profilePath = json["profile_path"];
  }

   String getPhoto() {
    if(profilePath == null) {
      return "data:image/jpeg;base64,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";
    }
    return "https://image.tmdb.org/t/p/w500/$profilePath";
  }

  
}