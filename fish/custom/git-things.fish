function git-refresh
    git fetch -p
end

function git-list-branches
    git branch -vv
end

function git-branches-without-remote
    git-refresh | git-list-branches | grep -E '^\s*\S+\s+[^\[]+$' | awk '{print $1}'
end

function git-remove-branches-without-remote
    git-branches-without-remote | xargs git branch -D
end

function git-branches-remote-gone
    git-refresh | git-list-branches | grep gone | awk '{print $1}'
end

function git-remove-branches-remote-gone
    git-branches-remote-gone | xargs git branch -d
end

function git-remove-force-branches-remote-gone
    git-branches-remote-gone | xargs git branch -D
end

function git-what-can-i-remove
    git clean -n -d
end

function git-remove-what-can-i-remove-interactive
    git clean -i
end
