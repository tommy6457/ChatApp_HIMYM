//
//  outgoingTableViewCell.swift
//  ChatApp_HIMYM
//
//  Created by 蔡尚諺 on 2021/12/29.
//

import UIKit

class outgoingTableViewCell: UITableViewCell {

    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var bubbleView: UIView!
    @IBOutlet weak var chatTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func addChatBubble(width: CGFloat , height: CGFloat) {
        // 對話框路徑
        let chatBubblePath = UIBezierPath()
        chatBubblePath.move(to: CGPoint(x: bubbleView.bounds.width , y: 0))
        chatBubblePath.addLine(to: CGPoint(x: bubbleView.bounds.width - width , y: 0))
        chatBubblePath.addLine(to: CGPoint(x: bubbleView.bounds.width - width, y: height))
        chatBubblePath.addLine(to: CGPoint(x: bubbleView.bounds.width - 15, y: height))
        chatBubblePath.addLine(to: CGPoint(x: bubbleView.bounds.width - 15, y: 20))
        chatBubblePath.addLine(to: CGPoint(x: bubbleView.bounds.width , y: 0))
        chatBubblePath.close()
        
        let chatBubbleLayer = CAShapeLayer()
        chatBubbleLayer.path = chatBubblePath.cgPath
        bubbleView.layer.mask = chatBubbleLayer
    }
}
