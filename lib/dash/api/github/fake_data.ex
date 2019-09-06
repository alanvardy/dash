defmodule Dash.Api.Github.FakeData do
  @moduledoc """
  Fake API data for development testing and Travis CI
  """

  def generate(url) do
    case url do
      "user/issues" ->
        [
          %{
            "assignee" => %{
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
            "assignees" => [
              %{
                "avatar_url" => "https://avatars0.githubusercontent.com/u/38899847?v=4",
                "events_url" => "https://api.github.com/users/alanvardy/events{/privacy}",
                "followers_url" => "https://api.github.com/users/alanvardy/followers",
                "following_url" =>
                  "https://api.github.com/users/alanvardy/following{/other_user}",
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
              }
            ],
            "author_association" => "OWNER",
            "body" => "Log in, log out, models",
            "closed_at" => nil,
            "comments" => 0,
            "comments_url" =>
              "https://api.github.com/repos/alanvardy/superawesome/issues/39/comments",
            "created_at" => "2019-09-06T00:21:35Z",
            "events_url" => "https://api.github.com/repos/alanvardy/superawesome/issues/39/events",
            "html_url" => "https://github.com/alanvardy/superawesome/issues/39",
            "id" => 490_070_248,
            "labels" => [],
            "labels_url" =>
              "https://api.github.com/repos/alanvardy/superawesome/issues/39/labels{/name}",
            "locked" => false,
            "milestone" => nil,
            "node_id" => "MDU6SXNzdWU0OTAwNzAyNDg=",
            "number" => 39,
            "repository" => %{
              "statuses_url" => "https://api.github.com/repos/alanvardy/superawesome/statuses/{sha}",
              "git_refs_url" => "https://api.github.com/repos/alanvardy/superawesome/git/refs{/sha}",
              "issue_comment_url" =>
                "https://api.github.com/repos/alanvardy/superawesome/issues/comments{/number}",
              "watchers" => 0,
              "disabled" => false,
              "mirror_url" => nil,
              "languages_url" => "https://api.github.com/repos/alanvardy/superawesome/languages",
              "stargazers_count" => 0,
              "license" => nil,
              "forks" => 0,
              "default_branch" => "develop",
              "comments_url" =>
                "https://api.github.com/repos/alanvardy/superawesome/comments{/number}",
              "commits_url" => "https://api.github.com/repos/alanvardy/superawesome/commits{/sha}",
              "id" => 205_776_405,
              "clone_url" => "https://github.com/alanvardy/superawesome.git",
              "homepage" => "https://superawesome.gigalixirapp.com",
              "stargazers_url" => "https://api.github.com/repos/alanvardy/superawesome/stargazers",
              "events_url" => "https://api.github.com/repos/alanvardy/superawesome/events",
              "blobs_url" => "https://api.github.com/repos/alanvardy/superawesome/git/blobs{/sha}",
              "forks_count" => 0,
              "pushed_at" => "2019-09-06T00:34:41Z",
              "git_url" => "git://github.com/alanvardy/superawesome.git",
              "hooks_url" => "https://api.github.com/repos/alanvardy/superawesome/hooks",
              "owner" => %{
                "avatar_url" => "https://avatars0.githubusercontent.com/u/38899847?v=4",
                "events_url" => "https://api.github.com/users/alanvardy/events{/privacy}",
                "followers_url" => "https://api.github.com/users/alanvardy/followers",
                "following_url" =>
                  "https://api.github.com/users/alanvardy/following{/other_user}",
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
              "trees_url" => "https://api.github.com/repos/alanvardy/superawesome/git/trees{/sha}",
              "git_commits_url" =>
                "https://api.github.com/repos/alanvardy/superawesome/git/commits{/sha}",
              "collaborators_url" =>
                "https://api.github.com/repos/alanvardy/superawesome/collaborators{/collaborator}",
              "watchers_count" => 0,
              "archived" => false,
              "tags_url" => "https://api.github.com/repos/alanvardy/superawesome/tags",
              "merges_url" => "https://api.github.com/repos/alanvardy/superawesome/merges",
              "releases_url" => "https://api.github.com/repos/alanvardy/superawesome/releases{/id}",
              "subscribers_url" => "https://api.github.com/repos/alanvardy/superawesome/subscribers",
              "ssh_url" => "git@github.com:alanvardy/superawesome.git",
              "created_at" => "2019-09-02T04:25:20Z",
              "name" => "superawesome",
              "has_issues" => true,
              "private" => true,
              "git_tags_url" => "https://api.github.com/repos/alanvardy/superawesome/git/tags{/sha}",
              "has_projects" => true,
              "archive_url" =>
                "https://api.github.com/repos/alanvardy/superawesome/{archive_format}{/ref}",
              "has_wiki" => true,
              "open_issues_count" => 14,
              "milestones_url" =>
                "https://api.github.com/repos/alanvardy/superawesome/milestones{/number}",
              "forks_url" => "https://api.github.com/repos/alanvardy/superawesome/forks",
              "url" => "https://api.github.com/repos/alanvardy/superawesome",
              "downloads_url" => "https://api.github.com/repos/alanvardy/superawesome/downloads",
              "open_issues" => 14,
              "keys_url" => "https://api.github.com/repos/alanvardy/superawesome/keys{/key_id}",
              "description" => "The best way is superawesome",
              "contents_url" =>
                "https://api.github.com/repos/alanvardy/superawesome/contents/{+path}",
              "language" => "JavaScript",
              "contributors_url" =>
                "https://api.github.com/repos/alanvardy/superawesome/contributors",
              "deployments_url" => "https://api.github.com/repos/alanvardy/superawesome/deployments",
              "pulls_url" => "https://api.github.com/repos/alanvardy/superawesome/pulls{/number}",
              "labels_url" => "https://api.github.com/repos/alanvardy/superawesome/labels{/name}",
              "html_url" => "https://github.com/alanvardy/superawesome",
              "svn_url" => "https://github.com/alanvardy/superawesome",
              "issue_events_url" =>
                "https://api.github.com/repos/alanvardy/superawesome/issues/events{/number}",
              "notifications_url" =>
                "https://api.github.com/repos/alanvardy/superawesome/notifications{?since,all,participating}",
              "has_downloads" => true,
              "node_id" => "MDEwOlJlcG9zaXRvcnkyMDU3NzY0MDU=",
              "compare_url" =>
                "https://api.github.com/repos/alanvardy/superawesome/compare/{base}...{head}",
              "full_name" => "alanvardy/superawesome",
              "subscription_url" =>
                "https://api.github.com/repos/alanvardy/superawesome/subscription",
              "assignees_url" =>
                "https://api.github.com/repos/alanvardy/superawesome/assignees{/user}",
              "issues_url" => "https://api.github.com/repos/alanvardy/superawesome/issues{/number}",
              "size" => 994,
              "has_pages" => false,
              "fork" => false,
              "updated_at" => "2019-09-05T23:59:40Z",
              "branches_url" =>
                "https://api.github.com/repos/alanvardy/superawesome/branches{/branch}",
              "teams_url" => "https://api.github.com/repos/alanvardy/superawesome/teams"
            },
            "repository_url" => "https://api.github.com/repos/alanvardy/superawesome",
            "state" => "open",
            "title" => "Add Navbar",
            "updated_at" => "2019-09-06T14:06:26Z",
            "url" => "https://api.github.com/repos/alanvardy/superawesome/issues/39",
            "user" => %{
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
            }
          },
          %{
            "assignee" => %{
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
            "assignees" => [
              %{
                "avatar_url" => "https://avatars0.githubusercontent.com/u/38899847?v=4",
                "events_url" => "https://api.github.com/users/alanvardy/events{/privacy}",
                "followers_url" => "https://api.github.com/users/alanvardy/followers",
                "following_url" =>
                  "https://api.github.com/users/alanvardy/following{/other_user}",
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
              }
            ],
            "author_association" => "OWNER",
            "body" =>
              "- [ ] site_number:string\r\n- [ ] address:string\r\n- [ ] city:string\r\n- [ ] postal_code:string\r\n- [ ] province:string\r\n- [ ] country:string\r\n- [ ] has many Equipment\r\n- [ ] Equipment belongs to site",
            "closed_at" => nil,
            "comments" => 0,
            "comments_url" =>
              "https://api.github.com/repos/alanvardy/superawesome/issues/26/comments",
            "created_at" => "2019-09-05T02:35:40Z",
            "events_url" => "https://api.github.com/repos/alanvardy/superawesome/issues/26/events",
            "html_url" => "https://github.com/alanvardy/superawesome/issues/26",
            "id" => 489_495_145,
            "labels" => [],
            "labels_url" =>
              "https://api.github.com/repos/alanvardy/superawesome/issues/26/labels{/name}",
            "locked" => false,
            "milestone" => nil,
            "node_id" => "MDU6SXNzdWU0ODk0OTUxNDU=",
            "number" => 26,
            "repository" => %{
              "statuses_url" => "https://api.github.com/repos/alanvardy/superawesome/statuses/{sha}",
              "git_refs_url" => "https://api.github.com/repos/alanvardy/superawesome/git/refs{/sha}",
              "issue_comment_url" =>
                "https://api.github.com/repos/alanvardy/superawesome/issues/comments{/number}",
              "watchers" => 0,
              "disabled" => false,
              "mirror_url" => nil,
              "languages_url" => "https://api.github.com/repos/alanvardy/superawesome/languages",
              "stargazers_count" => 0,
              "license" => nil,
              "forks" => 0,
              "default_branch" => "develop",
              "comments_url" =>
                "https://api.github.com/repos/alanvardy/superawesome/comments{/number}",
              "commits_url" => "https://api.github.com/repos/alanvardy/superawesome/commits{/sha}",
              "id" => 205_776_405,
              "clone_url" => "https://github.com/alanvardy/superawesome.git",
              "homepage" => "https://superawesome.gigalixirapp.com",
              "stargazers_url" => "https://api.github.com/repos/alanvardy/superawesome/stargazers",
              "events_url" => "https://api.github.com/repos/alanvardy/superawesome/events",
              "blobs_url" => "https://api.github.com/repos/alanvardy/superawesome/git/blobs{/sha}",
              "forks_count" => 0,
              "pushed_at" => "2019-09-06T00:34:41Z",
              "git_url" => "git://github.com/alanvardy/superawesome.git",
              "hooks_url" => "https://api.github.com/repos/alanvardy/superawesome/hooks",
              "owner" => %{
                "avatar_url" => "https://avatars0.githubusercontent.com/u/38899847?v=4",
                "events_url" => "https://api.github.com/users/alanvardy/events{/privacy}",
                "followers_url" => "https://api.github.com/users/alanvardy/followers",
                "following_url" =>
                  "https://api.github.com/users/alanvardy/following{/other_user}",
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
              "trees_url" => "https://api.github.com/repos/alanvardy/superawesome/git/trees{/sha}",
              "git_commits_url" =>
                "https://api.github.com/repos/alanvardy/superawesome/git/commits{/sha}",
              "collaborators_url" =>
                "https://api.github.com/repos/alanvardy/superawesome/collaborators{/collaborator}",
              "watchers_count" => 0,
              "archived" => false,
              "tags_url" => "https://api.github.com/repos/alanvardy/superawesome/tags",
              "merges_url" => "https://api.github.com/repos/alanvardy/superawesome/merges",
              "releases_url" => "https://api.github.com/repos/alanvardy/superawesome/releases{/id}",
              "subscribers_url" => "https://api.github.com/repos/alanvardy/superawesome/subscribers",
              "ssh_url" => "git@github.com:alanvardy/superawesome.git",
              "created_at" => "2019-09-02T04:25:20Z",
              "name" => "superawesome",
              "has_issues" => true,
              "private" => true,
              "git_tags_url" => "https://api.github.com/repos/alanvardy/superawesome/git/tags{/sha}",
              "has_projects" => true,
              "archive_url" =>
                "https://api.github.com/repos/alanvardy/superawesome/{archive_format}{/ref}",
              "has_wiki" => true,
              "open_issues_count" => 14,
              "milestones_url" =>
                "https://api.github.com/repos/alanvardy/superawesome/milestones{/number}",
              "forks_url" => "https://api.github.com/repos/alanvardy/superawesome/forks",
              "url" => "https://api.github.com/repos/alanvardy/superawesome",
              "downloads_url" => "https://api.github.com/repos/alanvardy/superawesome/downloads",
              "open_issues" => 14,
              "keys_url" => "https://api.github.com/repos/alanvardy/superawesome/keys{/key_id}",
              "description" => "The best way is superawesome",
              "contents_url" =>
                "https://api.github.com/repos/alanvardy/superawesome/contents/{+path}",
              "language" => "JavaScript",
              "contributors_url" =>
                "https://api.github.com/repos/alanvardy/superawesome/contributors",
              "deployments_url" => "https://api.github.com/repos/alanvardy/superawesome/deployments",
              "pulls_url" => "https://api.github.com/repos/alanvardy/superawesome/pulls{/number}",
              "labels_url" => "https://api.github.com/repos/alanvardy/superawesome/labels{/name}",
              "html_url" => "https://github.com/alanvardy/superawesome",
              "svn_url" => "https://github.com/alanvardy/superawesome",
              "issue_events_url" =>
                "https://api.github.com/repos/alanvardy/superawesome/issues/events{/number}",
              "notifications_url" =>
                "https://api.github.com/repos/alanvardy/superawesome/notifications{?since,all,participating}",
              "has_downloads" => true,
              "node_id" => "MDEwOlJlcG9zaXRvcnkyMDU3NzY0MDU=",
              "compare_url" =>
                "https://api.github.com/repos/alanvardy/superawesome/compare/{base}...{head}",
              "full_name" => "alanvardy/superawesome",
              "subscription_url" =>
                "https://api.github.com/repos/alanvardy/superawesome/subscription",
              "assignees_url" =>
                "https://api.github.com/repos/alanvardy/superawesome/assignees{/user}",
              "issues_url" => "https://api.github.com/repos/alanvardy/superawesome/issues{/number}",
              "size" => 994,
              "has_pages" => false,
              "fork" => false,
              "updated_at" => "2019-09-05T23:59:40Z",
              "branches_url" =>
                "https://api.github.com/repos/alanvardy/superawesome/branches{/branch}",
              "teams_url" => "https://api.github.com/repos/alanvardy/superawesome/teams"
            },
            "repository_url" => "https://api.github.com/repos/alanvardy/superawesome",
            "state" => "open",
            "title" => "Add Sites (after equipment)",
            "updated_at" => "2019-09-06T14:07:02Z",
            "url" => "https://api.github.com/repos/alanvardy/superawesome/issues/26",
            "user" => %{
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
            "size" => 25773,
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
    end
  end
end
