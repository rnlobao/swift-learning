import UIKit

let totaldecalorias = [50.5, 100]

//lembrar do -> Double que basicamente fala que a função retorna um double
func totalcalorias (totaldecalorias: [Double]) -> Double {
    var total: Double = 0
    for caloria in totaldecalorias {
        total += caloria
    }
    return total
}

let total = totalcalorias(totaldecalorias: [50.5, 100])
print(total)
