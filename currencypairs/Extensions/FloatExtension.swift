import Foundation

extension Float {
    func rounded(toDigits: Int) -> Float {
        let multiplier = pow(10.0, Float(toDigits))
        return (self * multiplier).rounded() / multiplier
    }
}
