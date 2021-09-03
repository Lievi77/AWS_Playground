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

/** This is an auto generated class representing the UserBlock type in your schema. */
@immutable
class UserBlock extends Model {
  static const classType = const _UserBlockModelType();
  final String id;
  final User sourceUser;
  final User blockedUser;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const UserBlock._internal(
      {@required this.id,
      @required this.sourceUser,
      @required this.blockedUser});

  factory UserBlock(
      {String id, @required User sourceUser, @required User blockedUser}) {
    return UserBlock._internal(
        id: id == null ? UUID.getUUID() : id,
        sourceUser: sourceUser,
        blockedUser: blockedUser);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserBlock &&
        id == other.id &&
        sourceUser == other.sourceUser &&
        blockedUser == other.blockedUser;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("UserBlock {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("sourceUser=" +
        (sourceUser != null ? sourceUser.toString() : "null") +
        ", ");
    buffer.write("blockedUser=" +
        (blockedUser != null ? blockedUser.toString() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  UserBlock copyWith({String id, User sourceUser, User blockedUser}) {
    return UserBlock(
        id: id ?? this.id,
        sourceUser: sourceUser ?? this.sourceUser,
        blockedUser: blockedUser ?? this.blockedUser);
  }

  UserBlock.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        sourceUser = json['sourceUser'] != null
            ? User.fromJson(new Map<String, dynamic>.from(json['sourceUser']))
            : null,
        blockedUser = json['blockedUser'] != null
            ? User.fromJson(new Map<String, dynamic>.from(json['blockedUser']))
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'sourceUser': sourceUser?.toJson(),
        'blockedUser': blockedUser?.toJson()
      };

  static final QueryField ID = QueryField(fieldName: "userBlock.id");
  static final QueryField SOURCEUSER = QueryField(
      fieldName: "sourceUser",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (User).toString()));
  static final QueryField BLOCKEDUSER = QueryField(
      fieldName: "blockedUser",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (User).toString()));
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "UserBlock";
    modelSchemaDefinition.pluralName = "UserBlocks";

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        key: UserBlock.SOURCEUSER,
        isRequired: true,
        targetName: "sourceUserId",
        ofModelName: (User).toString()));

    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        key: UserBlock.BLOCKEDUSER,
        isRequired: true,
        targetName: "blockedUserId",
        ofModelName: (User).toString()));
  });
}

class _UserBlockModelType extends ModelType<UserBlock> {
  const _UserBlockModelType();

  @override
  UserBlock fromJson(Map<String, dynamic> jsonData) {
    return UserBlock.fromJson(jsonData);
  }
}
