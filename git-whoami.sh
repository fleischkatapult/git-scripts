#!/usr/bin/env bash


set -e

get_email() {
	git config user.email || ( [ -n "$EMAIL" ] && echo "$EMAIL" ) || echo "$(id -nu)@$(hostname --fqdn)"
}

get_name() {
	git config user.name || getent passwd $(id -un) | cut -d : -f 5 | cut -d , -f 1
}

: ${GIT_AUTHOR_NAME=$(get_name)}
: ${GIT_COMMITTER_NAME=$(get_name)}
: ${GIT_AUTHOR_EMAIL=$(get_email)}
: ${GIT_COMMITTER_EMAIL=$(get_email)}



# author and commiter are most of the time the same, but they can differ..
author="$GIT_AUTHOR_NAME <$GIT_AUTHOR_EMAIL>"
commit="$GIT_COMMITTER_NAME <$GIT_COMMITTER_EMAIL>"

if [ "$author" == "$commit" ]; then
	echo "$author"
else
	echo "Author: $author"
	echo "Commit: $commit"
fi
