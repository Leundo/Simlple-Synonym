# Simple Synonym
这是一个命令行英语近义词查询工具，由 Swift 提供支持。  
目前为版本为 `0.1.0`。

## 安装(macOS)
    $ cd simsyn/simsyn
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

    simsyn -n 15 increase
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

