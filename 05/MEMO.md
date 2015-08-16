# 5日目

### harib02a
asmhead.nasでメモリに書き込んでおいた値を引っ張ってくる。

### harib02b
構造体の導入。

### harib02c
アロー演算子の導入。

### harib02d
配列を元に文字を表示する。

### harib02e
テキストデータから文字コードのバイナリデータを生成する。テキストからバイナリに変換した後、独自のリンカがよしなにしてくれるらしい。
[tools/makefont](http://hrb.osask.jp/wiki/?tools/makefont)

### harib02f
文字列出力用の関数の作成。しれっとヌル文字の説明。

### harib02g
sprintfで変数も表示できるという内容。

### harib02h
マウスカーソルの作成。

### harib02i
マウスやキーボードを使うための初期設定。
マウスやキーボードを使うためには割り込みを使用する必要があるが、割り込みを使用するためにはGDTを設定する必要がある。そのためまずGDTを設定してからIDTを設定する。今回はGDTを0x270000〜0x27ffff、IDTを0x26f800〜0x26ffffに配置する。セグメント属性(ar:access right)やset\_segmdesc、load\_gdtrの説明は後日。


------
*セグメンテーション…メモリの衝突を防ぐために、メモリを切り分けてその頭を仮想的に0として扱うといった機能。32bitではDS(セグメントレジスタ)にセグメントセレクタが入っており、アドレス計算時はその開始アドレスに相対的なアドレスが足される。
*セグメントセレクタ…文中ではセグメント番号と表記。
*GDT…Global (segment) Descriptor Table。メモリ上に配置されたセグメントの設定テーブル。
*GDTR…Global (segment) Descriptor Table Register。GDTのあるメモリのアドレスと有効な設定個数を格納するレジスタ。
*IDT…Interrupt Descriptor Table。割り込み用の設定テーブル。
*IDTR…Interrupt Descriptor Table Register。IDTのあるメモリのアドレスと有効な設定個数を格納するレジスタ。
