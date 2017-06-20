//
//  Globals.swift
//  iBun
//
//  Created by h on 13.06.17.
//  Copyright © 2017 h. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit
import QuartzCore
import SceneKit

class Globals
{
    static let CollisionCategoryPlayer : UInt32 = 0x1 << 1
    static let CollisionCategoryShot   : UInt32 = 0x1 << 2
    static let CollisionCategoryEnemy  : UInt32 = 0x1 << 3
    
    class func rand(min:CGFloat, max:CGFloat) -> CGFloat
    {
        return CGFloat(arc4random_uniform(UInt32(max - min)) + UInt32(min));
    }
    class func node(name:String, ext:String, id:String) -> SCNNode
    {
        let path = Bundle.main.path(forResource:name/*"d3.scnassets/landscape"*/, ofType:ext/*"dae"*/)
        let url : URL = URL.init(fileURLWithPath: path!)
        //[SceneKit] Error: COLLADA files are not supported on this platform  ===>  put your dae files into scnassets!
        let sceneSource = SCNSceneSource.init(url: url, options: nil)
        //<geometry id="Grid-mesh" name="Grid">
        let scnNode = sceneSource?.entryWithIdentifier(id/*"Grid"*/, withClass:SCNNode.self);
        return scnNode!;
    }
    
    class func matsFromPic(pathFN:String, ext:String) -> [SCNMaterial]
    {
        //let path = Bundle.main.path(forResource:"meadow/meadow"+String(threeOrFive ? "3" : "5"), ofType:"gif")
        let path = Bundle.main.path(forResource:pathFN, ofType:ext)
        let url : URL = URL.init(fileURLWithPath: path!)
        let i:UIImage = UIImage.animatedImage(withAnimatedGIFURL:url)!
        var materials = [SCNMaterial]()
        let material = SCNMaterial()
        material.diffuse.contents = i
        materials.append(material);
        return materials;
        
    }
}
