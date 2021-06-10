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
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the Comment type in your schema. */
@immutable
class Comment extends Model {
  static const classType = const _CommentModelType();
  final String id;
  final String text;
  final User author;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Comment._internal(
      {@required this.id, @required this.text, this.author});

  factory Comment({String id, @required String text, User author}) {
    return Comment._internal(
        id: id == null ? UUID.getUUID() : id, text: text, author: author);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Comment &&
        id == other.id &&
        text == other.text &&
        author == other.author;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Comment {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("text=" + "$text" + ", ");
    buffer.write("author=" + (author != null ? author.toString() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Comment copyWith({String id, String text, User author}) {
    return Comment(
        id: id ?? this.id,
        text: text ?? this.text,
        author: author ?? this.author);
  }

  Comment.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        text = json['text'],
        author = json['author'] != null
            ? User.fromJson(new Map<String, dynamic>.from(json['author']))
            : null;

  Map<String, dynamic> toJson() =>
      {'id': id, 'text': text, 'author': author?.toJson()};

  static final QueryField ID = QueryField(fieldName: "comment.id");
  static final QueryField TEXT = QueryField(fieldName: "text");
  static final QueryField AUTHOR = QueryField(
      fieldName: "author",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (User).toString()));
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Comment";
    modelSchemaDefinition.pluralName = "Comments";

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Comment.TEXT,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        key: Comment.AUTHOR,
        isRequired: false,
        targetName: "authorId",
        ofModelName: (User).toString()));
  });
}

class _CommentModelType extends ModelType<Comment> {
  const _CommentModelType();

  @override
  Comment fromJson(Map<String, dynamic> jsonData) {
    return Comment.fromJson(jsonData);
  }
}
