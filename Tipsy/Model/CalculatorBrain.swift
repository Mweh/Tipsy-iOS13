struct CalculatorBrain {
    var tip:Float = 0.1
    var split:Float = 2.0
    var totalBill: Float = 0.0
    var finalBil:Float?
    
    mutating func calculateBil(tB: Float, t: Float, s: Float) -> Float{
        finalBil = (tB+(tB*t))/s
        return finalBil ?? 0.0
    }
    
    func settingsLabelText(numberOfPpl: Int, tipPct: Int) -> String{
        return "Split between \(numberOfPpl) people, with \(tipPct)% tip."
    }
}
