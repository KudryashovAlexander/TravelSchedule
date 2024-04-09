import SwiftUI


extension Font {
    
    enum Regular {
        static var size12: Font { Font.system(size: 12, weight: .regular) }
        static var size17: Font { Font.system(size: 17, weight: .regular) }
        static var size20: Font { Font.system(size: 20, weight: .regular) }
    }
    
    enum Bold {
        static var size17: Font { Font.system(size: 17, weight: .bold) }
        static var size24: Font { Font.system(size: 24, weight: .bold) }
        static var size34: Font { Font.system(size: 34, weight: .bold) }
    }
    
}
