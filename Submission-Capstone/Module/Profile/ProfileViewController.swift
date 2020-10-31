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
    
    private let presenter: ProfilePresenter
    
    init(presenter: ProfilePresenter) {
        
        self.presenter = presenter
        
        highlightNode = HighlightNode(
            image: presenter.profile.image,
            name: "Windy",
            expert: "iOS Developer")
        
        emailCell = ProfileCellNode(
            label: "Email",
            content: presenter.profile.email)
        
        educationCell = ProfileCellNode(
            label: "Education",
            content: presenter.profile.education)
        
        numberCell = ProfileCellNode(
            label: "Number",
            content: presenter.profile.number)
        
        locationCell = ProfileCellNode(
            label: "Location",
            content: presenter.profile.location)
        
        achievementCell = ProfileCellNode(
            label: "Achievement",
            content: presenter.profile.achievement)
        
        hobbyCell = ProfileCellNode(
            label: "Hobby",
            content: presenter.profile.hobby)
        
        linkedInLink = ProfileCellNode(
            label: "LinkedIn",
            content: presenter.profile.linkedin)
        
        githubLink = ProfileCellNode(
            label: "Github",
            content: presenter.profile.github)
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) {
            self.view.alpha = 1
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn) {
            self.view.alpha = 0
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
