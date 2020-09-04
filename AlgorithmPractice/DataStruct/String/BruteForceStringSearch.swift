//
// Created by 超杨 on 2020/8/24.
// Copyright (c) 2020 superYang. All rights reserved.
//

extension String {
    func indexOf(_ pattern: String) -> String.Index? {
        for i in self.indices {
            var j = i
            var found = true
            for p in pattern.indices {
                if j == self.endIndex || self[j] != pattern[p] {
                    found = false
                    break
                } else {
                    j = self.index(after: j)
                }
            }
            if found {
                return i
            }
        }
        return nil
    }
}
