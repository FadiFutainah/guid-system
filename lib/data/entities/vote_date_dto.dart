import 'dart:convert';

class VoteDateDto {
  int voteValue;
  bool isMyVoteExist;
  VoteDateDto({
    required this.voteValue,
    required this.isMyVoteExist,
  });

  VoteDateDto copyWith({
    int? voteValue,
    bool? isMyVoteExist,
  }) {
    return VoteDateDto(
      voteValue: voteValue ?? this.voteValue,
      isMyVoteExist: isMyVoteExist ?? this.isMyVoteExist,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'voteValue': voteValue,
      'isMyVoteExist': isMyVoteExist,
    };
  }

  factory VoteDateDto.fromMap(Map<String, dynamic> map) {
    return VoteDateDto(
      voteValue: map['voteValue']?.toInt() ?? 0,
      isMyVoteExist: map['isMyVoteExist'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory VoteDateDto.fromJson(String source) =>
      VoteDateDto.fromMap(json.decode(source));

  @override
  String toString() =>
      'VoteDateDto(voteValue: $voteValue, isMyVoteExist: $isMyVoteExist)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VoteDateDto &&
        other.voteValue == voteValue &&
        other.isMyVoteExist == isMyVoteExist;
  }

  @override
  int get hashCode => voteValue.hashCode ^ isMyVoteExist.hashCode;
}
