# セットアップ

## インストール

リポジトリを git clone して PATH を通すだけで、インストール完了です。

```bash
$ git clone https://github.com/ontheroadjp/dammy

# for bash
$ echo 'PATH=/path/to/dammy:$PATH' >> .bash_profile

# for zsh
$ echo 'PATH=/path/to/dammy:$PATH' >> .zprofile
```

お疲れ様でした。

## アンインストール

```bash
$ rm -rf /path/to/dammy
```
``.bash_profile`` または ``.zprofile`` に追加した、PATH の削除します。

以上で完了です。

