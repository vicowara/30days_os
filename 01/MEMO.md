# 1日目

### hello1
```
dd if=/dev/zero of=helloos.img count=1440 bs=1024
```
emacs: hexl-mode -> hexl-insert-hex-string

DB -> .byte
DW -> .word
DD -> .int

.skip A,B BでAバイト分埋める

```
gcc -nostdlib -o os.img hello1.s -Tlnk.ls # ELFフォーマットで出力しない
qemu-system-x86_64 -fda helloos.img # fda フロッピーディスク(fd)のa(ハードディスクならhda)
```

-------------

* ブートセクタ…ディスクの一番最初のセクタ。512バイト。  
* IPL…Initial Program Loader。OS(ブートローダ？)を読み込むためにブートセクタに書くプログラム。


〜参考〜
[OS自作入門 onLinux 1日目](http://cyberbird.indiesj.com/x86%E3%80%80os%E8%87%AA%E4%BD%9C%E5%85%A5%E9%96%80/os%E8%87%AA%E4%BD%9C%E5%85%A5%E9%96%80%20onlinux%201%E6%97%A5%E7%9B%AE)
