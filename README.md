ParentCtrlApp4iPhone
====================

# 版本描述

* m4: 实现基本的自定义TableView
* m3sp1：对m3中bug的纠正，即表单的条目，无法接收到touch相关事件
* m3: 初步实现首页的自定义列表和横向滑动删除条目
* m2: 初步实现完整的项目界面
* m1: 解释最基本的界面组装方式，实现首页的左侧的导航菜单交互

# 配置和运行项目

本项目使用了CocoaPods。

## 依赖库

使用CocoaPods，安装了如下项目需要的项目：

* AFNetworking  用于HTTP+JSON访问
* OHHTTPStubs   用于针对HTTP的Mock测试


## pod的安装

见[cocoapods](http://cocoapods.org/)

  $ sudo gem install cocoapods


## pod安装项目库

在项目目录下执行：

$ pod install

注意，打开项目，需要打开`xcworkspace`扩展名的文件，别打开`xcodeproj`结尾文件

如果你能看youtube，可看导入项目的完整视频：http://youtu.be/6y-dgXHGENU

