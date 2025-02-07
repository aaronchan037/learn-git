# 也要学会使用 IDE 来进行 Git 操作
########################### 基础操作 ###########################
# 初始化git仓库（提交到远程空仓库。如果不是空仓库，只能使用clone）
git init
# 克隆仓库。后面跟的是别名，默认是github仓库的名字
git clone <url> [name]
# 添加文件到缓存区（一般都是提交工作目录下的所有文件，需要忽略处理的操作使用.gitignore来实现）
git add .
# 提交到本地仓库（引号内填写提交信息）。提交信息一般要写明此次提交的相关详情
git commit -m "<message>"

########################### 常用命令 ###########################
# 查看文件状态
git status
# 查看提交历史记录
git log
# 查看远程仓库和本地仓库的分支情况（需要联网）
# 可以看出来远程分支是否落后于本地分支，落后就合并
git branch -vv
# 查看远程仓库和本地仓库的各个分支的详情（需要联网）
git remote show origin

########################### 分支相关 ###########################
# 查看当前所在的分支（列出本地的所有分支）
git branch --local
git branch
# 列出远程的所有分支
git branch --remote
git branch -r
# 列出本地和远程的所有分支
git branch --all
git branch -a

# 查看分支详情，推荐直接使用
git branch -vv

# 创建分支
git branch <branch-name>
# 切换到某分支
# git checkout <branch-name>
git switch <branch-name>
# 创建新的分支并切换到该分支上（相当于两条命令）
# git checkout -b <name>   ===  git branch <name> && git checkout <name>
git switch -c <name>
# 删除某分支。如果该分支没有完全合并的话，就会报错
# git branch --delete <branch-name>
git branch -d <branch-name>
# 强制删除某分支
git branch -D <branch-name>
# 在本地删除远程分支
git branch -d --remote <origin-brnach-name>
# 在远程仓库中删除远程分支（后面是分支名，不是远程分支）
git push origin -d <brnach-name>

# 将当前分支重命名为新分支
git branch -m <new-branch-name>

# 合并分支（将指定分支合并到当前分支）
git merge <branch-name>

# 先抓取，然后在本地可以看到文件的该更
git fetch
# 后从本地的远程分支进行合并
git merge origin/<branch-name>

git fetch -v
git merge origin <branch-name>

########################### 标签相关 ###########################
# 列出所有标签
git tag
# 创建标签
git tag <tag-name>
# 推荐使用这种方式创建标签
git tag -a <tag-name> -m "<tag-message>"
# 给某一个commit创建标签
git tag -a <tag-name> <commit-SHA1-value>
# 删除标签
git tag -d <tag-name>
# 将单个标签推送到远程仓库
git push origin <tag-name>
# 切换到某标签（要写切换到哪个分支）
git checkout -b <branch-name> <tag-name>

# 推送所有标签到远程仓库
git push origin --tags


########################### 推送操作 ###########################
# 推送到远程仓库
git push
# 强制推送到远程仓库（会出现覆盖。多人协同时慎用）
git push -f
# 推送指定分支到远程仓库（后面填写的分支与当前所在分支无关）
git push origin <branch-name>
# 推送指定分支到远程仓库。如果远程仓库没有该分支，则会在远程仓库自动创建该分支。只要关联上了，以后只用git push就可以进行推送了（除非远程仓库该分支有更新，那就得先pull下来）。参数是关联
# git push --set-upstream origin <branch-name>
git push -u origin <branch-name>
# 删除远程仓库的分支（注意这是分支名字，不包括origin/）
git push origin --delete <branch-name>

########################### 远程仓库相关（涉及远程的大部分操作是需要联网的） ###########################
# 查看远程仓库的名字
git remote
# 查看远程仓库的相关链接
git remote -v

########################### 高级操作 ###########################
# 一般现有任务还没提交的时候，就要处理事情的时候就可以使用暂时高起。
# 暂时存起来，不需要提交commit
git stash
# 恢复工作
git stash pop
######## 分割线 ########
# 快速克隆一个仓库（也就是只克隆最新版本的代码，没有历史提交代码）
git clone <url> --depth=1
# 添加远程仓库（关联远程仓库的地址）。这个操作一般都是同一个仓库提交到两个远程仓库
git remote add <remote-name> <url>
######## 分割线 ########

# 修改上一次提交的提交信息
git commit --amend
git commit --amend -m "<message>"

# 直接将工作区的内容直接提交到本地仓库（不需要add）
git commit -a
########################### 示例操作 ###########################
# 平时使用chanzz分支进行更新备份。最多合并下dev中的代码
git branch -vv
git switch chanzz
git add .
git commit -m "update"

git merge dev

# 开发阶段新增一个功能，从chanzz进行拉取
git branch -vv
git switch dev
git merge chanzz

# 主分支（生产分支），等发布一个版本时使用（专门从dev拉取）
git branch -vv
git switch main
git merge dev














########################### 不推荐使用的操作 ###########################
# 子模块（不太推荐，最好使用git subtree）
# 在提交的时候不会修改这个文件夹里面的内容。
# 只有在你仓库需要依赖这个子模块的时候才需要
git submodule add <url>

# 查看子模块的状态
git submodule status
# 更新子模块
git submodule update --remote


