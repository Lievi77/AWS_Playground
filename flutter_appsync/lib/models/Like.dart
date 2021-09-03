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
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the Like type in your schema. */
@immutable
class Like extends Model {
  static const classType = const _LikeModelType();
  final String id;
  final TemporalDateTime date;
  final User user;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Like._internal({@required this.id, this.date, this.user});

  factory Like({String id, TemporalDateTime date, User user}) {
    return Like._internal(
        id: id == null ? UUID.getUUID() : id, date: date, user: user);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Like &&
        id == other.id &&
        date == other.date &&
        user == other.user;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Like {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("date=" + (date != null ? date.format() : "null") + ", ");
    buffer.write("user=" + (user != null ? user.toString() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Like copyWith({String id, TemporalDateTime date, User user}) {
    return Like(
        id: id ?? this.id, date: date ?? this.date, user: user ?? this.user);
  }

  Like.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        date = json['date'] != null
            ? TemporalDateTime.fromString(json['date'])
            : null,
        user = json['user'] != null
            ? User.fromJson(new Map<String, dynamic>.from(json['user']))
            : null;

  Map<String, dynamic> toJson() =>
      {'id': id, 'date': date?.format(), 'user': user?.toJson()};

  static final QueryField ID = QueryField(fieldName: "like.id");
  static final QueryField DATE = QueryField(fieldName: "date");
  static final QueryField USER = QueryField(
      fieldName: "user",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (User).toString()));
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Like";
    modelSchemaDefinition.pluralName = "Likes";

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Like.DATE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        key: Like.USER,
        isRequired: false,
        targetName: "userId",
        ofModelName: (User).toString()));
  });
}

class _LikeModelType extends ModelType<Like> {
  const _LikeModelType();

  @override
  Like fromJson(Map<String, dynamic> jsonData) {
    return Like.fromJson(jsonData);
  }
}
