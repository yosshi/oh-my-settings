# oh-my-settings

新しいマシンを買った際、OSを再インストールした際にどこでも同じ設定をするためのリポジトリ。
install.sh を実行することで設定ファイルをホームディレクトリにリンクを貼る。

```
$ ./install.sh
```

# install.sh で導入される設定ファイル

```
~/.gitconfig
~/.gitignore
~/.zshrc
~/.vim
~/.vimrc
```

# Mac OSX の defaults コマンドによる設定

```
./mac/defaults_hack.sh
```

# vim
submodule として登録している外部リポジトリを設定しているので次のコマンドを実行。

```
$ git submodule init
$ git submodule update
```

vim にてインストールコマンドを実行

```
:NeoBundleInstall
```

# homebrew

brew bundle を使用してまとめてインストール

```
$ brew bundle homebrew/Brewfile
```

Brewfile を作成するには

```
$ brew bundle dump
```

# geektool
geektool ディレクトリ下の README にインストール方法が書かれている。

```
oh-my-settings/geektool/README.md
```
