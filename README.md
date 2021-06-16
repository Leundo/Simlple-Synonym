# Simple Synonym
***已经停止支持***  
作为托福考试的助手程序与Swift爬虫实践，考完后就失去了维护的动力。  
这是一个命令行英语近义词查询工具，由 Swift 提供支持。  
目前为版本为 `0.2.0`。

## 安装(macOS或Linux)
    $ cd simsyn
    $ swiftc -o simsyn main.swift Request.swift Regular.swift IO.swift
编译完成后产生目标程序 simsyn。
把 simsyn 文件链接进入 `$PATH` 直接在 Terminal 使用。

## 示例
    $ simsyn increase
    rise
    enhance
    grow
    raise
    improve
    boost
    strengthen
    expand
    augment
    enlarge
默认输出10个近义词。

    $ simsyn -n 15 increase
    rise
    enhance
    grow
    raise
    improve
    boost
    strengthen
    expand
    augment
    enlarge
    growth
    intensify
    escalate
    amplify
    magnify
使用 `-n` 设置输出的近义词数量，范围为 0-50。

## 人机验证
当输出以下语句时

    error: be treated as a robot. go to https://www.powerthesaurus.org to finish reCAPTCHA test
说明触发网站的反爬措施。此时只要到 https://www.powerthesaurus.org 通过谷歌人机验证即可。
