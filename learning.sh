################ Git office learn ################

# 获取 git 仓库
# 一般是在已存在目录中初始化仓库
git init
# 一般是克隆现有的仓库
git clone
# 检查当前文件状态
git status
# 简短的形式输出文件状态
git status -s
git status --short

# 查看文件差异（只能查看未暂存的文件差异，也就是还没git add的文件）
git diff
# 查看文件差异（已经git add后的文件，使用以下命令进行查看）
# --staged 和 --cached 是同义词
git diff --staged
git diff --cached

# 查看每次提交的简略统计信息
git log --stat
# 查看最近一次的提交记录
git log -1 HEAD
# 已经设置别名代替
git last

# 提交后发现忘记了暂存某些需要的修改，使用以下命令就可以将第二次提交代替第一次提交的修改结果
git commit --amend


# 添加一个新的远程仓库
git remote add <shortname> <url>
# 如果还想拉取这个远程仓库
git fetch <remote>
git fetch <shortname>

# 推送到origin仓库的main分支
git push <remote> <branch>
# 比如将 master 分支推送到 origin 服务器
git push origin master

# 查看某个远程仓库
git remote show <remote>
git remote show origin

# 远程仓库简写的重命名。比如把aaa重命名为bbb
git remote rename aaa bbb
# 删除远程仓库aaa
git remote remove aaa
git remote rm aaa
# 这样所有和这个远程仓库相关的远程跟踪分支以及配置信息也会一起被删除


# 以字母顺序列出标签
git tag --list
git tag -l
# 也可以对特定标签进行检索
# 列出v1.8.5开头的标签
git tag -l "v1.8.5*"

# 添加标签v1.4
# 如果没有后面输入的信息，会启动编辑器让你输入信息的
git tag -a v1.4 -m "version 1.4"
# 给特定提交记录打上标签
git tag -a v1.2 9fceb02


# 正常情况下的git push是不会将标签推送到远程仓库的
# 将标签信息推送到远程仓库
git push origin <tagname>
git push origin v1.4
# 一次性推送多个标签。会把所有不在远程仓库服务器上的标签全部推送上去
git push origin --tags

# 删除本地仓库的标签
git tag -d <tagname>
# 删除远程仓库的标签
git push origin --delete <tagname>


# 查看当前所处的分支
git branch
# 查看每一个分支的最后一次提交
git branch -v
# --merged与--no-merged这两个选项可以过滤已经合并或尚未合并到当前分支的分支
# 前面没有带星号的分支就是已经合并到当前分支
git branch --merged
# 查看所有未合并的分支
git branch --no-merged
# 查看所有未合并到master的分支
git branch --no-merged master
# 删除分支。如果没有合并的分支，这样是无法删除的
git branch -d testing




# 创建创建。基于当前位置创建testing分支
git branch testing
# 切换分支。切换分支会改变你工作目录中的文件
git checkout testing
# 创建分支并切换
git checkout -b <newbranchname>


# 将远程仓库抓取本地没有的代码下来并合并到本地仓库
# 但是并不是合并到当前分支，而是更新本地仓库中的远程分支数据库
git fetch <remote>





























































