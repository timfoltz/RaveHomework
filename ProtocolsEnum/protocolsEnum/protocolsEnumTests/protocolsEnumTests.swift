//
//  protocolsEnumTests.swift
//  protocolsEnumTests
//
//  Created by Luat on 5/25/21.
//

import XCTest
@testable import protocolsEnum

class protocolsEnumTests: XCTestCase {
    
    // MARK: - Test Temperature Enum
    func testEnumConformsToProtocol() {
        let temp = Temperature.fahrenheit(100)
        let result = temp is GetFarhenheit
        XCTAssert(result, "\(result) should be true")

    }
    func testConvertFromCtoF_Func() {
        if let tempC: GetFarhenheit = Temperature.celcius(100) as? GetFarhenheit {
            let expected = 212
            let result = tempC.getTempInFahrenheit()
            XCTAssertEqual(expected, result, "\(result) should equal \(expected)")
        } else {
            XCTFail()
        }
    }
    
    func testConvertFromKToF_Func() {
        if let tempK: GetFarhenheit = Temperature.kelvin(373) as? GetFarhenheit {
            let expected = 212
            let result = tempK.getTempInFahrenheit()
            XCTAssertEqual(expected, result, "\(result) should equal \(expected)")
        } else {
            XCTFail()
        }
    }
    
    func testConvertFromCtoF_Property() {
        if let tempC: GetFarhenheit = Temperature.celcius(100) as? GetFarhenheit {
            let expected = 212
            let result = tempC.tempInFahren
            XCTAssertEqual(expected, result, "\(result) should equal \(expected)")
        } else {
            XCTFail()
        }
    }

    func testConvertFromKToF_Property() {
        if let tempK: GetFarhenheit = Temperature.kelvin(373) as? GetFarhenheit {
            let expected = 212
            let result = tempK.tempInFahren
            XCTAssertEqual(expected, result, "\(result) should equal \(expected)")
        } else {
            XCTFail()
        }
    }
    
    
    
    // MARK: - Test Protocol House and Room

    func testBedroomIsRoom() {
        let bedroom = BedRoom()
        let result = bedroom is Room
        XCTAssert(result, "\(result) should be true")
    }
    
    func testDiningRoomHasValue() {
        if var diningRoom = DiningRoom() as? Room {
            diningRoom.value = 10_000
            let result = diningRoom.value
            let expected = 10_000
            XCTAssertEqual(expected, result, "\(result) should equal \(expected)")
        } else {
            XCTFail()
        }
    }
    
    func testHouseHasHomeProtocol() {
        let house = House()
        let result = house is Home
        XCTAssert(result, "\(result) should be true")
    }
    
    func testHouseHasRooms() {
        let house = House()
        let rooms = house.rooms
        let result = rooms is [Room]?
        XCTAssert(result, "\(result) should be true")
    }
    
    func testHouseNeedsRepair() {
        var myHouse = House()
        
        let livingR = LivingRoom()
        let diningR = DiningRoom()
        let bedR = BedRoom()
        if var castedBedR = bedR as? Room {
            castedBedR.needsRepair = true
            let rooms: [Any] = [
                castedBedR,
                livingR,
                diningR,
            ]
            if let castedRooms = rooms as? [Room] {
                myHouse.rooms = castedRooms
                let result = myHouse.needsRepair
                
                XCTAssert(result, "\(result) should be true")
            } else {
                XCTFail()
            }
            
        } else {
            XCTFail()
        }
    }
    
    func testHouseValue() {
        var myHouse = House()
        
        let livingR = LivingRoom()
        let diningR = DiningRoom()
        let bedR = BedRoom()
        let rooms: [Any] = [
            bedR,
            livingR,
            diningR,
        ]
        guard let castedRoom = rooms as? [Room] else {
            XCTFail()
            return
        }
        guard let castedHouse = myHouse as? Home else {
            XCTFail()
            return
        }
        let newRooms: [Room] = rooms.map { room in
            if var castedRoom = room as? Room {
                castedRoom.value = 20_000
                return castedRoom
            } else {
                return room as! Room
            }
        }
        myHouse.rooms = newRooms
        
        
        let expected = 60_000
        let result = myHouse.getValue()
        XCTAssertEqual(expected, result, "\(result) should equal \(expected)")
        
    }
}
