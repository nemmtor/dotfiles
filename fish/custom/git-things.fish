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

function gwta --description "Create a new worktree in bare repo root"
    # Get the bare repo root (common git dir)
    set bare_root (git rev-parse --git-common-dir 2>/dev/null)

    if test $status -ne 0
        echo "Error: Not in a git repository"
        return 1
    end

    # Check if arguments provided
    if test (count $argv) -lt 1
        echo "Usage: gwta <worktree-name> [branch-name]"
        echo "  gwta feature-x              # Create worktree from existing branch"
        echo "  gwta feature-x new-branch   # Create worktree with new branch"
        return 1
    end

    set worktree_name $argv[1]
    set worktree_path "$bare_root/code/$worktree_name"

    # Check if branch name provided (for new branch)
    if test (count $argv) -eq 2
        set branch_name $argv[2]
        git worktree add -b $branch_name $worktree_path
    else
        # Use existing branch with same name as worktree
        git worktree add $worktree_path $worktree_name
    end

    if test $status -eq 0
        echo "✓ Created worktree at: $worktree_path"
        cd $worktree_path
        echo "✓ Changed directory to: $worktree_path"
    end
end

function gwtr --description "Remove a worktree in bare repo root"
    # Get the bare repo root (common git dir)
    set bare_root (git rev-parse --git-common-dir 2>/dev/null)

    if test $status -ne 0
        echo "Error: Not in a git repository"
        return 1
    end

    # Check if arguments provided
    if test (count $argv) -lt 1
        echo "Usage: gwtt <worktree-name>"
        echo "  gwtw feature-x              # Remove worktree"
        return 1
    end

    set worktree_name $argv[1]
    set worktree_path "$bare_root/code/$worktree_name"
    set main_worktree_path "$bare_root/code/main"

    git worktree remove $worktree_path

    if test $status -eq 0
        echo "✓ Removed worktree at: $worktree_path"
        cd $main_worktree_path
        echo "✓ Changed directory to: $main_worktree_path"
    end
end
