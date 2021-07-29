class FirebaseUser {
  final String id;
  final String displayName;
  final String avatarUrl;
  final String role;
  final String email;
  final DateTime signUpDate;
  final DateTime lastLoginDate;
  final bool trackingPosition;
  final List<String> beliTokens;
  final List<String> dagangTokens;
  final String loginName;
  final Map<String, dynamic> permissions;
  final String phoneNumber;
  final List<String> kerjaTokens;

  FirebaseUser removeAvatarUrl() {
    return FirebaseUser(
        id: id,
        displayName: displayName,
        avatarUrl: null,
        role: role,
        email: email,
        signUpDate: signUpDate,
        lastLoginDate: lastLoginDate,
        trackingPosition: trackingPosition,
        phoneNumber: phoneNumber
    );
  }

  const FirebaseUser({
    this.id,
    this.displayName,
    this.loginName,
    this.avatarUrl,
    this.role,
    this.email,
    this.signUpDate,
    this.lastLoginDate,
    this.trackingPosition,
    this.beliTokens,
    this.dagangTokens,
    this.permissions,
    this.phoneNumber,
    this.kerjaTokens
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is FirebaseUser &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              displayName == other.displayName &&
              avatarUrl == other.avatarUrl &&
              role == other.role &&
              phoneNumber == other.phoneNumber &&
              email == other.email &&
              signUpDate == other.signUpDate &&
              lastLoginDate == other.lastLoginDate &&
              trackingPosition == other.trackingPosition);

  @override
  int get hashCode =>
      id.hashCode ^
      displayName.hashCode ^
      avatarUrl.hashCode ^
      role.hashCode ^
      email.hashCode ^
      signUpDate.hashCode ^
      lastLoginDate.hashCode ^
      trackingPosition.hashCode ^
      phoneNumber.hashCode;

  @override
  String toString() {
    return 'FirebaseUser{'
        ' id: $id,'
        ' displayName: $displayName,'
        ' avatarUrl: $avatarUrl,'
        ' role: $role,'
        ' email: $email,'
        ' signUpDate: $signUpDate,'
        ' lastLoginDate: $lastLoginDate,'
        ' trackingPosition: $trackingPosition,'
        ' phoneNumber: $phoneNumber,'
        '}';
  }

  FirebaseUser copyWith({
    String id,
    String displayName,
    String avatarUrl,
    String role,
    String email,
    DateTime signUpDate,
    DateTime lastLoginDate,
    List<String> beliTokens,
    List<String> dagangTokens,
    bool trackingPosition,
    Map<String, dynamic> permissions,
    String phoneNumber,
    List<String> kerjaTokens
  }) {
    return FirebaseUser(
        id: id ?? this.id,
        displayName: displayName ?? this.displayName,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        role: role ?? this.role,
        email: email ?? this.email,
        beliTokens: beliTokens ?? this.beliTokens,
        dagangTokens: dagangTokens ?? this.dagangTokens,
        signUpDate: signUpDate ?? this.signUpDate,
        lastLoginDate: lastLoginDate ?? this.lastLoginDate,
        trackingPosition: trackingPosition ?? this.trackingPosition,
        permissions: permissions ?? this.permissions,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        kerjaTokens: kerjaTokens ?? this.kerjaTokens
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'displayName': this.displayName,
      'avatarUrl': this.avatarUrl,
      'role': this.role,
      'email': this.email,
      'loginName': this.loginName,
      'signUpDate': this.signUpDate,
      'lastLoginDate': this.lastLoginDate,
      'trackingPosition': this.trackingPosition,
      'beliTokens': this.beliTokens,
      'dagangTokens': this.dagangTokens,
      'permissions': this.permissions,
      'phoneNumber': this.phoneNumber,
      'kerjaTokens': this.kerjaTokens
    };
  }

  factory FirebaseUser.fromMap(Map<String, dynamic> map) {
    List<String> beliTokens;
    if (map['beliTokens'] != null) {
      beliTokens = map['beliTokens'].cast<String>() as List<String>;
    }

    List<String> dagangTokens;
    if (map['dagangTokens'] != null) {
      dagangTokens = map['dagangTokens'].cast<String>() as List<String>;
    }

    List<String> kerjaTokens;
    if (map['kerjaTokens'] != null) {
      kerjaTokens = map['kerjaTokens'].cast<String>() as List<String>;
    }

    return FirebaseUser(
        displayName: map['displayName'] as String,
        avatarUrl: map['avatarUrl'] as String,
        role: map['role'] as String,
        email: map['email'] as String,
        loginName: map['loginName'] as String,
        signUpDate: (map['signUpDate'] is DateTime)
            ? map['signUpDate']
            : map['signUpDate']?.toDate(),
        lastLoginDate: (map['lastLoginDate'] is DateTime)
            ? map['lastLoginDate']
            : map['lastLoginDate']?.toDate(),
        trackingPosition: map['trackingPosition'] ?? false,
        beliTokens: beliTokens,
        dagangTokens: dagangTokens,
        permissions: map['permissions'],
        phoneNumber: map['phoneNumber'] as String,
        kerjaTokens: kerjaTokens
    );
  }
}
