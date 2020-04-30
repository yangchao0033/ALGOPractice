//
// Created by 超杨 on 2020/4/27.
// Copyright (c) 2020 superYang. All rights reserved.
//

import Foundation
import AppKit

class ClassNameHelper {
    private static func className(by urlStr: String) -> String? {
        guard !urlStr.isEmpty else { return nil }
        guard let linkUrl = URL(string: urlStr) else { return nil }
        var res: String?
        let components = linkUrl.pathComponents
        var index = components.count - 1
        while index >= 0 {
            if components[index] == "problems" && index < components.count - 1 {
                res = components[index + 1]
                break
            }
            index -= 1
        }
        res = res?.capitalized.replacingOccurrences(of: "-", with: "")
        return res
    }
    static func classNamePrinter(by urlStr: String) {
        print(className(by: urlStr) ?? "数据不合法")
    }
    static func classNamePasteGet() {
        let pb = NSPasteboard.general
        let content: String? = pb.readObjects(forClasses: [NSString.self], options: nil)?.first as? String
        if let text = className(by: content ?? "类名生成失败") {
            pb.clearContents()
            let success =  pb.setString(text, forType: .string)
            if !success { print("设置剪切板失败") } else { print("成功获取类名") }
        } else {
            print("类名获取失败 by yang")
        }
    }
}
