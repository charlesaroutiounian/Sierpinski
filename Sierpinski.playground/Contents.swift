import UIKit
import PlaygroundSupport

class DrawingView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // Drawing code here.
        let path = UIBezierPath(rect: rect)
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0))
        path.lineWidth = 1.0
        path.stroke()
        
        subTriangle(1, x1: (0 + self.frame.size.width/2) / 2, y1: (0 + self.frame.size.height) / 2, x2: (0 + self.frame.size.width) / 2, y2: (0 + 0) / 2, x3: (self.frame.size.width/2 + self.frame.size.width) / 2, y3: ( self.frame.size.height + 0) / 2)
    }
    
    func subTriangle(_ n: Int, x1: CGFloat, y1: CGFloat, x2: CGFloat, y2: CGFloat, x3: CGFloat ,y3: CGFloat) {
        // Drawing code here.
        let path = UIBezierPath()
        path.move(to: CGPoint(x: x1, y: y1))
        path.addLine(to: CGPoint(x: x2, y: y2))
        path.addLine(to: CGPoint(x: x3, y: y3))
        path.lineWidth = 1.0
        path.stroke()
        
        if (n<10){
            
            subTriangle(n+1, x1: (x1 + x2) / 2 + (x2 - x3) / 2, y1: (y1 + y2) / 2 + (y2 - y3) / 2, x2: (x1 + x2) / 2 + (x1 - x3) / 2, y2:(y1 + y2) / 2 + (y1 - y3) / 2, x3:(x1 + x2) / 2, y3:(y1 + y2) / 2 )
            
            subTriangle(n+1, x1: (x3 + x2) / 2 + (x2 - x1) / 2, y1: (y3 + y2) / 2 + (y2 - y1) / 2, x2: (x3 + x2) / 2 + (x3 - x1) / 2, y2:(y3 + y2) / 2 + (y3 - y1) / 2, x3: (x3 + x2) / 2, y3:(y3 + y2) / 2 )
            
            subTriangle(n+1, x1: (x1 + x3) / 2 + (x3 - x2) / 2, y1: (y1 + y3) / 2 + (y3 - y2) / 2, x2: (x1 + x3) / 2 + (x1 - x2) / 2, y2:(y1 + y3) / 2 + (y1 - y2) / 2, x3: (x1 + x3) / 2, y3:(y1 + y3) / 2 )
        }
        
        
    }
}

let drawingView = DrawingView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
drawingView.layer.transform = CATransform3DMakeRotation(CGFloat.pi, 0, 0, 1)

drawingView.backgroundColor = .white


PlaygroundPage.current.liveView = drawingView

