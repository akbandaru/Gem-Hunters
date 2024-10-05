//
//  GameBrain.swift
//  Gem Hunters
//
//  Created by Rajiv Bandaru on 2024-05-06.
//

import Foundation

struct GameBrain
{
    let imageArray: [String] = ["Diamond Element", "Diamond Element 2", "Diamond Element 3"]
    let gemTime: [String: Double] = ["Diamond Element": 1.5, "Diamond Element 2": 1.25, "Diamond Element 3": 1.0]
    let gemScore: [String: Int] = ["Diamond Element": 1, "Diamond Element 2": 2, "Diamond Element 3": 3]
    let gemTune: [String] = ["Diamond", "Diamond2", "Diamond3"]
    var score: Int = 1
    var time: Double = 0.0
    let x_coordinate: [CGFloat]
    let y_coordinate: [CGFloat]
    let height = 120
    let width = 120
    var image: String = ""
    
    func getXcoord() -> CGFloat
    {
        return CGFloat.random(in: x_coordinate[0]...x_coordinate[1])
    }
    func getYcoord() -> CGFloat
    {
        return CGFloat.random(in: y_coordinate[0]...y_coordinate[1])
    }
    mutating func getImage() -> String
    {
        image = imageArray.randomElement()!
        score = gemScore[image]!
        return image
    }
    mutating func getScore() -> Int
    {
        return score
    }
    func getTime() -> Double
    {
        return gemTime[image]!
    }
}
