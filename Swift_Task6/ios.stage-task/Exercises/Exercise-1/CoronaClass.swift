import Foundation

class CoronaClass {
 
     var seats = [Int]()
     var seatsNumber = 0
     var binarySeats = [Int]()
//    var availableSeats = [(firstIndex: Int, distance: Int)]()
     init(n: Int) {
        var i = 0
        while i<n {
            binarySeats.append(0)
            i = i + 1
        }
        seatsNumber = n-1
     }
     
     func seat() -> Int {
        if seats.isEmpty {
            seats.append(0)
            binarySeats[0] = 1
            return 0
        }else {
            var availableSeats = [(firstIndex: Int, distance: Int)]()
//            var evalibleSeat : (firstIndex : Int,distance : Int)? = nil
            for index in (0 ..< binarySeats.count) {
                if binarySeats[index] == 0 {
                    if availableSeats.isEmpty {
                        availableSeats.append((index , 1))
                    }else{
                        availableSeats[availableSeats.count-1].distance = availableSeats.last!.distance + 1
                    }
                }else {
                    if !availableSeats.isEmpty && index != binarySeats.count-1 && binarySeats[index+1] == 0{
                        availableSeats.append((index+1,0))
                    }
                }
            }
            if !availableSeats.isEmpty {
                var nearestMaximum = (0,-1)
                for index in (0 ..< availableSeats.count) {
                    if index == availableSeats.count-1 && binarySeats.last  == 0 {
                        if availableSeats[index].distance > nearestMaximum.1   {
                            nearestMaximum = (availableSeats[index].0 ,availableSeats[index].1 - 1 )
                        }
                    }else if binarySeats[0] == 0 && index == 0{
                            nearestMaximum = (availableSeats[index].0 ,availableSeats[index].1 - 1 )
                    }else{
                        if availableSeats[index].distance % 2 == 0 {
                            availableSeats[index].distance = availableSeats[index].distance - 1
                        }
                        if availableSeats[index].distance / 2 > nearestMaximum.1   {
                            nearestMaximum = (availableSeats[index].0 ,availableSeats[index].1 / 2 )
                        }
                    }
                }
                let newSeat = nearestMaximum.0 == 0 ? 0 : (nearestMaximum.0 + nearestMaximum.1) 
                binarySeats[newSeat] = 1
                seats.append(newSeat)
                seats.sort(by: <)
                return newSeat
            }else{
                return -1
            }
        }
     }
     
     func leave(_ p: Int) {
        let index = seats.firstIndex(of: p)!
        seats.remove(at: index)
        binarySeats[p] = 0
     }
}
