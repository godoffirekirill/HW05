import Cocoa
// 1 наименьшее общее кратное алгоритм посчитать
func gcd3(a: Int, b: Int) -> Int {

    if a <= 0 || b <= 0 {
        print ("no GCD")
        return 0
    }
//
    func gcd3_(a: Int, b: Int) -> Int {

        if b == 0 {
            return a
        }
        return gcd3_(a: b, b: a % b)

    }

    return gcd3_(a: a, b: b)
}

gcd3(a: 126, b: 70)

func lcm(a: Int, b:Int) -> Int {

    return (a * b) / gcd3(a: a, b: b)

}
lcm(a: 126, b: 70)
// 2 написать ф-цию возведения в степень // ф-циональным или процедурным

func exponentiation(a: Int, n: Int) -> Int {
    var a = a
    var n = n
    while n != 0 {
        a *= a
        n -= n
    }
    return a
}
exponentiation(a: 2, n: 2)

func fastPow(_ number: Int, _ exponent: Int) -> Int {
    if exponent == 0 {
        return 1
    }
    var result = 1
    var number = number
    var exp = exponent

    while exp > 0 {
        if exp % 2 == 1 {
            result *= number
        }
        number *= number
        exp /= 2
    }
    return result
}
print("\(fastPow(2, 8))")

func fastPowTWo(_ number: Int, _ exponent: Int) -> Int {
    guard exponent > 0 else { return 1 }

    func fastPowRec(_ base: Int, _ exp: Int) -> Int {
        guard exp > 0 else { return 1 }
        let result = (exp % 2 == 0) ? 1 : base
        let newBase = base * base
        return result * fastPowRec(newBase, exp / 2)
    }

    return fastPowRec(number, exponent)
}
// 4 тест простоты википедиа тест люка лемера ризеля - получить простое число

func isPrimeOptimized(_ number: Int) -> Bool {
    if number < 2 {
        return false
    }
    if number == 2 || number == 3 {
        return true
    }
    if number % 2 == 0 || number % 3 == 0 {
        return false
    }
    var i = 5
    while i * i <= number {
        if number % i == 0 || number % (i + 2) == 0 {
            return false
        }
        i += 6
    }
    return true
}

func main() {
    for i in 1..<1000 {
        if isPrimeOptimized(i) {
            print(i)
        }
    }
}

main()

