###Youtube 演示视频：
https://www.youtube.com/watch?v=-59238_PxgI

###Github 代码：
https://github.com/zhaorui/PbDemo


拷贝内容到剪贴板
```
let content = "hello world"
let pb = NSPasteboard.general()
pb.clearContents()
pb.writeObjects([content as NSString])
```
从剪贴板读取内容
```
let pb = NSPasteboard.general()
let content = pb.readObjects(forClasses: [NSString.self], options: nil)
```
使用NSPasteboardItem
```
for item in pb.pasteboardItems ?? [] {
    if let str = item.string(forType: kPublicUrl) {
        textView.string = "url: \(str)"
    } else if let str = item.string(forType: kPublicUrlName) {
        textView.string = "url name: \(str)"
    } else {
        let str = item.string(forType: NSPasteboardTypeString)
        textView.string = str
    }
}
```
NSPasteboardItem使用UTI来获取剪贴板内容，**NSPasteboardTypeString**就是一种UTI，Chrome浏览器中地址栏复制到剪贴板后，其UTI为**public.url**

###了解UTI
* https://developer.apple.com/library/content/documentation/General/Conceptual/DevPedia-CocoaCore/UniformTypeIdentifier.html
* https://developer.apple.com/library/content/documentation/Miscellaneous/Reference/UTIRef/Articles/System-DeclaredUniformTypeIdentifiers.html#//apple_ref/doc/uid/TP40009259-SW1
* https://developer.apple.com/reference/mobilecoreservices/uttype#//apple_ref/doc/uid/TP40008771

##支持我！
我是蓝灯代理商，蓝灯是一款简单易用的翻墙工具，https://github.com/getlantern/lantern
欢迎试用，需要升级专业版的同学可以微信我喔, 13809627140
