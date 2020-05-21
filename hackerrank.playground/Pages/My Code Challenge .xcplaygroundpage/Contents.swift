//: [Previous](@previous)

import Foundation

/*

 Below we will define an n-interesting polygon.
 Your task is to find the area of a polygon for a given n.

 A 1-interesting polygon is just a square with a side of length 1.
 An n-interesting polygon is obtained by taking the n - 1-interesting
 polygon and appending 1-interesting polygons to its rim, side by side.
 You can see the 1-, 2-, 3- and 4-interesting polygons in the picture below.

 Example:

 n = 1

*

 n = 2

 *
***
 *

 n = 3

  *
 ***
*****
 ***
  *


n = 4
   *
  ***
 *****
*******
 *****
  ***
   *


 */

func shapeArea(n: Int) -> Int {
    if n == 1 { return 1 } else if n == 2 { return 5}

    let polygonHeightWidth = n  + (n - 1)
    let polygonCount = (polygonHeightWidth * 2) - 1

    var outerBoxCount = 0
    for i in 1..<n - 1 {
        outerBoxCount += i * 2
    }
    outerBoxCount *= 2
    return polygonCount + outerBoxCount
}



shapeArea(n: 5)
