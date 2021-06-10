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
  final String name;
  final String lastName;
  final List<Post> posts;
  final List<Comment> comments;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const User._internal(
      {@required this.id,
      @required this.username,
      this.name,
      this.lastName,
      this.posts,
      this.comments});

  factory User(
      {String id,
      @required String username,
      String name,
      String lastName,
      List<Post> posts,
      List<Comment> comments}) {
    return User._internal(
        id: id == null ? UUID.getUUID() : id,
        username: username,
        name: name,
        lastName: lastName,
        posts: posts != null ? List.unmodifiable(posts) : posts,
        comments: comments != null ? List.unmodifiable(comments) : comments);
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
        name == other.name &&
        lastName == other.lastName &&
        DeepCollectionEquality().equals(posts, other.posts) &&
        DeepCollectionEquality().equals(comments, other.comments);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("User {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("username=" + "$username" + ", ");
    buffer.write("name=" + "$name" + ", ");
    buffer.write("lastName=" + "$lastName");
    buffer.write("}");

    return buffer.toString();
  }

  User copyWith(
      {String id,
      String username,
      String name,
      String lastName,
      List<Post> posts,
      List<Comment> comments}) {
    return User(
        id: id ?? this.id,
        username: username ?? this.username,
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        posts: posts ?? this.posts,
        comments: comments ?? this.comments);
  }

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        username = json['username'],
        name = json['name'],
        lastName = json['lastName'],
        posts = json['posts'] is List
            ? (json['posts'] as List)
                .map((e) => Post.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        comments = json['comments'] is List
            ? (json['comments'] as List)
                .map((e) => Comment.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'name': name,
        'lastName': lastName,
        'posts': posts?.map((e) => e?.toJson())?.toList(),
        'comments': comments?.map((e) => e?.toJson())?.toList()
      };

  static final QueryField ID = QueryField(fieldName: "user.id");
  static final QueryField USERNAME = QueryField(fieldName: "username");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField LASTNAME = QueryField(fieldName: "lastName");
  static final QueryField POSTS = QueryField(
      fieldName: "posts",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (Post).toString()));
  static final QueryField COMMENTS = QueryField(
      fieldName: "comments",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (Comment).toString()));
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "User";
    modelSchemaDefinition.pluralName = "Users";

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.USERNAME,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.NAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.LASTNAME,
        isRequired: false,
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
  });
}

class _UserModelType extends ModelType<User> {
  const _UserModelType();

  @override
  User fromJson(Map<String, dynamic> jsonData) {
    return User.fromJson(jsonData);
  }
}
