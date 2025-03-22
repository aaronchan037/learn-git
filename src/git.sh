########################### 初始化操作 ###########################
# 抓取（但没合并）
# 也就是说同步远程分支到本地，但本地分支没有同步更新。所以后面还是需要通过git merge origin/<branch-name>进行本地分支的更新
git fetch
# 拉取（相当于两条命令）   ===  git fetch && git merge origin/<branch-name>
git pull
########################### 分支操作 ###########################
# 取消暂存（也就是git commit的回退）
git reset <filename>
# 切换到指定提交版本（回退到指定提交版本）
# hard会直接删除代码
# soft不会直接删除，会保留一份，自己可以手动修改
git reset --hard <commit ID>
git reset --soft <commit ID>
########################### 检查操作 ###########################
# 合并分支
git merge <branch-name>

# 远程仓库没有的分支，在本地仓库可以通过以下命令进行删除（要先进行上一步的联网操作）
git remote prune
git fetch --prune

########################### 标签操作 ###########################
# 删除远程的所有标签（这个是根据本地标签列表来操作的，所以要完全删除干净，要先同步）
git tag -l | xargs -n 1 git push --delete origin
# 推送所有标签到远程仓库
git push origin --tags
# 删除本地所有标签后拉取远程所有标签
git tag -l | xargs git tag -d
git fetch

########################### 其他操作 ###########################
# 切换到某个提交版本
git checkout <commit-ID>

git rebase
# 如果rebase之前已经push到远程仓库了，那么rebase后再push就会出错（当然，强制push是没有问题的）

git fetch --verbose
git fetch -v

git pull -v

git cherry-pick <commit-ID>


########################### 常用命令 ###########################
# 当分支不相关时使用这个命令
git pull origin <branch-name> --allow-unrelated-histories

########################### 高级操作 ###########################
# subtree
git subtree

# 将hello-world仓库main分支的代码添加到根目录下命名为hello-world
git subtree add --prefix=hello-world git@github.com:chanzz0/hello-world.git main


# 推送回hello-world仓库（推送前需要先提交）
# 注意该命令是只推送到子仓库，本地仓库还没有推送上去（还需要git push进行推送操作）
git subtree push --prefix=hello-world git@github.com:chanzz0/hello-world.git main



# 以一个分支新开一个工作树
git worktree add <path> <branch-name>
# 查看工作树
git worktree list
# 移除工作树
git worktree remove <dir>

# 清理Git
# 垃圾回收
git gc
# 更深度的垃圾回收
git gc --aggressive

# 删除垃圾对象
git prune
# 查看垃圾对象
git fsck





