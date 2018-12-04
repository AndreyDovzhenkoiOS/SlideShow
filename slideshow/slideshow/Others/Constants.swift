//
//  Constants.swift
//  SlideShow
//
//  Created by Andrey on 17.07.2018.
//  Copyright © 2018 Andrey Dovzhenko. All rights reserved.
//

import Foundation

enum Constants {
    static let numberSelected = "Selected:" + " "
    static let numberSlide = "Slide:" + " "
    static let viewConrtoller = "ViewController"
    static let isUrl = "https://"
    static let isCom = ".com"
    
    enum Sounds {
        enum SoundNames {
            static let select = "select"
        }
        
        enum Types {
            static let mp3 = "mp3"
        }
    }
    
    enum Alerts {
        static let cancel = "Cancel"
        static let settings = "Settings"
        static let delete = "Delete"
        static let message = "Message"
        static let addUrl = "To add a new picture, enter URL image"
        static let url = "Url"
        static let add = "Add"
    }
    
    static let animationNames = ["Flip Right", "Flip Left", "Flip Bottom", "Flip Up",
                                 "Curl Up", "Curl Down", "Cross Dissolve", "Show Hide"]
    
    static let urls = ["https://images8.alphacoders.com/935/thumb-1920-935575.jpg",
                       "https://images5.alphacoders.com/364/thumb-1920-364407.jpg",
                       "https://images6.alphacoders.com/938/thumb-1920-938573.jpg",
                       "https://images7.alphacoders.com/389/thumb-1920-389282.jpg",
                       "https://images5.alphacoders.com/472/thumb-1920-472815.jpg",
                       "https://images4.alphacoders.com/844/thumb-1920-844967.jpg",
                       "https://images4.alphacoders.com/710/thumb-1920-710790.jpg",
                       "https://images3.alphacoders.com/718/thumb-1920-718660.jpg",
                       "https://images8.alphacoders.com/913/thumb-1920-913050.jpg",
                       "https://images4.alphacoders.com/718/thumb-1920-718656.jpg",
                       "https://images.alphacoders.com/927/thumb-1920-927633.jpg",
                       "https://images5.alphacoders.com/912/thumb-1920-912442.jpg",
                       "https://images5.alphacoders.com/718/thumb-1920-718657.jpg",
                       "https://images4.alphacoders.com/787/thumb-1920-787553.jpg",
                       "https://images3.alphacoders.com/963/thumb-1920-96377.jpg",
                       "https://images.alphacoders.com/273/thumb-1920-273103.jpg",
                       "https://images.alphacoders.com/502/thumb-1920-502329.jpg",
                       "https://images5.alphacoders.com/637/thumb-1920-637668.jpg",
                       "https://images.alphacoders.com/226/thumb-1920-226091.jpg",
                       "https://images.alphacoders.com/307/thumb-1920-307471.jpg",
                       "https://images7.alphacoders.com/334/thumb-1920-334120.jpg",
                       "https://images.alphacoders.com/220/thumb-1920-220983.jpg",
                       "https://dsocdn.akamaized.net/Assets/Images_Upload/2013/03/04/veneno1.jpg",
                       "https://dynaimage.cdn.cnn.com/cnn/q_auto,w_1024,c_fill,g_auto,h_576,ar_16:9/http%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F161217142430-2017-cars-ferrari-1.jpg",
                       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLrwz1mV8WyWgNkdTTqUeX8I385J3jK0Qexie1pi4VtfVNjcED",
                       "https://wallpapersite.com/images/wallpapers/mercedes-amg-gt-c-roadster-5120x2880-2018-cars-mercedes-benz-4k-2320.jpeg",
                       "https://www.popsci.com/sites/popsci.com/files/styles/1000_1x_/public/images/2018/03/senna.jpg?itok=eYNPMGjA&fc=50,50",
                       "https://s2.bukalapak.com/img/7046434761/w-1000/project_cars_2_pc_screenshot_wwwovagamescom_3_scaled.jpg",
                       "https://st.overclockers.ru/images/soft/2012/07/03/cars_2_big.jpg",
                       "https://images6.alphacoders.com/937/thumb-1920-937232.jpg"]
}

enum Notifications{
    static let notificationNameUpdate = Notification.Name("notificationNameUpdate")
}

enum Transitions {
    case present, show, push, dismiss, popRoot, pop
}
