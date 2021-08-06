/*
* Copyright 2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// ignore_for_file: public_member_api_docs

import 'ModelProvider.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the User type in your schema. */
@immutable
class User extends Model {
  static const classType = const _UserModelType();
  final String id;
  final String username;
  final List<Post> posts;
  final List<Comment> comments;
  final String urlProfilePic;
  final List<UserBlock> blockedUsers;
  final List<UserBlock> blockedByUsers;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const User._internal(
      {@required this.id,
      @required this.username,
      this.posts,
      this.comments,
      this.urlProfilePic,
      this.blockedUsers,
      this.blockedByUsers});

  factory User(
      {String id,
      @required String username,
      List<Post> posts,
      List<Comment> comments,
      String urlProfilePic,
      List<UserBlock> blockedUsers,
      List<UserBlock> blockedByUsers}) {
    return User._internal(
        id: id == null ? UUID.getUUID() : id,
        username: username,
        posts: posts != null ? List.unmodifiable(posts) : posts,
        comments: comments != null ? List.unmodifiable(comments) : comments,
        urlProfilePic: urlProfilePic,
        blockedUsers: blockedUsers != null
            ? List.unmodifiable(blockedUsers)
            : blockedUsers,
        blockedByUsers: blockedByUsers != null
            ? List.unmodifiable(blockedByUsers)
            : blockedByUsers);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        id == other.id &&
        username == other.username &&
        DeepCollectionEquality().equals(posts, other.posts) &&
        DeepCollectionEquality().equals(comments, other.comments) &&
        urlProfilePic == other.urlProfilePic &&
        DeepCollectionEquality().equals(blockedUsers, other.blockedUsers) &&
        DeepCollectionEquality().equals(blockedByUsers, other.blockedByUsers);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("User {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("username=" + "$username" + ", ");
    buffer.write("urlProfilePic=" + "$urlProfilePic");
    buffer.write("}");

    return buffer.toString();
  }

  User copyWith(
      {String id,
      String username,
      List<Post> posts,
      List<Comment> comments,
      String urlProfilePic,
      List<UserBlock> blockedUsers,
      List<UserBlock> blockedByUsers}) {
    return User(
        id: id ?? this.id,
        username: username ?? this.username,
        posts: posts ?? this.posts,
        comments: comments ?? this.comments,
        urlProfilePic: urlProfilePic ?? this.urlProfilePic,
        blockedUsers: blockedUsers ?? this.blockedUsers,
        blockedByUsers: blockedByUsers ?? this.blockedByUsers);
  }

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        username = json['username'],
        posts = json['posts'] is List
            ? (json['posts'] as List)
                .map((e) => Post.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        comments = json['comments'] is List
            ? (json['comments'] as List)
                .map((e) => Comment.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        urlProfilePic = json['urlProfilePic'],
        blockedUsers = json['blockedUsers'] is List
            ? (json['blockedUsers'] as List)
                .map(
                    (e) => UserBlock.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        blockedByUsers = json['blockedByUsers'] is List
            ? (json['blockedByUsers'] as List)
                .map(
                    (e) => UserBlock.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'posts': posts?.map((e) => e?.toJson())?.toList(),
        'comments': comments?.map((e) => e?.toJson())?.toList(),
        'urlProfilePic': urlProfilePic,
        'blockedUsers': blockedUsers?.map((e) => e?.toJson())?.toList(),
        'blockedByUsers': blockedByUsers?.map((e) => e?.toJson())?.toList()
      };

  static final QueryField ID = QueryField(fieldName: "user.id");
  static final QueryField USERNAME = QueryField(fieldName: "username");
  static final QueryField POSTS = QueryField(
      fieldName: "posts",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (Post).toString()));
  static final QueryField COMMENTS = QueryField(
      fieldName: "comments",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (Comment).toString()));
  static final QueryField URLPROFILEPIC =
      QueryField(fieldName: "urlProfilePic");
  static final QueryField BLOCKEDUSERS = QueryField(
      fieldName: "blockedUsers",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (UserBlock).toString()));
  static final QueryField BLOCKEDBYUSERS = QueryField(
      fieldName: "blockedByUsers",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (UserBlock).toString()));
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "User";
    modelSchemaDefinition.pluralName = "Users";

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.USERNAME,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: User.POSTS,
        isRequired: false,
        ofModelName: (Post).toString(),
        associatedKey: Post.AUTHOR));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: User.COMMENTS,
        isRequired: false,
        ofModelName: (Comment).toString(),
        associatedKey: Comment.AUTHOR));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.URLPROFILEPIC,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: User.BLOCKEDUSERS,
        isRequired: false,
        ofModelName: (UserBlock).toString(),
        associatedKey: UserBlock.SOURCEUSER));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: User.BLOCKEDBYUSERS,
        isRequired: false,
        ofModelName: (UserBlock).toString(),
        associatedKey: UserBlock.BLOCKEDUSER));
  });
}

class _UserModelType extends ModelType<User> {
  const _UserModelType();

  @override
  User fromJson(Map<String, dynamic> jsonData) {
    return User.fromJson(jsonData);
  }
}
