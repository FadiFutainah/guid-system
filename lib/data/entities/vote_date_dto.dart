import 'dart:convert';

class VoteDataDto {
  int voteValue;
  bool isMyVoteExist;
  VoteDataDto({
    required this.voteValue,
    required this.isMyVoteExist,
  });

  VoteDataDto copyWith({
    int? voteValue,
    bool? isMyVoteExist,
  }) {
    return VoteDataDto(
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

  factory VoteDataDto.fromMap(Map<String, dynamic> map) {
    return VoteDataDto(
      voteValue: map['voteValue']?.toInt() ?? 0,
      isMyVoteExist: map['isMyVoteExist'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory VoteDataDto.fromJson(String source) =>
      VoteDataDto.fromMap(json.decode(source));

  @override
  String toString() =>
      'VoteDateDto(voteValue: $voteValue, isMyVoteExist: $isMyVoteExist)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VoteDataDto &&
        other.voteValue == voteValue &&
        other.isMyVoteExist == isMyVoteExist;
  }

  @override
  int get hashCode => voteValue.hashCode ^ isMyVoteExist.hashCode;
}
