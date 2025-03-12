# Git

## 使用规范

- Git 最好只上传必要的东西
  - 源代码（生成的二进制文件不要上传），必要的说明文档，以及能够完全编译出来的依赖文件

获取 Git 的仓库只有两种方式

1. `git init`: 空仓库建议使用这种方式
2. `git clone <name>`: 已有仓库使用这种方式（大多数情况下都使用这种方式）

- 只要涉及远程仓库的情况，那就需要联网

## 分支使用

- 永久分支
  - main (master): 主分支（用于部署生产）。一般不会直接推送到该分支，主要靠合并的方式进行更新
    - 只能通过合并 release 分支和 hotfix 分支进行更新
  - develop: 开发分支（用于开发）。
    - 该分支保存了开发过程中的最新代码。
    - 持续集成的生成等都是基于这个分支。
    - （一般在大型项目中）由于当前版本迭代较快，开发分支只提供拉取，不进行实际开发。
- 临时分支（生命周期就是干完活就删掉）
  - stable: 稳定版本（不再维护的时候就删除分支）
    - stable/1.0。稳定版 1.0，不再加入新功能，只修复 bug
      - 修复 bug 的分支：1.0.0-bug-fix
  - release: 预发布分支。测试没问题就合并到 main 分支，进行分布。
    - release/v1.0 (测试完合并到 main 分支和 dev 分支上就删除该分支)
  - test: 测试分支。
  - hotfix: 线上修复 bug 分支（bug 修复后删除分支）。
    - 一般用于线上修复 bug 的，而开发和测试过程中发现的 bug 应该在 dev 分支进行合并。
  - feature: 具体功能开发的分支（功能开发完就删除分支）。
    - 只与 develop 分支进行交互（每一次合并到 dev 分支就是一个功能）
  - todo: Todo 分支。

## 分支管理

- 只保留稳定版本的标签和当前开发分支
  - 比如：v2.2.0 (当前的稳定版本), v2.2.20241129 (当前开发分支的最新情况)
- 开发过程中有必要保留其他有意义的版本号（具体情况具体分析）

## 操作

### Conventional Commit Messages

- `fix`: patches a bug
- `feat`: introduces a new feature to the codebase
- `chore`: updating deps, etc.
- `doc`: documentation changes
- `edit`: minor changes that aren't big enough to be considered a feature
- `polish`: copy editing or cleanup that doesn't affect functionality
- `test`: unit testing, etc.

## Tag 版本管理

- A.B.C
  - A：大版本。大的功能加入
  - B：小版本。小的功能加入
  - C：bug 修复版本。只修复 bug，无新的功能加入

### 基础操作

#### 标签相关

### 操作

修改最近一次 commit 的详情

```shell
git add .
git commit --amend
# 如果代码已经push到远程仓库，修改远程仓库需要强制push来覆盖（但不太推荐这个方法，这会对别人带来不必要的麻烦）
# git push origin <branch-name> --force
git push origin <branch-name> -f
# 一定要区分个人分支和团队开发分支。个人分支只有自己在使用，那无所谓强制覆盖
```

删除所有 commit 记录

```shell
# 创建一个没有任何提交历史的分支（但有所有文件）
# 严格来说，它不是一个真正的分支，只有在提交第一次记录后才能算得上一个真正的分支
git checkout --orphan <branch-name>
```

只要删除 commit 的记录就好，因为 reflog 只是本地的记录

### 关于 Git 上的其他配置

`.git-credentials` 是一个命令行工具，用于存储和管理 Git 凭证信息，包括用户名和密码。它可以帮助我们自动化地输入用户名和密码的过程，避免频繁地手动输入

只要输入一次密码就再也不用输入了。记得不要输入明码，用 token 代替（名称为 Github_push）

```shell
git config --global credential.helper store
```
