//
//  main.swift
//  SwiftyPCA9685
//
//  Created by Claudio Carnino on 09/08/2016.
//  Copyright © 2016 Tugulab. All rights reserved.
//

import Glibc


let pwmFrequency = 1000

print("Set 100% duty cycle on all channels (\(pwmFrequency)Hz)")

do {
    let smBus = try SMBus(busNumber: 1)
    let module = try PCA9685Module(smBus: smBus, address: 0x40)
    try module.set(pwmFrequency: pwmFrequency)
    
    // Set the 100% duty cycle on all channels
    for channel in PCA9685Module.Channel.channelsList {
        try module.write(channel: channel, dutyCycle: 1.0)
    }
    
} catch let error {
    print(error)
}
