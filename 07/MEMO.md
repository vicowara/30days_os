# 7日目

### harib04a
キーコードを取得して画面に表示する。
OCW2に0x60+IRQ番号をoutすると割り込みの監視を再開する。装置番号0x0060からキーコードを取得している。

### harib04b
harib04aでは割り込みハンドラでキーコードの取得から表示までやっていたので、割り込みがあった際はハンドラでキーコードを保存しておいて、main関数でフラグを確認して表示を行う。

### harib04c
キューの導入。

### harib04d
リングバッファの導入。

### harib04e
リングバッファまわりの整理。

### harib04f
マウスの有効化。
マウスを使用するためにははマウス制御回路とマウス自体に有効化命令を実行する必要がある。モードを設定するためのコマンドの番号やモード番号は[AT互換機のPS/2キーボードコントローラ](http://oswiki.osask.jp/?%28AT%29keyboard)にある。マウス制御回路はキーボード制御回路の中にあるので、キーボード制御回路を初期化した後マウスを有効化すればよい。

### harib04g
マウスからのデータ受信。
マウスはIRQ12を用いるがこれはキーボードとは異なりスレーブに割り込みがくる。スレーブに割り込みが来る場合、スレーブだけでなくマスタにもIRQの受付完了を通知する必要がある。マウスはキーボードと同じ処理でデータを受け取ることが出来るため、特に大きな追加はない。

----
*OCW…Operation Command Word。1と2があり、OCW1はIMRに格納する値を設定し、OCW2はPICの操作を行う。[PIC 8259Aのページ](http://oswiki.osask.jp/?%28PIC%298259A)や[０から作るOS開発　割り込みその２　PICとIRQ](http://softwaretechnique.jp/OS_Development/kernel_development03.html)が詳しい。