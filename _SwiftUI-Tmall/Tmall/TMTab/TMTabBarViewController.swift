//
//  TMTabBarViewController.swift
//  Tmall
//
//  Created by panzhijun on 2019/8/23.
//  Copyright © 2019 panzhijun. All rights reserved.
//

import SwiftUI


/// 底部控制器
struct TMTabBarViewController: UIViewControllerRepresentable {
    
    /// 定义为Tabbar类型
    typealias UIViewControllerType = UITabBarController
    
    /// 子控制器
    var childControlls: [UIViewController]
    
    /// 数组
    var tabbarDatas: [TabBarItem]
    
    /// 当前选中的index
    @Binding var selectedIndex: Int
    
    
    /// 创建控制器
    func makeUIViewController(context: UIViewControllerRepresentableContext<TMTabBarViewController>) -> UITabBarController {
        
        let tabBarViewController = UITabBarController(
        )
        tabBarViewController.viewControllers = childControlls
        
        for (index,item) in childControlls.enumerated() {
            
            /// 读取数据
            let tabdata = tabbarDatas[index]
            
            let tabBarItem = UITabBarItem(title: tabdata.title, image: UIImage(named: tabdata.imgNormal), selectedImage: UIImage(named: tabdata.imgSelect)?.withRenderingMode(.alwaysTemplate))
            
            item.tabBarItem = tabBarItem
        }
        tabBarViewController.selectedIndex = selectedIndex
        tabBarViewController.tabBar.tintColor = .red
        /// 设置代理
        tabBarViewController.delegate = context.coordinator
        return tabBarViewController
        
        
    }
    
    func updateUIViewController(_ uiViewController: UITabBarController, context: UIViewControllerRepresentableContext<TMTabBarViewController>) {
        
        uiViewController.setViewControllers(childControlls, animated: true)
        
    
        
    }
    
    func makeCoordinator() -> TMTabBarViewController.Coordinator {
        Coordinator(self)
    }
    
    
    // 协调者
    class Coordinator: NSObject,UITabBarControllerDelegate {
        var parent: TMTabBarViewController
        init(_ parent: TMTabBarViewController) {
            self.parent = parent
        }
        
        /// 点击选中的代理
        func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
            parent.selectedIndex = tabBarController.selectedIndex
        }
    }
    

    
    
    
}


