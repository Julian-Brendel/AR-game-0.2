//
//  SceneManager.swift
//  AR try 0.1
//
//  Created by denys pashkov on 13/11/2019.
//  Copyright © 2019 denys pashkov. All rights reserved.
//

import UIKit

class MemesClass {
    
    var memeDict: [Int:Meme] = [
        0:
            Meme(imageName: "box", description: "\"Me, also me: \"refers to the snowclone template \"Me: X Also me: Y.\" In the template, \"X\" represents something laudatory about one's self, while \"Y\" contradicts \"X.\" This meme is similar to Evil Kermit. The earliest known iteration appeared on March 29th, 2015, on Twitter", name: "Me every weekend", hint: "--"),
        1:
            Meme(imageName: "bottle", description: "It's a Surprise Tool That Will Helps Us Later: is a screenshot from the Disney Channel animated television series Mickey Mouse Clubhouse. The meme generally keeps the image of Mickey saying the line, \"it's a surprise tool that will help us later,\" while the caption indicates that the surprise tool is something outside the realm of the Disney universe. The cartoon series premiered on May 6th 2006, but it started to become viral in 2017", name: "Caesar's assassination", hint: "--"),
        2:
            Meme(imageName: "guitar", description: "Go Home, You Are Drunk: is an expression used to point out someone else's failure or misplaced objects, similar to other well-known dismissive statements like You're Doing It Wrong and Buzzkilling. The phrase is typically featured in image macros in which the subject is performing a task incorrectly or found in an out-of-place position. It became viral in 2012 ", name: "Drunk guitar", hint: "--"),
        3:
            Meme(imageName: "trash", description: "Know your fucking place, trash: refers to a memorable scene from a video by YouTuber Filthy Frank(05/04/2016). Online, still images from the video have been used as macros and exploitables. After one month people started to share this meme.", name: "Know your place", hint: "--"),
        4:
            Meme(imageName: "water", description: "Scissors vs. Water: also known as Cutting Water With Scissors, refers to an exploitable stock image of a stream of tap water being cut by a pair of scissors. In January 2019, the image was circulated as an object-labeling meme illustrating various futile actions.", name: "Every gamers' problem", hint: "--"),
        5:
            Meme(imageName: "tablet", description: "Tech Support Gandalf is an advice animal character based on a behind-the-scene photograph of British actor Ian McKellen using a laptop computer while dressed in his Gandalf costume on the set of the 2012 epic fantasy film The Hobbit. The series portrays the actor as a tech-savvy wizard who offers troubleshooting tips and commentaries on social media phenomena. This meme became viral in 2014", name: "Gandalf ", hint: "--")
    ]
    
    // save the index for the found meme in plist
    func storeFoundMeme(){
        
        let archiveURL = Bundle.main.url(forResource: "FoundMemes", withExtension: "plist")!
        
        // store the index of the memes found
        var foundMemeNames: [Int] = []
        for (key, meme) in memeDict {
            if meme.found {
                foundMemeNames.append(key)
            }
        }
        
        let encoded = try? PropertyListEncoder().encode(foundMemeNames)
        try? encoded?.write(to: archiveURL, options: .noFileProtection)
        
    }
    
    // load found memes from plist file and set found to true
    func loadFoundMemes(){
        
        if  let archiveURL = Bundle.main.url(forResource: "FoundMemes", withExtension: "plist"),
            let retrivedNotesData = try? Data(contentsOf: archiveURL),
            let foundIndecies = try? PropertyListDecoder().decode([Int].self, from: retrivedNotesData) {
            
            for index in foundIndecies {
                memeDict[index]!.found = true
            }
            
        }
    }
    
}

let memeDatabase = MemesClass()