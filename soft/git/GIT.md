# Git远程操作详解

![images](../../images/bg2014061202jpg.jpg)

## `git clone`
- 远程操作的第一步，通常是从远程主机克隆一个版本库，这时就要用到`git clone`命令。
    ```
    $ git clone <版本库的网址>
    ```

- 该命令会在本地主机生成一个目录，与远程主机的版本库同名。如果要指定不同的目录名，可以将目录名作为`git clone`命令的第二个参数。
    ```
    $ git clone <版本库的网址> <本地目录名>
    ```
    
- `git clone`支持多种协议，除了`HTTP(s)`以外，还支持`SSH`、`Git`、本地文件协议等。
    ```
    $ git clone http[s]://example.com/path/to/repo.git/
    $ git clone ssh://example.com/path/to/repo.git/
    $ git clone git://example.com/path/to/repo.git/
    $ git clone /opt/git/project.git 
    $ git clone file:///opt/git/project.git
    $ git clone ftp[s]://example.com/path/to/repo.git/
    $ git clone rsync://example.com/path/to/repo.git/
    ```
    
## `git remote`
- 为了便于管理，`Git`要求每个远程主机都必须指定一个主机名。`git remote`命令就用于管理主机名。不带选项的时候，`git remote`命令列出所有远程主机。
    ```
    $ git remote
    origin
    ```
    
- 使用-v选项，可以参看远程主机的网址。
    ```
    $ git remote -v
    origin  git@git.coding.net:zhangrxiang/learn-shell.git (fetch)
    origin  git@git.coding.net:zhangrxiang/learn-shell.git (push)
    ```
- 上面命令表示，当前只有一台远程主机，叫做`origin`，以及它的网址。

- 克隆版本库的时候，所使用的远程主机自动被`Git`命名为`origin`。如果想用其他的主机名，需要用`git clone`命令的`-o`选项指定。
    ```
    $ git clone -o jQuery https://github.com/jquery/jquery.git
    $ git remote
    jQuery
    ```
   
- `git remote show`命令加上主机名，可以查看该主机的详细信息。
    ```
    $ git remote show <主机名>
    ```
    
- `git remote add`命令用于添加远程主机。
    ```
    $ git remote add <主机名> <网址>
    ```
- `git remote rm`命令用于删除远程主机。
    ```
    $ git remote rm <主机名>
    ```
- `git remote rename`命令用于远程主机的改名。
    ```
    $ git remote rename <原主机名> <新主机名>
    ```
   
   
## `git fetch`
- 一旦远程主机的版本库有了更新（`Git`术语叫做`commit`），需要将这些更新取回本地，这时就要用到`git fetch`命令。
    ```
    $ git fetch <远程主机名>
    ```
- 上面命令将某个远程主机的更新，全部取回本地。

- `git fetch`命令通常用来查看其他人的进程，因为它取回的代码对你本地的开发代码没有影响。
-  默认情况下，`git fetch`取回所有分支（`branch`）的更新。如果只想取回特定分支的更新，可以指定分支名。
    ```
    $ git fetch <远程主机名> <分支名>
    ```
    
- 所取回的更新，在本地主机上要用"`远程主机名/分支名`"的形式读取。比如`origin`主机的`master`，就要用`origin/master`读取。
- `git branch`命令的`-r`选项，可以用来查看远程分支，`-a选项查看所有分支。
    ```
    $ git branch -r
      origin/HEAD -> origin/master
      origin/master
      
    $ git branch -a
    * master
    remotes/origin/HEAD -> origin/master
    remotes/origin/master
    
    ```
- 上面命令表示，本地主机的当前分支是`master`，远程分支是`origin/master`。
- 取回远程主机的更新以后，可以在它的基础上，使用`git checkout`命令创建一个新的分支。
    ```
    $ git checkout -b dev origin/master
    ```
- 上面命令表示，在`origin/master`的基础上，创建一个新分支。
- 此外，也可以使用`git merge`命令或者`git rebase`命令，在本地分支上合并远程分支。
    ```
    $ git merge origin/master
    # 或者
    $ git rebase origin/master
    ```
- 上面命令表示在当前分支上，合并`origin/master`。

## `git pull`
- `git pull`命令的作用是，取回远程主机某个分支的更新，再与本地的指定分支合并。它的完整格式稍稍有点复杂。
    ```
    $ git pull <远程主机名> <远程分支名>:<本地分支名>
    ```
- 比如，取回`origin`主机的`next`分支，与本地的`master`分支合并，需要写成下面这样。
    ```
    $ git pull origin next:master
    ```

- 如果远程分支是与当前分支合并，则冒号后面的部分可以省略。
    ```
    $ git pull origin next
    ```
- 上面命令表示，取回`origin/next`分支，再与当前分支合并。实质上，这等同于先做`git fetch`，再做`git merge`。
    ```
    $ git fetch origin
    $ git merge origin/next
    ```   

- 在某些场合，`Git`会自动在本地分支与远程分支之间，建立一种追踪关系（`tracking`）。比如，在`git clone`的时候，所有本地分支默认与远程主机的同名分支，建立追踪关系，也就是说，本地的`master`分支自动"追踪"`origin/master`分支。
- Git也允许手动建立追踪关系。
    ```
    git branch --set-upstream master origin/next
    ```
- 上面命令指定`master`分支追踪`origin/next`分支。
- 如果当前分支与远程分支存在追踪关系，`git pull`就可以省略远程分支名。
    ```
    $ git pull origin
    ```
- 上面命令表示，本地的当前分支自动与对应的`origin`主机"追踪分支"（`remote-tracking branch`）进行合并。
- 如果当前分支只有一个追踪分支，连远程主机名都可以省略。
    ```
    $ git pull
    ```
- 上面命令表示，当前分支自动与唯一一个追踪分支进行合并。
- 如果合并需要采用`rebase`模式，可以使用`--rebase`选项。



[url](http://www.ruanyifeng.com/blog/2014/06/git_remote.html)