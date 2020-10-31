//
//  ProfileViewController.swift
//  Submission-Capstone
//
//  Created by Windy on 30/10/20.
//

import AsyncDisplayKit

class ProfileViewController: ASDKViewController<ASScrollNode> {
    
    let highlightNode: HighlightNode
    
    let emailCell: ProfileCellNode
    let educationCell: ProfileCellNode
    let numberCell: ProfileCellNode
    let locationCell: ProfileCellNode
    let achievementCell: ProfileCellNode
    let hobbyCell: ProfileCellNode
    let githubLink: ProfileCellNode
    let linkedInLink: ProfileCellNode
    
    override init() {
        
        highlightNode = HighlightNode(image: "profile", name: "Windy", expert: "iOS Developer")
        emailCell = ProfileCellNode(label: "Email", content: "windywu812@gmail.com")
        educationCell = ProfileCellNode(label: "Education", content: "Information System")
        numberCell = ProfileCellNode(label: "Number", content: "089647527757")
        locationCell = ProfileCellNode(label: "Location", content: "Batam")
        achievementCell = ProfileCellNode(label: "Achievement", content: "Dicoding Graduate")
        hobbyCell = ProfileCellNode(label: "Hobby", content: "Coding")
        linkedInLink = ProfileCellNode(label: "LinkedIn", content: "Windy Windy")
        githubLink = ProfileCellNode(label: "Github", content: "https://github.com/windywu812")
        
        super.init(node: ASScrollNode())
        
        node.automaticallyManagesContentSize = true
        node.automaticallyManagesSubnodes = true
        
        node.layoutSpecBlock = { _, _ in
            
            let aboutMeStack = ASStackLayoutSpec(
                direction: .vertical,
                spacing: 24,
                justifyContent: .start,
                alignItems: .center,
                children: [self.emailCell,
                           self.educationCell,
                           self.numberCell,
                           self.locationCell,
                           self.achievementCell,
                           self.hobbyCell,
                           self.linkedInLink,
                           self.githubLink])
            
            aboutMeStack.style.width = ASDimension(unit: .fraction, value: 1)
     
            let mainStack = ASStackLayoutSpec(
                direction: .vertical,
                spacing: 32,
                justifyContent: .start,
                alignItems: .center,
                children: [self.highlightNode, aboutMeStack])
            
            return ASInsetLayoutSpec(
                insets: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16),
                child: mainStack)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
