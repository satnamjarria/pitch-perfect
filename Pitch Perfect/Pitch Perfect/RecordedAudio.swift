//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by Singh, Satnam on 2/24/15.
//  Copyright (c) 2015 Singh, Satnam. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject{
    var filePathUrl: NSURL
    var title: String
    init(filePathUrl:NSURL, title:String){
        self.filePathUrl = filePathUrl
        self.title = title
    }
}