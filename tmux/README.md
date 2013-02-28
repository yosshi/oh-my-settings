# tmux-powerline を使う際に、status bar のフォントを調整する

    % brew install --use-gcc fontforge
    % git clone https://github.com/Lokaltog/vim-powerline.git vim-powerline
    % fontforge -script ./vim-powerline/fontpatcher/fontpatcher /Library/Fonts/OsakaMono.ttf

カレントディレクトリにフォントファイルが生成されるのでインストール。

# tmux で困ったら
ヘルプをみたら良い。

    C-b ?
