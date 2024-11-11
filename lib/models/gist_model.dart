class GistFile {
  final String? filename;
  final String? type;
  final String? language;
  final String? rawUrl;
  final int size;

  GistFile({
    this.filename,
    this.type,
    this.language,
    this.rawUrl,
    required this.size,
  });

  factory GistFile.fromJson(Map<String, dynamic> json) {
    return GistFile(
      filename: json['filename'] as String?,
      type: json['type'] as String?,
      language: json['language'] as String?,
      rawUrl: json['raw_url'] as String?,
      size: json['size'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'filename': filename,
    'type': type,
    'language': language,
    'raw_url': rawUrl,
    'size': size,
  };
}

class GistOwner {
  final String? login;
  final int id;
  final String? nodeId;
  final String? avatarUrl;
  final String? gravatarId;
  final String? url;
  final String? htmlUrl;
  final String? followersUrl;
  final String? followingUrl;
  final String? gistsUrl;
  final String? starredUrl;
  final String? subscriptionsUrl;
  final String? organizationsUrl;
  final String? reposUrl;
  final String? eventsUrl;
  final String? receivedEventsUrl;
  final String? type;
  final bool siteAdmin;

  GistOwner({
    this.login,
    required this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    required this.siteAdmin,
  });

  factory GistOwner.fromJson(Map<String, dynamic> json) {
    return GistOwner(
      login: json['login'] as String?,
      id: json['id'] ?? 0,
      nodeId: json['node_id'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      gravatarId: json['gravatar_id'] as String?,
      url: json['url'] as String?,
      htmlUrl: json['html_url'] as String?,
      followersUrl: json['followers_url'] as String?,
      followingUrl: json['following_url'] as String?,
      gistsUrl: json['gists_url'] as String?,
      starredUrl: json['starred_url'] as String?,
      subscriptionsUrl: json['subscriptions_url'] as String?,
      organizationsUrl: json['organizations_url'] as String?,
      reposUrl: json['repos_url'] as String?,
      eventsUrl: json['events_url'] as String?,
      receivedEventsUrl: json['received_events_url'] as String?,
      type: json['type'] as String?,
      siteAdmin: json['site_admin'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    'login': login,
    'id': id,
    'node_id': nodeId,
    'avatar_url': avatarUrl,
    'gravatar_id': gravatarId,
    'url': url,
    'html_url': htmlUrl,
    'followers_url': followersUrl,
    'following_url': followingUrl,
    'gists_url': gistsUrl,
    'starred_url': starredUrl,
    'subscriptions_url': subscriptionsUrl,
    'organizations_url': organizationsUrl,
    'repos_url': reposUrl,
    'events_url': eventsUrl,
    'received_events_url': receivedEventsUrl,
    'type': type,
    'site_admin': siteAdmin,
  };
}

class Gist {
  final String url;
  final String forksUrl;
  final String commitsUrl;
  final String id;
  final String nodeId;
  final String gitPullUrl;
  final String gitPushUrl;
  final String htmlUrl;
  final List<GistFile>? files;
  final bool public;
  final String createdAt;
  final String updatedAt;
  final String? description;
  final int comments;
  final GistOwner? owner;
  final bool truncated;

  Gist({
    required this.url,
    required this.forksUrl,
    required this.commitsUrl,
    required this.id,
    required this.nodeId,
    required this.gitPullUrl,
    required this.gitPushUrl,
    required this.htmlUrl,
    required this.files,
    required this.public,
    required this.createdAt,
    required this.updatedAt,
    this.description,
    required this.comments,
    this.owner,
    required this.truncated,
  });

  factory Gist.fromJson(Map<String, dynamic> json) {
    return Gist(
      url: json['url'] ?? '',
      forksUrl: json['forks_url'] ?? '',
      commitsUrl: json['commits_url'] ?? '',
      id: json['id'] ?? '',
      nodeId: json['node_id'] ?? '',
      gitPullUrl: json['git_pull_url'] ?? '',
      gitPushUrl: json['git_push_url'] ?? '',
      htmlUrl: json['html_url'] ?? '',
      files: json['files'] != null
          ? (json['files'] as Map<String, dynamic>)
          .values
          .map((fileJson) => GistFile.fromJson(fileJson))
          .toList()
          : null,
      public: json['public'] ?? false,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      description: json['description'] ?? '',
      comments: json['comments'] ?? 0,
      owner: json['owner'] != null ? GistOwner.fromJson(json['owner']) : null,
      truncated: json['truncated'] ?? false,
    );
  }
}
