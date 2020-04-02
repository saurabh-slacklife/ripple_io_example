class LinkResponseDto {
  String relation;
  String uri;
  String httpAction;
  String mimeType;

  LinkResponseDto({this.relation, this.uri, this.httpAction, this.mimeType});

  factory LinkResponseDto.fromJson(Map<String, dynamic> json) {
    return LinkResponseDto(
        relation: json['rel'],
        uri: json['uri'],
        httpAction: json['action'],
        mimeType: json['type']);
  }
}
