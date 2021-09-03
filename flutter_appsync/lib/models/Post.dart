/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

/** This is an auto generated class representing the Post type in your schema. */
@immutable
class Post extends Model {
  static const classType = const _PostModelType();
  final String id;
  final User author;
  final TemporalDateTime date;
  final String caption;
  final String mediaURL;
  final String location;
  final List<Like> likes;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Post._internal(
      {@required this.id,
      this.author,
      this.date,
      this.caption,
      this.mediaURL,
      this.location,
      this.likes});

  factory Post(
      {String id,
      User author,
      TemporalDateTime date,
      String caption,
      String mediaURL,
      String location,
      List<Like> likes}) {
    return Post._internal(
        id: id == null ? UUID.getUUID() : id,
        author: author,
        date: date,
        caption: caption,
        mediaURL: mediaURL,
        location: location,
        likes: likes != null ? List<Like>.unmodifiable(likes) : likes);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Post &&
        id == other.id &&
        author == other.author &&
        date == other.date &&
        caption == other.caption &&
        mediaURL == other.mediaURL &&
        location == other.location &&
        DeepCollectionEquality().equals(likes, other.likes);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Post {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write(
        "author=" + (author != null ? author.toString() : "null") + ", ");
    buffer.write("date=" + (date != null ? date.format() : "null") + ", ");
    buffer.write("caption=" + "$caption" + ", ");
    buffer.write("mediaURL=" + "$mediaURL" + ", ");
    buffer.write("location=" + "$location");
    buffer.write("}");

    return buffer.toString();
  }

  Post copyWith(
      {String id,
      User author,
      TemporalDateTime date,
      String caption,
      String mediaURL,
      String location,
      List<Like> likes}) {
    return Post(
        id: id ?? this.id,
        author: author ?? this.author,
        date: date ?? this.date,
        caption: caption ?? this.caption,
        mediaURL: mediaURL ?? this.mediaURL,
        location: location ?? this.location,
        likes: likes ?? this.likes);
  }

  Post.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        author = json['author'] != null
            ? User.fromJson(new Map<String, dynamic>.from(json['author']))
            : null,
        date = json['date'] != null
            ? TemporalDateTime.fromString(json['date'])
            : null,
        caption = json['caption'],
        mediaURL = json['mediaURL'],
        location = json['location'],
        likes = json['likes'] is List
            ? (json['likes'] as List)
                .map((e) => Like.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'author': author?.toJson(),
        'date': date?.format(),
        'caption': caption,
        'mediaURL': mediaURL,
        'location': location,
        'likes': likes?.map((e) => e?.toJson())?.toList()
      };

  static final QueryField ID = QueryField(fieldName: "post.id");
  static final QueryField AUTHOR = QueryField(
      fieldName: "author",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (User).toString()));
  static final QueryField DATE = QueryField(fieldName: "date");
  static final QueryField CAPTION = QueryField(fieldName: "caption");
  static final QueryField MEDIAURL = QueryField(fieldName: "mediaURL");
  static final QueryField LOCATION = QueryField(fieldName: "location");
  static final QueryField LIKES = QueryField(
      fieldName: "likes",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (Like).toString()));
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Post";
    modelSchemaDefinition.pluralName = "Posts";

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        key: Post.AUTHOR,
        isRequired: false,
        targetName: "authorId",
        ofModelName: (User).toString()));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Post.DATE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Post.CAPTION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Post.MEDIAURL,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Post.LOCATION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: Post.LIKES,
        isRequired: false,
        ofModelName: (Like).toString(),
        associatedKey: Like.ID));
  });
}

class _PostModelType extends ModelType<Post> {
  const _PostModelType();

  @override
  Post fromJson(Map<String, dynamic> jsonData) {
    return Post.fromJson(jsonData);
  }
}
