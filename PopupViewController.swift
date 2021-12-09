// How to calculate max content width for UIPopoverPresentationController 
// if contentViewController has multiple labels with diffrent lenght string
// ex: var descArray = ["Game Of Thrones", "Life Of Pie", "Lord of the Rings", "Harry Potter"]

override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        var size = self.listTableView.contentSize

        // Get max length string from array of string
        var maxDescStr = ""
        if let array = self.descArray as? [String] {
            if let max = array.max(by: {$1.count > $0.count}) {
                print(max)
                maxDescStr = max
            }
        }
        
        // get max px width for max lenght string for description label
        var maxStringWidth = maxDescStr.widthOfString(usingFont: UIFont.systemFont(ofSize: 15.0))
        
        // 112 is a constant calculated value for labels margins and widths
        let constantPx = PopupConstants.Title_Label_Leading + PopupConstants.Title_Label_Width +
            PopupConstants.Title_Label_Trailing +
            PopupConstants.V_Label_Width +
            PopupConstants.V_Label_Trailing +
            PopupConstants.Desc_Label_Trailing
        maxStringWidth += CGFloat(constantPx)
        
        size.width = maxStringWidth
        size.height += 8 // Padding bottom

        print("maxStrWidth: \(maxStringWidth) with size: \(size)")
        self.preferredContentSize = size
    }
    
    enum PopupConstants {
    static let Title_Label_Width = 55
    static let Title_Label_Leading = 16
    static let Title_Label_Trailing = 8
    static let V_Label_Width = 1
    static let V_Label_Trailing = 16
    static let Desc_Label_Trailing = 16
}
