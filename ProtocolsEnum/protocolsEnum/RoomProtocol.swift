//
//  RoomProtocol.swift
//  protocolsEnum
//
//  Created by Luat on 5/25/21.
//

import UIKit

/**
 0) Have house adopt home protocol and implement print motto
 1) Create Protocol room, should have:
 property:
  - wallpaperColor: UIColor? (built in enum)
  - needsRepair: Bool?
  - value: Int?
 2) Home protocol should enforce a property rooms (array of any room)
  - a room can be of type bed room, living room, or dining room
 3) House
  property:
  - needsRepair: Bool (if any room needs repair then house needs repair)
  Functions:
  - getValue() -> Int (get the total value of each room)
 */
struct House: Home {
    func printMotto() {
        print("Laugh it up Fuzzball")
    }
    
    var rooms: [Room]?
    
    var needsRepair: Bool { get { return self.neededRepair()}}//uses helper function "neededRepair"
    func neededRepair() -> Bool { //built helper function to check if ANY room needs repair
        if let rooms = self.rooms {
            for room in rooms {
                if let bool = room.needsRepair {
                    if bool {
                        return true
                    }
                }
            }
        }
        return false
    }
    func getValue() -> Int {
        var value = 0
        if let tempRoom = self.rooms {
            for room in tempRoom {
                value += room.value ?? 0
            }
        }
       return value
    }
    
}
struct BedRoom: Room {
    var value: Int?
    
    var wallpaperColor: UIColor?
    
    var needsRepair: Bool?
}

struct LivingRoom: Room {
    var value: Int?
    
    var wallpaperColor: UIColor?
    
    var needsRepair: Bool?
}

struct DiningRoom: Room {
    var value: Int?
    
    var wallpaperColor: UIColor?
    
    var needsRepair: Bool?
}

protocol Home {
    func printMotto()
    var rooms: [Room]? { get set }
    func getValue() -> Int
}

protocol Room {
    var value: Int? { get set }
    var wallpaperColor: UIColor? { get set }
    var needsRepair: Bool? { get set }
}
