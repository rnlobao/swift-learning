func compositionCheck(input: String) -> Bool {
    var firstName = 0
    var secondName = -1
    var isItSecondName = false
        for chr in input {
            if chr == " " || isItSecondName == true {
                secondName += 1
                isItSecondName = true
            }
            else {
                firstName += 1
            }
        }
    if firstName > 1 && secondName > 1 {
        return true
    }
    return false
}

compositionCheck(input: "aa aa")
