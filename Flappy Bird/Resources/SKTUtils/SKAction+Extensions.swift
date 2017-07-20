/*
 * Copyright (c) 2013-2014 Razeware LLC
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
//  如遇到问题或有更好方案，请通过以下方式进行联系
//      QQ：812144991
//      Email：Keen_Team@163.com
//      GitHub：https://github.com/KeenTeam1990/MGFlappy-Bird.git
import SpriteKit

public extension SKAction {
  /**
   * Performs an action after the specified delay.
   */
  public class func afterDelay(delay: TimeInterval, performAction action: SKAction) -> SKAction {
    return SKAction.sequence([SKAction.wait(forDuration: delay), action])
  }

  /**
   * Performs a block after the specified delay. dispatch_block_t
   */
  public class func afterDelay(delay: TimeInterval, runBlock block:@escaping (() -> ())) -> SKAction {
    return SKAction.afterDelay(delay: delay, performAction: SKAction.run(block))
  }

  /**
   * Removes the node from its parent after the specified delay.
   */
  public class func removeFromParentAfterDelay(delay: TimeInterval) -> SKAction {
    return SKAction.afterDelay(delay: delay, performAction: SKAction.removeFromParent())
  }

  /**
   * Creates an action to perform a parabolic jump.
   */
  public class func jumpToHeight(height: CGFloat, duration: TimeInterval, originalPosition: CGPoint) -> SKAction {
    return SKAction.customAction(withDuration: duration) {(node, elapsedTime) in
      let fraction = elapsedTime / CGFloat(duration)
      let yOffset = height * 4 * fraction * (1 - fraction)
      node.position = CGPoint(x: originalPosition.x, y: originalPosition.y + yOffset)
    }
  }
}
