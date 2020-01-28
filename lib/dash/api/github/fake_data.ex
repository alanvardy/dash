defmodule Dash.Api.Github.FakeData do
  @moduledoc """
  Fake API data for development testing and Travis CI
  """

  @spec headers :: map
  def headers do
    %{
      "Access-Control-Allow-Origin" => "*",
      "Access-Control-Expose-Headers" =>
        "ETag, Link, Location, Retry-After, X-GitHub-OTP, X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset, X-OAuth-Scopes, X-Accepted-OAuth-Scopes, X-Poll-Interval, X-GitHub-Media-Type",
      "Cache-Control" => "private, max-age=60, s-maxage=60",
      "Content-Length" => "16639",
      "Content-Security-Policy" => "default-src 'none'",
      "Content-Type" => "application/json; charset=utf-8",
      "Date" => "Sat, 07 Sep 2019 02:57:52 GMT",
      "ETag" => "\"asdfsdfsdfsadfasdfsad\"",
      "Last-Modified" => "Fri, 06 Sep 2019 19:29:54 GMT",
      "Referrer-Policy" => "origin-when-cross-origin, strict-origin-when-cross-origin",
      "Server" => "GitHub.com",
      "Status" => "200 OK",
      "Strict-Transport-Security" => "max-age=31536000; includeSubdomains; preload",
      "Vary" => "Accept, Authorization, Cookie, X-GitHub-OTP",
      "X-Accepted-OAuth-Scopes" => "",
      "X-Content-Type-Options" => "nosniff",
      "X-Frame-Options" => "deny",
      "X-GitHub-Media-Type" => "github.v3; format=json",
      "X-GitHub-Request-Id" => "asdf:asdf:asdf:asdf:asdf",
      "X-OAuth-Scopes" =>
        "admin:org_hook, gist, notifications, read:discussion, read:org, read:packages, read:public_key, read:repo_hook, read:user, repo",
      "X-RateLimit-Limit" => "5000",
      "X-RateLimit-Remaining" => "4992",
      "X-RateLimit-Reset" => "1567828672",
      "X-XSS-Protection" => "1; mode=block"
    }
  end

  @spec generate(String.t()) :: [map]
  def generate(url) do
    case url do
      "issues" ->
        [
          %{
            "id" => 1,
            "node_id" => "MDU6SXNzdWUx",
            "url" => "https://api.github.com/repos/octocat/Hello-World/issues/1347",
            "repository_url" => "https://api.github.com/repos/octocat/Hello-World",
            "labels_url" =>
              "https://api.github.com/repos/octocat/Hello-World/issues/1347/labels{/name}",
            "comments_url" =>
              "https://api.github.com/repos/octocat/Hello-World/issues/1347/comments",
            "events_url" => "https://api.github.com/repos/octocat/Hello-World/issues/1347/events",
            "html_url" => "https://github.com/octocat/Hello-World/issues/1347",
            "number" => 1347,
            "state" => "open",
            "title" => "Found a bug",
            "body" => "I'm having a problem with this.",
            "user" => %{
              "login" => "octocat",
              "id" => 1,
              "node_id" => "MDQ6VXNlcjE=",
              "avatar_url" => "https://github.com/images/error/octocat_happy.gif",
              "gravatar_id" => "",
              "url" => "https://api.github.com/users/octocat",
              "html_url" => "https://github.com/octocat",
              "followers_url" => "https://api.github.com/users/octocat/followers",
              "following_url" => "https://api.github.com/users/octocat/following{/other_user}",
              "gists_url" => "https://api.github.com/users/octocat/gists{/gist_id}",
              "starred_url" => "https://api.github.com/users/octocat/starred{/owner}{/repo}",
              "subscriptions_url" => "https://api.github.com/users/octocat/subscriptions",
              "organizations_url" => "https://api.github.com/users/octocat/orgs",
              "repos_url" => "https://api.github.com/users/octocat/repos",
              "events_url" => "https://api.github.com/users/octocat/events{/privacy}",
              "received_events_url" => "https://api.github.com/users/octocat/received_events",
              "type" => "User",
              "site_admin" => false
            },
            "labels" => [
              %{
                "id" => 208_045_946,
                "node_id" => "MDU6TGFiZWwyMDgwNDU5NDY=",
                "url" => "https://api.github.com/repos/octocat/Hello-World/labels/bug",
                "name" => "bug",
                "description" => "Something isn't working",
                "color" => "f29513",
                "default" => true
              }
            ],
            "assignee" => %{
              "login" => "octocat",
              "id" => 1,
              "node_id" => "MDQ6VXNlcjE=",
              "avatar_url" => "https://github.com/images/error/octocat_happy.gif",
              "gravatar_id" => "",
              "url" => "https://api.github.com/users/octocat",
              "html_url" => "https://github.com/octocat",
              "followers_url" => "https://api.github.com/users/octocat/followers",
              "following_url" => "https://api.github.com/users/octocat/following{/other_user}",
              "gists_url" => "https://api.github.com/users/octocat/gists{/gist_id}",
              "starred_url" => "https://api.github.com/users/octocat/starred{/owner}{/repo}",
              "subscriptions_url" => "https://api.github.com/users/octocat/subscriptions",
              "organizations_url" => "https://api.github.com/users/octocat/orgs",
              "repos_url" => "https://api.github.com/users/octocat/repos",
              "events_url" => "https://api.github.com/users/octocat/events{/privacy}",
              "received_events_url" => "https://api.github.com/users/octocat/received_events",
              "type" => "User",
              "site_admin" => false
            },
            "assignees" => [
              %{
                "login" => "githubusername",
                "id" => 1,
                "node_id" => "MDQ6VXNlcjE=",
                "avatar_url" => "https://github.com/images/error/octocat_happy.gif",
                "gravatar_id" => "",
                "url" => "https://api.github.com/users/octocat",
                "html_url" => "https://github.com/octocat",
                "followers_url" => "https://api.github.com/users/octocat/followers",
                "following_url" => "https://api.github.com/users/octocat/following{/other_user}",
                "gists_url" => "https://api.github.com/users/octocat/gists{/gist_id}",
                "starred_url" => "https://api.github.com/users/octocat/starred{/owner}{/repo}",
                "subscriptions_url" => "https://api.github.com/users/octocat/subscriptions",
                "organizations_url" => "https://api.github.com/users/octocat/orgs",
                "repos_url" => "https://api.github.com/users/octocat/repos",
                "events_url" => "https://api.github.com/users/octocat/events{/privacy}",
                "received_events_url" => "https://api.github.com/users/octocat/received_events",
                "type" => "User",
                "site_admin" => false
              }
            ],
            "milestone" => %{
              "url" => "https://api.github.com/repos/octocat/Hello-World/milestones/1",
              "html_url" => "https://github.com/octocat/Hello-World/milestones/v1.0",
              "labels_url" =>
                "https://api.github.com/repos/octocat/Hello-World/milestones/1/labels",
              "id" => 1_002_604,
              "node_id" => "MDk6TWlsZXN0b25lMTAwMjYwNA==",
              "number" => 1,
              "state" => "open",
              "title" => "v1.0",
              "description" => "Tracking milestone for version 1.0",
              "creator" => %{
                "login" => "octocat",
                "id" => 1,
                "node_id" => "MDQ6VXNlcjE=",
                "avatar_url" => "https://github.com/images/error/octocat_happy.gif",
                "gravatar_id" => "",
                "url" => "https://api.github.com/users/octocat",
                "html_url" => "https://github.com/octocat",
                "followers_url" => "https://api.github.com/users/octocat/followers",
                "following_url" => "https://api.github.com/users/octocat/following{/other_user}",
                "gists_url" => "https://api.github.com/users/octocat/gists{/gist_id}",
                "starred_url" => "https://api.github.com/users/octocat/starred{/owner}{/repo}",
                "subscriptions_url" => "https://api.github.com/users/octocat/subscriptions",
                "organizations_url" => "https://api.github.com/users/octocat/orgs",
                "repos_url" => "https://api.github.com/users/octocat/repos",
                "events_url" => "https://api.github.com/users/octocat/events{/privacy}",
                "received_events_url" => "https://api.github.com/users/octocat/received_events",
                "type" => "User",
                "site_admin" => false
              },
              "open_issues" => 4,
              "closed_issues" => 8,
              "created_at" => "2011-04-10T20:09:31Z",
              "updated_at" => "2014-03-03T18:58:10Z",
              "closed_at" => "2013-02-12T13:22:01Z",
              "due_on" => "2012-10-09T23:39:01Z"
            },
            "locked" => true,
            "active_lock_reason" => "too heated",
            "comments" => 0,
            "pull_request" => %{
              "url" => "https://api.github.com/repos/octocat/Hello-World/pulls/1347",
              "html_url" => "https://github.com/octocat/Hello-World/pull/1347",
              "diff_url" => "https://github.com/octocat/Hello-World/pull/1347.diff",
              "patch_url" => "https://github.com/octocat/Hello-World/pull/1347.patch"
            },
            "closed_at" => nil,
            "created_at" => "2011-04-22T13:33:48Z",
            "updated_at" => "2011-04-22T13:33:48Z",
            "repository" => %{
              "id" => 1_296_269,
              "node_id" => "MDEwOlJlcG9zaXRvcnkxMjk2MjY5",
              "name" => "Hello-World",
              "full_name" => "octocat/Hello-World",
              "owner" => %{
                "login" => "octocat",
                "id" => 1,
                "node_id" => "MDQ6VXNlcjE=",
                "avatar_url" => "https://github.com/images/error/octocat_happy.gif",
                "gravatar_id" => "",
                "url" => "https://api.github.com/users/octocat",
                "html_url" => "https://github.com/octocat",
                "followers_url" => "https://api.github.com/users/octocat/followers",
                "following_url" => "https://api.github.com/users/octocat/following{/other_user}",
                "gists_url" => "https://api.github.com/users/octocat/gists{/gist_id}",
                "starred_url" => "https://api.github.com/users/octocat/starred{/owner}{/repo}",
                "subscriptions_url" => "https://api.github.com/users/octocat/subscriptions",
                "organizations_url" => "https://api.github.com/users/octocat/orgs",
                "repos_url" => "https://api.github.com/users/octocat/repos",
                "events_url" => "https://api.github.com/users/octocat/events{/privacy}",
                "received_events_url" => "https://api.github.com/users/octocat/received_events",
                "type" => "User",
                "site_admin" => false
              },
              "private" => false,
              "html_url" => "https://github.com/octocat/Hello-World",
              "description" => "This your first repo!",
              "fork" => false,
              "url" => "https://api.github.com/repos/octocat/Hello-World",
              "archive_url" =>
                "http://api.github.com/repos/octocat/Hello-World/{archive_format}{/ref}",
              "assignees_url" =>
                "http://api.github.com/repos/octocat/Hello-World/assignees{/user}",
              "blobs_url" => "http://api.github.com/repos/octocat/Hello-World/git/blobs{/sha}",
              "branches_url" =>
                "http://api.github.com/repos/octocat/Hello-World/branches{/branch}",
              "collaborators_url" =>
                "http://api.github.com/repos/octocat/Hello-World/collaborators{/collaborator}",
              "comments_url" =>
                "http://api.github.com/repos/octocat/Hello-World/comments{/number}",
              "commits_url" => "http://api.github.com/repos/octocat/Hello-World/commits{/sha}",
              "compare_url" =>
                "http://api.github.com/repos/octocat/Hello-World/compare/{base}...{head}",
              "contents_url" =>
                "http://api.github.com/repos/octocat/Hello-World/contents/{+path}",
              "contributors_url" =>
                "http://api.github.com/repos/octocat/Hello-World/contributors",
              "deployments_url" => "http://api.github.com/repos/octocat/Hello-World/deployments",
              "downloads_url" => "http://api.github.com/repos/octocat/Hello-World/downloads",
              "events_url" => "http://api.github.com/repos/octocat/Hello-World/events",
              "forks_url" => "http://api.github.com/repos/octocat/Hello-World/forks",
              "git_commits_url" =>
                "http://api.github.com/repos/octocat/Hello-World/git/commits{/sha}",
              "git_refs_url" => "http://api.github.com/repos/octocat/Hello-World/git/refs{/sha}",
              "git_tags_url" => "http://api.github.com/repos/octocat/Hello-World/git/tags{/sha}",
              "git_url" => "git:github.com/octocat/Hello-World.git",
              "issue_comment_url" =>
                "http://api.github.com/repos/octocat/Hello-World/issues/comments{/number}",
              "issue_events_url" =>
                "http://api.github.com/repos/octocat/Hello-World/issues/events{/number}",
              "issues_url" => "http://api.github.com/repos/octocat/Hello-World/issues{/number}",
              "keys_url" => "http://api.github.com/repos/octocat/Hello-World/keys{/key_id}",
              "labels_url" => "http://api.github.com/repos/octocat/Hello-World/labels{/name}",
              "languages_url" => "http://api.github.com/repos/octocat/Hello-World/languages",
              "merges_url" => "http://api.github.com/repos/octocat/Hello-World/merges",
              "milestones_url" =>
                "http://api.github.com/repos/octocat/Hello-World/milestones{/number}",
              "notifications_url" =>
                "http://api.github.com/repos/octocat/Hello-World/notifications{?since,all,participating}",
              "pulls_url" => "http://api.github.com/repos/octocat/Hello-World/pulls{/number}",
              "releases_url" => "http://api.github.com/repos/octocat/Hello-World/releases{/id}",
              "ssh_url" => "git@github.com:octocat/Hello-World.git",
              "stargazers_url" => "http://api.github.com/repos/octocat/Hello-World/stargazers",
              "statuses_url" => "http://api.github.com/repos/octocat/Hello-World/statuses/{sha}",
              "subscribers_url" => "http://api.github.com/repos/octocat/Hello-World/subscribers",
              "subscription_url" =>
                "http://api.github.com/repos/octocat/Hello-World/subscription",
              "tags_url" => "http://api.github.com/repos/octocat/Hello-World/tags",
              "teams_url" => "http://api.github.com/repos/octocat/Hello-World/teams",
              "trees_url" => "http://api.github.com/repos/octocat/Hello-World/git/trees{/sha}",
              "clone_url" => "https://github.com/octocat/Hello-World.git",
              "mirror_url" => "git:git.example.com/octocat/Hello-World",
              "hooks_url" => "http://api.github.com/repos/octocat/Hello-World/hooks",
              "svn_url" => "https://svn.github.com/octocat/Hello-World",
              "homepage" => "https://github.com",
              "language" => nil,
              "forks_count" => 9,
              "stargazers_count" => 80,
              "watchers_count" => 80,
              "size" => 108,
              "default_branch" => "master",
              "open_issues_count" => 0,
              "is_template" => true,
              "topics" => [
                "octocat",
                "atom",
                "electron",
                "api"
              ],
              "has_issues" => true,
              "has_projects" => true,
              "has_wiki" => true,
              "has_pages" => false,
              "has_downloads" => true,
              "archived" => false,
              "disabled" => false,
              "pushed_at" => "2011-01-26T19:06:43Z",
              "created_at" => "2011-01-26T19:01:12Z",
              "updated_at" => "2011-01-26T19:14:43Z",
              "permissions" => %{
                "admin" => false,
                "push" => false,
                "pull" => true
              },
              "allow_rebase_merge" => true,
              "template_repository" => nil,
              "allow_squash_merge" => true,
              "allow_merge_commit" => true,
              "subscribers_count" => 42,
              "network_count" => 0
            }
          }
        ]

      "user/repos" ->
        [
          %{
            "statuses_url" => "https://api.github.com/repos/alanvardy/airtableapi/statuses/{sha}",
            "git_refs_url" => "https://api.github.com/repos/alanvardy/airtableapi/git/refs{/sha}",
            "issue_comment_url" =>
              "https://api.github.com/repos/alanvardy/airtableapi/issues/comments{/number}",
            "watchers" => 0,
            "disabled" => false,
            "mirror_url" => nil,
            "languages_url" => "https://api.github.com/repos/alanvardy/airtableapi/languages",
            "stargazers_count" => 0,
            "license" => nil,
            "forks" => 0,
            "default_branch" => "master",
            "comments_url" =>
              "https://api.github.com/repos/alanvardy/airtableapi/comments{/number}",
            "commits_url" => "https://api.github.com/repos/alanvardy/airtableapi/commits{/sha}",
            "id" => 159_896_044,
            "clone_url" => "https://github.com/alanvardy/airtableapi.git",
            "homepage" => "https://airtableapi.vardy.codes/",
            "stargazers_url" => "https://api.github.com/repos/alanvardy/airtableapi/stargazers",
            "events_url" => "https://api.github.com/repos/alanvardy/airtableapi/events",
            "blobs_url" => "https://api.github.com/repos/alanvardy/airtableapi/git/blobs{/sha}",
            "forks_count" => 0,
            "pushed_at" => "2019-04-06T02:16:17Z",
            "git_url" => "git://github.com/alanvardy/airtableapi.git",
            "hooks_url" => "https://api.github.com/repos/alanvardy/airtableapi/hooks",
            "owner" => %{
              "avatar_url" => "https://avatars0.githubusercontent.com/u/38899847?v=4",
              "events_url" => "https://api.github.com/users/alanvardy/events{/privacy}",
              "followers_url" => "https://api.github.com/users/alanvardy/followers",
              "following_url" => "https://api.github.com/users/alanvardy/following{/other_user}",
              "gists_url" => "https://api.github.com/users/alanvardy/gists{/gist_id}",
              "gravatar_id" => "",
              "html_url" => "https://github.com/alanvardy",
              "id" => 38_899_847,
              "login" => "alanvardy",
              "node_id" => "MDQ6VXNlcjM4ODk5ODQ3",
              "organizations_url" => "https://api.github.com/users/alanvardy/orgs",
              "received_events_url" => "https://api.github.com/users/alanvardy/received_events",
              "repos_url" => "https://api.github.com/users/alanvardy/repos",
              "site_admin" => false,
              "starred_url" => "https://api.github.com/users/alanvardy/starred{/owner}{/repo}",
              "subscriptions_url" => "https://api.github.com/users/alanvardy/subscriptions",
              "type" => "User",
              "url" => "https://api.github.com/users/alanvardy"
            },
            "trees_url" => "https://api.github.com/repos/alanvardy/airtableapi/git/trees{/sha}",
            "git_commits_url" =>
              "https://api.github.com/repos/alanvardy/airtableapi/git/commits{/sha}",
            "collaborators_url" =>
              "https://api.github.com/repos/alanvardy/airtableapi/collaborators{/collaborator}",
            "watchers_count" => 0,
            "archived" => false,
            "tags_url" => "https://api.github.com/repos/alanvardy/airtableapi/tags",
            "merges_url" => "https://api.github.com/repos/alanvardy/airtableapi/merges",
            "releases_url" => "https://api.github.com/repos/alanvardy/airtableapi/releases{/id}",
            "subscribers_url" => "https://api.github.com/repos/alanvardy/airtableapi/subscribers",
            "ssh_url" => "git@github.com:alanvardy/airtableapi.git",
            "created_at" => "2018-12-01T01:11:06Z",
            "name" => "airtableapi",
            "has_issues" => true,
            "private" => false,
            "git_tags_url" => "https://api.github.com/repos/alanvardy/airtableapi/git/tags{/sha}",
            "has_projects" => true,
            "archive_url" =>
              "https://api.github.com/repos/alanvardy/airtableapi/{archive_format}{/ref}",
            "has_wiki" => true,
            "open_issues_count" => 0,
            "milestones_url" =>
              "https://api.github.com/repos/alanvardy/airtableapi/milestones{/number}",
            "forks_url" => "https://api.github.com/repos/alanvardy/airtableapi/forks",
            "url" => "https://api.github.com/repos/alanvardy/airtableapi",
            "downloads_url" => "https://api.github.com/repos/alanvardy/airtableapi/downloads",
            "open_issues" => 0,
            "keys_url" => "https://api.github.com/repos/alanvardy/airtableapi/keys{/key_id}",
            "description" =>
              "Demo app for read-only access of an Airtable Database, including user accounts and authentication",
            "contents_url" =>
              "https://api.github.com/repos/alanvardy/airtableapi/contents/{+path}",
            "language" => "Ruby",
            "permissions" => %{"admin" => true, "pull" => true, "push" => true},
            "contributors_url" =>
              "https://api.github.com/repos/alanvardy/airtableapi/contributors",
            "deployments_url" => "https://api.github.com/repos/alanvardy/airtableapi/deployments",
            "pulls_url" => "https://api.github.com/repos/alanvardy/airtableapi/pulls{/number}",
            "labels_url" => "https://api.github.com/repos/alanvardy/airtableapi/labels{/name}",
            "html_url" => "https://github.com/alanvardy/airtableapi",
            "svn_url" => "https://github.com/alanvardy/airtableapi",
            "issue_events_url" =>
              "https://api.github.com/repos/alanvardy/airtableapi/issues/events{/number}",
            "notifications_url" =>
              "https://api.github.com/repos/alanvardy/airtableapi/notifications{?since,all,participating}",
            "has_downloads" => true,
            "node_id" => "MDEwOlJlcG9zaXRvcnkxNTk4OTYwNDQ=",
            "compare_url" =>
              "https://api.github.com/repos/alanvardy/airtableapi/compare/{base}...{head}",
            "full_name" => "alanvardy/airtableapi",
            "subscription_url" =>
              "https://api.github.com/repos/alanvardy/airtableapi/subscription",
            "assignees_url" =>
              "https://api.github.com/repos/alanvardy/airtableapi/assignees{/user}",
            "issues_url" => "https://api.github.com/repos/alanvardy/airtableapi/issues{/number}",
            "size" => 161,
            "has_pages" => false,
            "fork" => false,
            "updated_at" => "2019-04-06T02:16:19Z",
            "branches_url" =>
              "https://api.github.com/repos/alanvardy/airtableapi/branches{/branch}",
            "teams_url" => "https://api.github.com/repos/alanvardy/airtableapi/teams"
          },
          %{
            "statuses_url" => "https://api.github.com/repos/alanvardy/alanvardy/statuses/{sha}",
            "git_refs_url" => "https://api.github.com/repos/alanvardy/alanvardy/git/refs{/sha}",
            "issue_comment_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy/issues/comments{/number}",
            "watchers" => 1,
            "disabled" => false,
            "mirror_url" => nil,
            "languages_url" => "https://api.github.com/repos/alanvardy/alanvardy/languages",
            "stargazers_count" => 1,
            "license" => nil,
            "forks" => 0,
            "default_branch" => "develop",
            "comments_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy/comments{/number}",
            "commits_url" => "https://api.github.com/repos/alanvardy/alanvardy/commits{/sha}",
            "id" => 146_116_411,
            "clone_url" => "https://github.com/alanvardy/alanvardy.git",
            "homepage" => "https://www.alanvardy.com/",
            "stargazers_url" => "https://api.github.com/repos/alanvardy/alanvardy/stargazers",
            "events_url" => "https://api.github.com/repos/alanvardy/alanvardy/events",
            "blobs_url" => "https://api.github.com/repos/alanvardy/alanvardy/git/blobs{/sha}",
            "forks_count" => 0,
            "pushed_at" => "2019-09-05T06:50:21Z",
            "git_url" => "git://github.com/alanvardy/alanvardy.git",
            "hooks_url" => "https://api.github.com/repos/alanvardy/alanvardy/hooks",
            "owner" => %{
              "avatar_url" => "https://avatars0.githubusercontent.com/u/38899847?v=4",
              "events_url" => "https://api.github.com/users/alanvardy/events{/privacy}",
              "followers_url" => "https://api.github.com/users/alanvardy/followers",
              "following_url" => "https://api.github.com/users/alanvardy/following{/other_user}",
              "gists_url" => "https://api.github.com/users/alanvardy/gists{/gist_id}",
              "gravatar_id" => "",
              "html_url" => "https://github.com/alanvardy",
              "id" => 38_899_847,
              "login" => "alanvardy",
              "node_id" => "MDQ6VXNlcjM4ODk5ODQ3",
              "organizations_url" => "https://api.github.com/users/alanvardy/orgs",
              "received_events_url" => "https://api.github.com/users/alanvardy/received_events",
              "repos_url" => "https://api.github.com/users/alanvardy/repos",
              "site_admin" => false,
              "starred_url" => "https://api.github.com/users/alanvardy/starred{/owner}{/repo}",
              "subscriptions_url" => "https://api.github.com/users/alanvardy/subscriptions",
              "type" => "User",
              "url" => "https://api.github.com/users/alanvardy"
            },
            "trees_url" => "https://api.github.com/repos/alanvardy/alanvardy/git/trees{/sha}",
            "git_commits_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy/git/commits{/sha}",
            "collaborators_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy/collaborators{/collaborator}",
            "watchers_count" => 1,
            "archived" => false,
            "tags_url" => "https://api.github.com/repos/alanvardy/alanvardy/tags",
            "merges_url" => "https://api.github.com/repos/alanvardy/alanvardy/merges",
            "releases_url" => "https://api.github.com/repos/alanvardy/alanvardy/releases{/id}",
            "subscribers_url" => "https://api.github.com/repos/alanvardy/alanvardy/subscribers",
            "ssh_url" => "git@github.com:alanvardy/alanvardy.git",
            "created_at" => "2018-08-25T17:38:48Z",
            "name" => "alanvardy",
            "has_issues" => true,
            "private" => false,
            "git_tags_url" => "https://api.github.com/repos/alanvardy/alanvardy/git/tags{/sha}",
            "has_projects" => true,
            "archive_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy/{archive_format}{/ref}",
            "has_wiki" => true,
            "open_issues_count" => 13,
            "milestones_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy/milestones{/number}",
            "forks_url" => "https://api.github.com/repos/alanvardy/alanvardy/forks",
            "url" => "https://api.github.com/repos/alanvardy/alanvardy",
            "downloads_url" => "https://api.github.com/repos/alanvardy/alanvardy/downloads",
            "open_issues" => 13,
            "keys_url" => "https://api.github.com/repos/alanvardy/alanvardy/keys{/key_id}",
            "description" => "Personal Website",
            "contents_url" => "https://api.github.com/repos/alanvardy/alanvardy/contents/{+path}",
            "language" => "Ruby",
            "permissions" => %{"admin" => true, "pull" => true, "push" => true},
            "contributors_url" => "https://api.github.com/repos/alanvardy/alanvardy/contributors",
            "deployments_url" => "https://api.github.com/repos/alanvardy/alanvardy/deployments",
            "pulls_url" => "https://api.github.com/repos/alanvardy/alanvardy/pulls{/number}",
            "labels_url" => "https://api.github.com/repos/alanvardy/alanvardy/labels{/name}",
            "html_url" => "https://github.com/alanvardy/alanvardy",
            "svn_url" => "https://github.com/alanvardy/alanvardy",
            "issue_events_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy/issues/events{/number}",
            "notifications_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy/notifications{?since,all,participating}",
            "has_downloads" => true,
            "node_id" => "MDEwOlJlcG9zaXRvcnkxNDYxMTY0MTE=",
            "compare_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy/compare/{base}...{head}",
            "full_name" => "alanvardy/alanvardy",
            "subscription_url" => "https://api.github.com/repos/alanvardy/alanvardy/subscription",
            "assignees_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy/assignees{/user}",
            "issues_url" => "https://api.github.com/repos/alanvardy/alanvardy/issues{/number}",
            "size" => 25_773,
            "has_pages" => false,
            "fork" => false,
            "updated_at" => "2019-09-05T01:14:30Z",
            "branches_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy/branches{/branch}",
            "teams_url" => "https://api.github.com/repos/alanvardy/alanvardy/teams"
          },
          %{
            "statuses_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy.github.io/statuses/{sha}",
            "git_refs_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy.github.io/git/refs{/sha}",
            "issue_comment_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy.github.io/issues/comments{/number}",
            "watchers" => 0,
            "disabled" => false,
            "mirror_url" => nil,
            "languages_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy.github.io/languages",
            "stargazers_count" => 0,
            "license" => nil,
            "forks" => 0,
            "default_branch" => "master",
            "comments_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy.github.io/comments{/number}",
            "commits_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy.github.io/commits{/sha}",
            "id" => 153_354_960,
            "clone_url" => "https://github.com/alanvardy/alanvardy.github.io.git",
            "homepage" => nil,
            "stargazers_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy.github.io/stargazers",
            "events_url" => "https://api.github.com/repos/alanvardy/alanvardy.github.io/events",
            "blobs_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy.github.io/git/blobs{/sha}",
            "forks_count" => 0,
            "pushed_at" => "2018-10-16T21:39:12Z",
            "git_url" => "git://github.com/alanvardy/alanvardy.github.io.git",
            "hooks_url" => "https://api.github.com/repos/alanvardy/alanvardy.github.io/hooks",
            "owner" => %{
              "avatar_url" => "https://avatars0.githubusercontent.com/u/38899847?v=4",
              "events_url" => "https://api.github.com/users/alanvardy/events{/privacy}",
              "followers_url" => "https://api.github.com/users/alanvardy/followers",
              "following_url" => "https://api.github.com/users/alanvardy/following{/other_user}",
              "gists_url" => "https://api.github.com/users/alanvardy/gists{/gist_id}",
              "gravatar_id" => "",
              "html_url" => "https://github.com/alanvardy",
              "id" => 38_899_847,
              "login" => "alanvardy",
              "node_id" => "MDQ6VXNlcjM4ODk5ODQ3",
              "organizations_url" => "https://api.github.com/users/alanvardy/orgs",
              "received_events_url" => "https://api.github.com/users/alanvardy/received_events",
              "repos_url" => "https://api.github.com/users/alanvardy/repos",
              "site_admin" => false,
              "starred_url" => "https://api.github.com/users/alanvardy/starred{/owner}{/repo}",
              "subscriptions_url" => "https://api.github.com/users/alanvardy/subscriptions",
              "type" => "User",
              "url" => "https://api.github.com/users/alanvardy"
            },
            "trees_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy.github.io/git/trees{/sha}",
            "git_commits_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy.github.io/git/commits{/sha}",
            "collaborators_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy.github.io/collaborators{/collaborator}",
            "watchers_count" => 0,
            "archived" => false,
            "tags_url" => "https://api.github.com/repos/alanvardy/alanvardy.github.io/tags",
            "merges_url" => "https://api.github.com/repos/alanvardy/alanvardy.github.io/merges",
            "releases_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy.github.io/releases{/id}",
            "subscribers_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy.github.io/subscribers",
            "ssh_url" => "git@github.com:alanvardy/alanvardy.github.io.git",
            "created_at" => "2018-10-16T21:13:14Z",
            "name" => "alanvardy.github.io",
            "has_issues" => true,
            "private" => false,
            "git_tags_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy.github.io/git/tags{/sha}",
            "has_projects" => true,
            "archive_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy.github.io/{archive_format}{/ref}",
            "has_wiki" => true,
            "open_issues_count" => 0,
            "milestones_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy.github.io/milestones{/number}",
            "forks_url" => "https://api.github.com/repos/alanvardy/alanvardy.github.io/forks",
            "url" => "https://api.github.com/repos/alanvardy/alanvardy.github.io",
            "downloads_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy.github.io/downloads",
            "open_issues" => 0,
            "keys_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy.github.io/keys{/key_id}",
            "description" => nil,
            "contents_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy.github.io/contents/{+path}",
            "language" => "HTML",
            "permissions" => %{"admin" => true, "pull" => true, "push" => true},
            "contributors_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy.github.io/contributors",
            "deployments_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy.github.io/deployments",
            "pulls_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy.github.io/pulls{/number}",
            "labels_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy.github.io/labels{/name}",
            "html_url" => "https://github.com/alanvardy/alanvardy.github.io",
            "svn_url" => "https://github.com/alanvardy/alanvardy.github.io",
            "issue_events_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy.github.io/issues/events{/number}",
            "notifications_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy.github.io/notifications{?since,all,participating}",
            "has_downloads" => true,
            "node_id" => "MDEwOlJlcG9zaXRvcnkxNTMzNTQ5NjA=",
            "compare_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy.github.io/compare/{base}...{head}",
            "full_name" => "alanvardy/alanvardy.github.io",
            "subscription_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy.github.io/subscription",
            "assignees_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy.github.io/assignees{/user}",
            "issues_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy.github.io/issues{/number}",
            "size" => 7,
            "has_pages" => true,
            "fork" => false,
            "updated_at" => "2018-10-16T21:39:13Z",
            "branches_url" =>
              "https://api.github.com/repos/alanvardy/alanvardy.github.io/branches{/branch}",
            "teams_url" => "https://api.github.com/repos/alanvardy/alanvardy.github.io/teams"
          }
        ]

      "repos/" <> _ ->
        %{
          "url" => "https://api.github.com/repos/octocat/Hello-World/pulls/1347",
          "id" => 1,
          "node_id" => "MDExOlB1bGxSZXF1ZXN0MQ==",
          "html_url" => "https://github.com/octocat/Hello-World/pull/1347",
          "diff_url" => "https://github.com/octocat/Hello-World/pull/1347.diff",
          "patch_url" => "https://github.com/octocat/Hello-World/pull/1347.patch",
          "issue_url" => "https://api.github.com/repos/octocat/Hello-World/issues/1347",
          "commits_url" => "https://api.github.com/repos/octocat/Hello-World/pulls/1347/commits",
          "review_comments_url" =>
            "https://api.github.com/repos/octocat/Hello-World/pulls/1347/comments",
          "review_comment_url" =>
            "https://api.github.com/repos/octocat/Hello-World/pulls/comments{/number}",
          "comments_url" =>
            "https://api.github.com/repos/octocat/Hello-World/issues/1347/comments",
          "statuses_url" =>
            "https://api.github.com/repos/octocat/Hello-World/statuses/6dcb09b5b57875f334f61aebed695e2e4193db5e",
          "number" => 1347,
          "state" => "open",
          "locked" => true,
          "title" => "new-feature",
          "user" => %{
            "login" => "octocat",
            "id" => 1,
            "node_id" => "MDQ6VXNlcjE=",
            "avatar_url" => "https://github.com/images/error/octocat_happy.gif",
            "gravatar_id" => "",
            "url" => "https://api.github.com/users/octocat",
            "html_url" => "https://github.com/octocat",
            "followers_url" => "https://api.github.com/users/octocat/followers",
            "following_url" => "https://api.github.com/users/octocat/following{/other_user}",
            "gists_url" => "https://api.github.com/users/octocat/gists{/gist_id}",
            "starred_url" => "https://api.github.com/users/octocat/starred{/owner}{/repo}",
            "subscriptions_url" => "https://api.github.com/users/octocat/subscriptions",
            "organizations_url" => "https://api.github.com/users/octocat/orgs",
            "repos_url" => "https://api.github.com/users/octocat/repos",
            "events_url" => "https://api.github.com/users/octocat/events{/privacy}",
            "received_events_url" => "https://api.github.com/users/octocat/received_events",
            "type" => "User",
            "site_admin" => false
          },
          "body" => "Please pull these awesome changes",
          "labels" => [
            %{
              "id" => 208_045_946,
              "node_id" => "MDU6TGFiZWwyMDgwNDU5NDY=",
              "url" => "https://api.github.com/repos/octocat/Hello-World/labels/bug",
              "name" => "bug",
              "description" => "Something isn't working",
              "color" => "f29513",
              "default" => true
            }
          ],
          "milestone" => %{
            "url" => "https://api.github.com/repos/octocat/Hello-World/milestones/1",
            "html_url" => "https://github.com/octocat/Hello-World/milestones/v1.0",
            "labels_url" =>
              "https://api.github.com/repos/octocat/Hello-World/milestones/1/labels",
            "id" => 1_002_604,
            "node_id" => "MDk6TWlsZXN0b25lMTAwMjYwNA==",
            "number" => 1,
            "state" => "open",
            "title" => "v1.0",
            "description" => "Tracking milestone for version 1.0",
            "creator" => %{
              "login" => "octocat",
              "id" => 1,
              "node_id" => "MDQ6VXNlcjE=",
              "avatar_url" => "https://github.com/images/error/octocat_happy.gif",
              "gravatar_id" => "",
              "url" => "https://api.github.com/users/octocat",
              "html_url" => "https://github.com/octocat",
              "followers_url" => "https://api.github.com/users/octocat/followers",
              "following_url" => "https://api.github.com/users/octocat/following{/other_user}",
              "gists_url" => "https://api.github.com/users/octocat/gists{/gist_id}",
              "starred_url" => "https://api.github.com/users/octocat/starred{/owner}{/repo}",
              "subscriptions_url" => "https://api.github.com/users/octocat/subscriptions",
              "organizations_url" => "https://api.github.com/users/octocat/orgs",
              "repos_url" => "https://api.github.com/users/octocat/repos",
              "events_url" => "https://api.github.com/users/octocat/events{/privacy}",
              "received_events_url" => "https://api.github.com/users/octocat/received_events",
              "type" => "User",
              "site_admin" => false
            },
            "open_issues" => 4,
            "closed_issues" => 8,
            "created_at" => "2011-04-10T20:09:31Z",
            "updated_at" => "2014-03-03T18:58:10Z",
            "closed_at" => "2013-02-12T13:22:01Z",
            "due_on" => "2012-10-09T23:39:01Z"
          },
          "active_lock_reason" => "too heated",
          "created_at" => "2011-01-26T19:01:12Z",
          "updated_at" => "2011-01-26T19:01:12Z",
          "closed_at" => "2011-01-26T19:01:12Z",
          "merged_at" => "2011-01-26T19:01:12Z",
          "merge_commit_sha" => "e5bd3914e2e596debea16f433f57875b5b90bcd6",
          "assignee" => %{
            "login" => "githubusername",
            "id" => 1,
            "node_id" => "MDQ6VXNlcjE=",
            "avatar_url" => "https://github.com/images/error/octocat_happy.gif",
            "gravatar_id" => "",
            "url" => "https://api.github.com/users/octocat",
            "html_url" => "https://github.com/octocat",
            "followers_url" => "https://api.github.com/users/octocat/followers",
            "following_url" => "https://api.github.com/users/octocat/following{/other_user}",
            "gists_url" => "https://api.github.com/users/octocat/gists{/gist_id}",
            "starred_url" => "https://api.github.com/users/octocat/starred{/owner}{/repo}",
            "subscriptions_url" => "https://api.github.com/users/octocat/subscriptions",
            "organizations_url" => "https://api.github.com/users/octocat/orgs",
            "repos_url" => "https://api.github.com/users/octocat/repos",
            "events_url" => "https://api.github.com/users/octocat/events{/privacy}",
            "received_events_url" => "https://api.github.com/users/octocat/received_events",
            "type" => "User",
            "site_admin" => false
          },
          "assignees" => [
            %{
              "login" => "octocat",
              "id" => 1,
              "node_id" => "MDQ6VXNlcjE=",
              "avatar_url" => "https://github.com/images/error/octocat_happy.gif",
              "gravatar_id" => "",
              "url" => "https://api.github.com/users/octocat",
              "html_url" => "https://github.com/octocat",
              "followers_url" => "https://api.github.com/users/octocat/followers",
              "following_url" => "https://api.github.com/users/octocat/following{/other_user}",
              "gists_url" => "https://api.github.com/users/octocat/gists{/gist_id}",
              "starred_url" => "https://api.github.com/users/octocat/starred{/owner}{/repo}",
              "subscriptions_url" => "https://api.github.com/users/octocat/subscriptions",
              "organizations_url" => "https://api.github.com/users/octocat/orgs",
              "repos_url" => "https://api.github.com/users/octocat/repos",
              "events_url" => "https://api.github.com/users/octocat/events{/privacy}",
              "received_events_url" => "https://api.github.com/users/octocat/received_events",
              "type" => "User",
              "site_admin" => false
            },
            %{
              "login" => "githubusername",
              "id" => 1,
              "node_id" => "MDQ6VXNlcjE=",
              "avatar_url" => "https://github.com/images/error/hubot_happy.gif",
              "gravatar_id" => "",
              "url" => "https://api.github.com/users/hubot",
              "html_url" => "https://github.com/hubot",
              "followers_url" => "https://api.github.com/users/hubot/followers",
              "following_url" => "https://api.github.com/users/hubot/following{/other_user}",
              "gists_url" => "https://api.github.com/users/hubot/gists{/gist_id}",
              "starred_url" => "https://api.github.com/users/hubot/starred{/owner}{/repo}",
              "subscriptions_url" => "https://api.github.com/users/hubot/subscriptions",
              "organizations_url" => "https://api.github.com/users/hubot/orgs",
              "repos_url" => "https://api.github.com/users/hubot/repos",
              "events_url" => "https://api.github.com/users/hubot/events{/privacy}",
              "received_events_url" => "https://api.github.com/users/hubot/received_events",
              "type" => "User",
              "site_admin" => true
            }
          ],
          "requested_reviewers" => [
            %{
              "login" => "githubusername",
              "id" => 1,
              "node_id" => "MDQ6VXNlcjE=",
              "avatar_url" => "https://github.com/images/error/other_user_happy.gif",
              "gravatar_id" => "",
              "url" => "https://api.github.com/users/other_user",
              "html_url" => "https://github.com/other_user",
              "followers_url" => "https://api.github.com/users/other_user/followers",
              "following_url" => "https://api.github.com/users/other_user/following{/other_user}",
              "gists_url" => "https://api.github.com/users/other_user/gists{/gist_id}",
              "starred_url" => "https://api.github.com/users/other_user/starred{/owner}{/repo}",
              "subscriptions_url" => "https://api.github.com/users/other_user/subscriptions",
              "organizations_url" => "https://api.github.com/users/other_user/orgs",
              "repos_url" => "https://api.github.com/users/other_user/repos",
              "events_url" => "https://api.github.com/users/other_user/events{/privacy}",
              "received_events_url" => "https://api.github.com/users/other_user/received_events",
              "type" => "User",
              "site_admin" => false
            }
          ],
          "requested_teams" => [
            %{
              "id" => 1,
              "node_id" => "MDQ6VGVhbTE=",
              "url" => "https://api.github.com/teams/1",
              "html_url" => "https://api.github.com/teams/justice-league",
              "name" => "Justice League",
              "slug" => "justice-league",
              "description" => "A great team.",
              "privacy" => "closed",
              "permission" => "admin",
              "members_url" => "https://api.github.com/teams/1/members{/member}",
              "repositories_url" => "https://api.github.com/teams/1/repos",
              "parent" => nil
            }
          ],
          "head" => %{
            "label" => "octocat:new-topic",
            "ref" => "new-topic",
            "sha" => "6dcb09b5b57875f334f61aebed695e2e4193db5e",
            "user" => %{
              "login" => "octocat",
              "id" => 1,
              "node_id" => "MDQ6VXNlcjE=",
              "avatar_url" => "https://github.com/images/error/octocat_happy.gif",
              "gravatar_id" => "",
              "url" => "https://api.github.com/users/octocat",
              "html_url" => "https://github.com/octocat",
              "followers_url" => "https://api.github.com/users/octocat/followers",
              "following_url" => "https://api.github.com/users/octocat/following{/other_user}",
              "gists_url" => "https://api.github.com/users/octocat/gists{/gist_id}",
              "starred_url" => "https://api.github.com/users/octocat/starred{/owner}{/repo}",
              "subscriptions_url" => "https://api.github.com/users/octocat/subscriptions",
              "organizations_url" => "https://api.github.com/users/octocat/orgs",
              "repos_url" => "https://api.github.com/users/octocat/repos",
              "events_url" => "https://api.github.com/users/octocat/events{/privacy}",
              "received_events_url" => "https://api.github.com/users/octocat/received_events",
              "type" => "User",
              "site_admin" => false
            },
            "repo" => %{
              "id" => 1_296_269,
              "node_id" => "MDEwOlJlcG9zaXRvcnkxMjk2MjY5",
              "name" => "Hello-World",
              "full_name" => "octocat/Hello-World",
              "owner" => %{
                "login" => "octocat",
                "id" => 1,
                "node_id" => "MDQ6VXNlcjE=",
                "avatar_url" => "https://github.com/images/error/octocat_happy.gif",
                "gravatar_id" => "",
                "url" => "https://api.github.com/users/octocat",
                "html_url" => "https://github.com/octocat",
                "followers_url" => "https://api.github.com/users/octocat/followers",
                "following_url" => "https://api.github.com/users/octocat/following{/other_user}",
                "gists_url" => "https://api.github.com/users/octocat/gists{/gist_id}",
                "starred_url" => "https://api.github.com/users/octocat/starred{/owner}{/repo}",
                "subscriptions_url" => "https://api.github.com/users/octocat/subscriptions",
                "organizations_url" => "https://api.github.com/users/octocat/orgs",
                "repos_url" => "https://api.github.com/users/octocat/repos",
                "events_url" => "https://api.github.com/users/octocat/events{/privacy}",
                "received_events_url" => "https://api.github.com/users/octocat/received_events",
                "type" => "User",
                "site_admin" => false
              },
              "private" => false,
              "html_url" => "https://github.com/octocat/Hello-World",
              "description" => "This your first repo!",
              "fork" => false,
              "url" => "https://api.github.com/repos/octocat/Hello-World",
              "archive_url" =>
                "http://api.github.com/repos/octocat/Hello-World/{archive_format}{/ref}",
              "assignees_url" =>
                "http://api.github.com/repos/octocat/Hello-World/assignees{/user}",
              "blobs_url" => "http://api.github.com/repos/octocat/Hello-World/git/blobs{/sha}",
              "branches_url" =>
                "http://api.github.com/repos/octocat/Hello-World/branches{/branch}",
              "collaborators_url" =>
                "http://api.github.com/repos/octocat/Hello-World/collaborators{/collaborator}",
              "comments_url" =>
                "http://api.github.com/repos/octocat/Hello-World/comments{/number}",
              "commits_url" => "http://api.github.com/repos/octocat/Hello-World/commits{/sha}",
              "compare_url" =>
                "http://api.github.com/repos/octocat/Hello-World/compare/{base}...{head}",
              "contents_url" =>
                "http://api.github.com/repos/octocat/Hello-World/contents/{+path}",
              "contributors_url" =>
                "http://api.github.com/repos/octocat/Hello-World/contributors",
              "deployments_url" => "http://api.github.com/repos/octocat/Hello-World/deployments",
              "downloads_url" => "http://api.github.com/repos/octocat/Hello-World/downloads",
              "events_url" => "http://api.github.com/repos/octocat/Hello-World/events",
              "forks_url" => "http://api.github.com/repos/octocat/Hello-World/forks",
              "git_commits_url" =>
                "http://api.github.com/repos/octocat/Hello-World/git/commits{/sha}",
              "git_refs_url" => "http://api.github.com/repos/octocat/Hello-World/git/refs{/sha}",
              "git_tags_url" => "http://api.github.com/repos/octocat/Hello-World/git/tags{/sha}",
              "git_url" => "git:github.com/octocat/Hello-World.git",
              "issue_comment_url" =>
                "http://api.github.com/repos/octocat/Hello-World/issues/comments{/number}",
              "issue_events_url" =>
                "http://api.github.com/repos/octocat/Hello-World/issues/events{/number}",
              "issues_url" => "http://api.github.com/repos/octocat/Hello-World/issues{/number}",
              "keys_url" => "http://api.github.com/repos/octocat/Hello-World/keys{/key_id}",
              "labels_url" => "http://api.github.com/repos/octocat/Hello-World/labels{/name}",
              "languages_url" => "http://api.github.com/repos/octocat/Hello-World/languages",
              "merges_url" => "http://api.github.com/repos/octocat/Hello-World/merges",
              "milestones_url" =>
                "http://api.github.com/repos/octocat/Hello-World/milestones{/number}",
              "notifications_url" =>
                "http://api.github.com/repos/octocat/Hello-World/notifications{?since,all,participating}",
              "pulls_url" => "http://api.github.com/repos/octocat/Hello-World/pulls{/number}",
              "releases_url" => "http://api.github.com/repos/octocat/Hello-World/releases{/id}",
              "ssh_url" => "git@github.com:octocat/Hello-World.git",
              "stargazers_url" => "http://api.github.com/repos/octocat/Hello-World/stargazers",
              "statuses_url" => "http://api.github.com/repos/octocat/Hello-World/statuses/{sha}",
              "subscribers_url" => "http://api.github.com/repos/octocat/Hello-World/subscribers",
              "subscription_url" =>
                "http://api.github.com/repos/octocat/Hello-World/subscription",
              "tags_url" => "http://api.github.com/repos/octocat/Hello-World/tags",
              "teams_url" => "http://api.github.com/repos/octocat/Hello-World/teams",
              "trees_url" => "http://api.github.com/repos/octocat/Hello-World/git/trees{/sha}",
              "clone_url" => "https://github.com/octocat/Hello-World.git",
              "mirror_url" => "git:git.example.com/octocat/Hello-World",
              "hooks_url" => "http://api.github.com/repos/octocat/Hello-World/hooks",
              "svn_url" => "https://svn.github.com/octocat/Hello-World",
              "homepage" => "https://github.com",
              "language" => nil,
              "forks_count" => 9,
              "stargazers_count" => 80,
              "watchers_count" => 80,
              "size" => 108,
              "default_branch" => "master",
              "open_issues_count" => 0,
              "is_template" => true,
              "topics" => [
                "octocat",
                "atom",
                "electron",
                "api"
              ],
              "has_issues" => true,
              "has_projects" => true,
              "has_wiki" => true,
              "has_pages" => false,
              "has_downloads" => true,
              "archived" => false,
              "disabled" => false,
              "pushed_at" => "2011-01-26T19:06:43Z",
              "created_at" => "2011-01-26T19:01:12Z",
              "updated_at" => "2011-01-26T19:14:43Z",
              "permissions" => %{
                "admin" => false,
                "push" => false,
                "pull" => true
              },
              "allow_rebase_merge" => true,
              "template_repository" => nil,
              "allow_squash_merge" => true,
              "allow_merge_commit" => true,
              "subscribers_count" => 42,
              "network_count" => 0
            }
          },
          "base" => %{
            "label" => "octocat:master",
            "ref" => "master",
            "sha" => "6dcb09b5b57875f334f61aebed695e2e4193db5e",
            "user" => %{
              "login" => "octocat",
              "id" => 1,
              "node_id" => "MDQ6VXNlcjE=",
              "avatar_url" => "https://github.com/images/error/octocat_happy.gif",
              "gravatar_id" => "",
              "url" => "https://api.github.com/users/octocat",
              "html_url" => "https://github.com/octocat",
              "followers_url" => "https://api.github.com/users/octocat/followers",
              "following_url" => "https://api.github.com/users/octocat/following{/other_user}",
              "gists_url" => "https://api.github.com/users/octocat/gists{/gist_id}",
              "starred_url" => "https://api.github.com/users/octocat/starred{/owner}{/repo}",
              "subscriptions_url" => "https://api.github.com/users/octocat/subscriptions",
              "organizations_url" => "https://api.github.com/users/octocat/orgs",
              "repos_url" => "https://api.github.com/users/octocat/repos",
              "events_url" => "https://api.github.com/users/octocat/events{/privacy}",
              "received_events_url" => "https://api.github.com/users/octocat/received_events",
              "type" => "User",
              "site_admin" => false
            },
            "repo" => %{
              "id" => 1_296_269,
              "node_id" => "MDEwOlJlcG9zaXRvcnkxMjk2MjY5",
              "name" => "Hello-World",
              "full_name" => "octocat/Hello-World",
              "owner" => %{
                "login" => "octocat",
                "id" => 1,
                "node_id" => "MDQ6VXNlcjE=",
                "avatar_url" => "https://github.com/images/error/octocat_happy.gif",
                "gravatar_id" => "",
                "url" => "https://api.github.com/users/octocat",
                "html_url" => "https://github.com/octocat",
                "followers_url" => "https://api.github.com/users/octocat/followers",
                "following_url" => "https://api.github.com/users/octocat/following{/other_user}",
                "gists_url" => "https://api.github.com/users/octocat/gists{/gist_id}",
                "starred_url" => "https://api.github.com/users/octocat/starred{/owner}{/repo}",
                "subscriptions_url" => "https://api.github.com/users/octocat/subscriptions",
                "organizations_url" => "https://api.github.com/users/octocat/orgs",
                "repos_url" => "https://api.github.com/users/octocat/repos",
                "events_url" => "https://api.github.com/users/octocat/events{/privacy}",
                "received_events_url" => "https://api.github.com/users/octocat/received_events",
                "type" => "User",
                "site_admin" => false
              },
              "private" => false,
              "html_url" => "https://github.com/octocat/Hello-World",
              "description" => "This your first repo!",
              "fork" => false,
              "url" => "https://api.github.com/repos/octocat/Hello-World",
              "archive_url" =>
                "http://api.github.com/repos/octocat/Hello-World/{archive_format}{/ref}",
              "assignees_url" =>
                "http://api.github.com/repos/octocat/Hello-World/assignees{/user}",
              "blobs_url" => "http://api.github.com/repos/octocat/Hello-World/git/blobs{/sha}",
              "branches_url" =>
                "http://api.github.com/repos/octocat/Hello-World/branches{/branch}",
              "collaborators_url" =>
                "http://api.github.com/repos/octocat/Hello-World/collaborators{/collaborator}",
              "comments_url" =>
                "http://api.github.com/repos/octocat/Hello-World/comments{/number}",
              "commits_url" => "http://api.github.com/repos/octocat/Hello-World/commits{/sha}",
              "compare_url" =>
                "http://api.github.com/repos/octocat/Hello-World/compare/{base}...{head}",
              "contents_url" =>
                "http://api.github.com/repos/octocat/Hello-World/contents/{+path}",
              "contributors_url" =>
                "http://api.github.com/repos/octocat/Hello-World/contributors",
              "deployments_url" => "http://api.github.com/repos/octocat/Hello-World/deployments",
              "downloads_url" => "http://api.github.com/repos/octocat/Hello-World/downloads",
              "events_url" => "http://api.github.com/repos/octocat/Hello-World/events",
              "forks_url" => "http://api.github.com/repos/octocat/Hello-World/forks",
              "git_commits_url" =>
                "http://api.github.com/repos/octocat/Hello-World/git/commits{/sha}",
              "git_refs_url" => "http://api.github.com/repos/octocat/Hello-World/git/refs{/sha}",
              "git_tags_url" => "http://api.github.com/repos/octocat/Hello-World/git/tags{/sha}",
              "git_url" => "git:github.com/octocat/Hello-World.git",
              "issue_comment_url" =>
                "http://api.github.com/repos/octocat/Hello-World/issues/comments{/number}",
              "issue_events_url" =>
                "http://api.github.com/repos/octocat/Hello-World/issues/events{/number}",
              "issues_url" => "http://api.github.com/repos/octocat/Hello-World/issues{/number}",
              "keys_url" => "http://api.github.com/repos/octocat/Hello-World/keys{/key_id}",
              "labels_url" => "http://api.github.com/repos/octocat/Hello-World/labels{/name}",
              "languages_url" => "http://api.github.com/repos/octocat/Hello-World/languages",
              "merges_url" => "http://api.github.com/repos/octocat/Hello-World/merges",
              "milestones_url" =>
                "http://api.github.com/repos/octocat/Hello-World/milestones{/number}",
              "notifications_url" =>
                "http://api.github.com/repos/octocat/Hello-World/notifications{?since,all,participating}",
              "pulls_url" => "http://api.github.com/repos/octocat/Hello-World/pulls{/number}",
              "releases_url" => "http://api.github.com/repos/octocat/Hello-World/releases{/id}",
              "ssh_url" => "git@github.com:octocat/Hello-World.git",
              "stargazers_url" => "http://api.github.com/repos/octocat/Hello-World/stargazers",
              "statuses_url" => "http://api.github.com/repos/octocat/Hello-World/statuses/{sha}",
              "subscribers_url" => "http://api.github.com/repos/octocat/Hello-World/subscribers",
              "subscription_url" =>
                "http://api.github.com/repos/octocat/Hello-World/subscription",
              "tags_url" => "http://api.github.com/repos/octocat/Hello-World/tags",
              "teams_url" => "http://api.github.com/repos/octocat/Hello-World/teams",
              "trees_url" => "http://api.github.com/repos/octocat/Hello-World/git/trees{/sha}",
              "clone_url" => "https://github.com/octocat/Hello-World.git",
              "mirror_url" => "git:git.example.com/octocat/Hello-World",
              "hooks_url" => "http://api.github.com/repos/octocat/Hello-World/hooks",
              "svn_url" => "https://svn.github.com/octocat/Hello-World",
              "homepage" => "https://github.com",
              "language" => nil,
              "forks_count" => 9,
              "stargazers_count" => 80,
              "watchers_count" => 80,
              "size" => 108,
              "default_branch" => "master",
              "open_issues_count" => 0,
              "is_template" => true,
              "topics" => [
                "octocat",
                "atom",
                "electron",
                "api"
              ],
              "has_issues" => true,
              "has_projects" => true,
              "has_wiki" => true,
              "has_pages" => false,
              "has_downloads" => true,
              "archived" => false,
              "disabled" => false,
              "pushed_at" => "2011-01-26T19:06:43Z",
              "created_at" => "2011-01-26T19:01:12Z",
              "updated_at" => "2011-01-26T19:14:43Z",
              "permissions" => %{
                "admin" => false,
                "push" => false,
                "pull" => true
              },
              "allow_rebase_merge" => true,
              "template_repository" => nil,
              "allow_squash_merge" => true,
              "allow_merge_commit" => true,
              "subscribers_count" => 42,
              "network_count" => 0
            }
          },
          "_links" => %{
            "self" => %{
              "href" => "https://api.github.com/repos/octocat/Hello-World/pulls/1347"
            },
            "html" => %{
              "href" => "https://github.com/octocat/Hello-World/pull/1347"
            },
            "issue" => %{
              "href" => "https://api.github.com/repos/octocat/Hello-World/issues/1347"
            },
            "comments" => %{
              "href" => "https://api.github.com/repos/octocat/Hello-World/issues/1347/comments"
            },
            "review_comments" => %{
              "href" => "https://api.github.com/repos/octocat/Hello-World/pulls/1347/comments"
            },
            "review_comment" => %{
              "href" => "https://api.github.com/repos/octocat/Hello-World/pulls/comments{/number}"
            },
            "commits" => %{
              "href" => "https://api.github.com/repos/octocat/Hello-World/pulls/1347/commits"
            },
            "statuses" => %{
              "href" =>
                "https://api.github.com/repos/octocat/Hello-World/statuses/6dcb09b5b57875f334f61aebed695e2e4193db5e"
            }
          },
          "author_association" => "OWNER",
          "draft" => false
        }

      _ ->
        [
          %{
            "url" =>
              "https://api.github.com/repos/octocat/Hello-World/statuses/6dcb09b5b57875f334f61aebed695e2e4193db5e",
            "avatar_url" => "https://github.com/images/error/hubot_happy.gif",
            "id" => 1,
            "node_id" => "MDY6U3RhdHVzMQ==",
            "state" => "success",
            "description" => "Build has completed successfully",
            "target_url" => "https://ci.example.com/1000/output",
            "context" => "continuous-integration/jenkins",
            "created_at" => "2012-07-20T01:19:13Z",
            "updated_at" => "2012-07-20T01:19:13Z",
            "creator" => %{
              "login" => "octocat",
              "id" => 1,
              "node_id" => "MDQ6VXNlcjE=",
              "avatar_url" => "https://github.com/images/error/octocat_happy.gif",
              "gravatar_id" => "",
              "url" => "https://api.github.com/users/octocat",
              "html_url" => "https://github.com/octocat",
              "followers_url" => "https://api.github.com/users/octocat/followers",
              "following_url" => "https://api.github.com/users/octocat/following{/other_user}",
              "gists_url" => "https://api.github.com/users/octocat/gists{/gist_id}",
              "starred_url" => "https://api.github.com/users/octocat/starred{/owner}{/repo}",
              "subscriptions_url" => "https://api.github.com/users/octocat/subscriptions",
              "organizations_url" => "https://api.github.com/users/octocat/orgs",
              "repos_url" => "https://api.github.com/users/octocat/repos",
              "events_url" => "https://api.github.com/users/octocat/events{/privacy}",
              "received_events_url" => "https://api.github.com/users/octocat/received_events",
              "type" => "User",
              "site_admin" => false
            }
          }
        ]
    end
  end
end
