//
//  incomingTableViewCell.swift
//  ChatApp_HIMYM
//
//  Created by 蔡尚諺 on 2021/12/28.
//

import UIKit

class incomingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var chatTextView: UITextView!
    @IBOutlet weak var bubbleView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func addChatBubble(width: CGFloat , height: CGFloat) {
        // 對話框路徑
        let chatBubblePath = UIBezierPath()
        chatBubblePath.move(to: CGPoint(x: 15, y: 0))
        chatBubblePath.addLine(to: CGPoint(x: width , y: 0))
        chatBubblePath.addLine(to: CGPoint(x: width , y: height))
        chatBubblePath.addLine(to: CGPoint(x: 15, y: height))
        chatBubblePath.addLine(to: CGPoint(x: 15, y: 20))
        chatBubblePath.addLine(to: CGPoint(x: 0, y: 0))
        chatBubblePath.close()
        
        let chatBubbleLayer = CAShapeLayer()
        chatBubbleLayer.path = chatBubblePath.cgPath
        
        bubbleView.layer.mask = chatBubbleLayer
    }
}
