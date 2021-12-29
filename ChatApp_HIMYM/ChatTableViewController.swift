//
//  ChatTableViewController.swift
//  ChatApp_HIMYM
//
//  Created by 蔡尚諺 on 2021/12/28.
//

import UIKit

class ChatTableViewController: UITableViewController {
    
    var contents = [Content]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getContent()
       
    }

    func getContent(){
        contents.append(Content(name: .lily, chatText: "Architecture is killing you,Ted,and it's killing us to watch it killing you. You're like that goat with the washcloth. You want it so bad,and every time the world tries to take it away from you,you keep grabbing it.But you know what? It's just a washcloth. Why do you even want it?"))
        contents.append(Content(name: .ted, chatText: "Because I... I have to be an architect. That's...that's the plan."))
        contents.append(Content(name: .lily, chatText: " Screw the plan. I planned on being a famous artist. Marshall planned on being an environmental lawyer. Robin planned on being a TV reporter.Barney planned on being a violinist. Look,you can't design your life like a building.It doesn't work that way.You just have to live it,and it will design itself."))
        contents.append(Content(name: .ted, chatText: "So,what,I should just do nothing?"))
        contents.append(Content(name: .lily, chatText: "No. Listen to what the world is telling you to do and take the leap."))
        contents.append(Content(name: .ted, chatText: "That was the year I got left at the altar.It was the year I got knocked out by a crazy bartender.The year I got fired.The year I got beat up by a goat. A girl goat,at that.And damn it if it wasn't the best year of my life.Because,if any one of those things hadn't happened,I never would have ended up in a which turned out to be the best job I ever had.But more importantly,I wouldn't have met your mother."))
       
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contents.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let content = contents[indexPath.row]
        
        switch content.name{
            
        case .lily:
           let lilyCell = tableView.dequeueReusableCell(withIdentifier: "\(incomingTableViewCell.self)", for: indexPath) as! incomingTableViewCell
            
            lilyCell.chatTextView.text = content.chatText
            lilyCell.headImageView.layer.cornerRadius = lilyCell.headImageView.bounds.width / 2
            
            return lilyCell
            
        case .ted:
            
            let tedCell = tableView.dequeueReusableCell(withIdentifier: "\(outgoingTableViewCell.self)", for: indexPath) as! outgoingTableViewCell
             
            tedCell.chatTextView.text = content.chatText
            tedCell.headImageView.layer.cornerRadius = tedCell.headImageView.bounds.width / 2
            
             return tedCell
            
        }

    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        cell.layoutIfNeeded() //強迫更新UI layout

        if let lilyCell = cell as? incomingTableViewCell {
            //畫對話框
            lilyCell.addChatBubble(width: lilyCell.bubbleView.bounds.width, height: lilyCell.bubbleView.bounds.height)

        } else if let tedCell = cell as? outgoingTableViewCell {
            //畫對話框
            tedCell.addChatBubble(width: tedCell.bubbleView.bounds.width, height: tedCell.bubbleView.bounds.height)

        }

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
