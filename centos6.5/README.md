# 説明

* base.json
	* kickstartにより、ベースとなるVMファイルを作成する

* app.json
	* applicationサーバ用の環境作成

# example

## simple

```
packer build base.json
packer build app.json
```

## Virtualboxのみ実行

```
packer build --only base-virtualbox-iso base.json
packer build --only virtualbox-ovf app_base.json
```

## VMWareのみ実行

```
packer build --only vmware-vmx base.json
packer build --only base-vmware-iso app_base.json
```

## その他オプション

*  Virtualbox Toolをいれたくない

```
packer build -var 'run_virtualbox.sh=no' --only base-virtualbox-iso base.json
```

* VMのディスクサイズを変更する

デフォルトは40GB

20GBにしたい。
```
packer build --var 'disk_size_mb=20480' base.json
```

* Macbook Air 2013 でのエラー対応

kickstartのファイルに```unsupported_hardware```を追加する必要があります。
追加済みのks_fileを使用する方法

```
packer build --var 'ks_file=ks.unsupported_hardware.cfg' base.json
```

* 複数 var を追加する場合

複数回 --var を指定して下さい。

```
packer build --var 'disk_size_mb=20480' --var 'ks_file=ks.unsupported_hardware.cfg' base.json
```
