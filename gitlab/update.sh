#!/bin/bash

#
# Written by Mohammad Razavi <mrazavi64 at gmail dot com>
#

GITLAB_HOOKS_PATH=/opt/gitlab/embedded/service/gitlab-shell/hooks

if [ -f "$GITLAB_HOOKS_PATH/post-receive" ]; then
    ln -f -s /usr/share/kayna/gitlab-hooks/kayna-post-receive "$GITLAB_HOOKS_PATH/kayna-post-receive"
    if ! grep -q KAYNA-GITLAB-PLUGIN-IDENTIFIER "$GITLAB_HOOKS_PATH/post-receive"; then
	[ -f "$GITLAB_HOOKS_PATH/gitlab-post-receive" ] && cp "$GITLAB_HOOKS_PATH/gitlab-post-receive" "$GITLAB_HOOKS_PATH/gitlab-post-receive.backup"
	mv "$GITLAB_HOOKS_PATH/post-receive" "$GITLAB_HOOKS_PATH/gitlab-post-receive"
	ln -s "$GITLAB_HOOKS_PATH/kayna-post-receive" "$GITLAB_HOOKS_PATH/post-receive"
    fi
else
    echo "Could not find /opt/gitlab/embedded/service/gitlab-shell/hooks/post-receive."
    exit 1
fi
