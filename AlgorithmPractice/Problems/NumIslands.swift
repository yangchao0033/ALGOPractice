//
// Created by 超杨 on 2020/4/20.
// Copyright (c) 2020 superYang. All rights reserved.
//

import Foundation

class NumIslands {
    func numIslands(_ grid: [[Character]]) -> Int {
        guard !grid.isEmpty else {
            return 0
        }
        var grid = grid
        let nr = grid.count // 网格格子数
        let nc = grid[0].count // 网格列数
        var islandsNum = 0
        for r in 0..<nr {
            for c in 0..<nc where grid[r][c] == "1" {
                islandsNum += 1
                dfs(&grid, r, c)
            }
        }
        return islandsNum
    }

    private func dfs(_ grid: inout [[Character]], _ r: Int, _ c: Int) {
        let nr = grid.count
        let nc = grid[0].count
        if r < 0 ||
                   c < 0 ||
                   r >= nr ||
                   c >= nc ||
                   grid[r][c] == "0" {
            return
        }
        grid[r][c] = "0"
        dfs(&grid, r - 1, c)
        dfs(&grid, r + 1, c)
        dfs(&grid, r, c - 1)
        dfs(&grid, r, c + 1)
    }
}
