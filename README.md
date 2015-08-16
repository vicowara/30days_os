# OS自作入門のメモとかスクリプトとかのまとめ

## prepare.shの使い方
まず適当なエディタで開きPROJECTS\_PATHとZ\_TOOLS\_PATHに該当するディレクトリの絶対パスを指定する。PROJECTS\_PATHは本に付属のCDに入っているprojectsというディレクトリを指定する。Z\_TOOLS\_PATHは [http://hrb.osask.jp/z_tools.tar.bz2](http://hrb.osask.jp/z_tools.tar.bz2) からダウンロードして解凍したものを指定する。
```
./prepare.sh [%02d]
```
の書式で対応する日付を入力すると、prepare.shのあるディレクトリにprojectsから対応する日付のコードをコピーしてきてlinux用にMakefileをパッチする。あとは各ディレクトリでmake&&make runすれば動作する。
