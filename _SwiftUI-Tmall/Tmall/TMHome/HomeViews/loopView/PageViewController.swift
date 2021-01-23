//
//  PageViewController.swift
//  Tmall
//
//  Created by panzhijun on 2019/8/23.
//  Copyright © 2019 panzhijun. All rights reserved.
//

import SwiftUI

struct PageViewController: UIViewControllerRepresentable
{
    typealias UIViewControllerType = UIPageViewController
    
    /// 当前页
    @Binding var currentPage: Int
    
    /// 当前页偏移量
    @Binding var offsetX: CGFloat

    /// 传递过来的首页全局数据
    var home: HomeGlobal
    
    var controllers: [UIViewController]
    func makeUIViewController(context: UIViewControllerRepresentableContext<PageViewController>) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal,options: [:])
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator

          /// 获取page内的scrollView
        let scrol = findScrollView(vc: pageViewController)
        scrol.delegate = context.coordinator
        return pageViewController
    }
    
    func updateUIViewController(_ uiViewController: UIPageViewController, context: UIViewControllerRepresentableContext<PageViewController>) {
        uiViewController.setViewControllers([controllers[currentPage]], direction: .forward, animated: true, completion: nil)
    }
    
    func findScrollView(vc: UIPageViewController) -> UIScrollView {
        for item in vc.view!.subviews {
            if item is UIScrollView {
                return item as! UIScrollView
            }
        }
        return UIScrollView()
    }
    
    class Coordinator: NSObject,UIPageViewControllerDataSource,UIPageViewControllerDelegate,UIScrollViewDelegate {
        var parent: PageViewController
        var home: HomeGlobal
        init(_ pageViewController: PageViewController,home: HomeGlobal) {
            self.parent = pageViewController
            self.home = home
        }
        
        /// 数据源代理
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            
            guard let index = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            
            if index == 0 {
                return parent.controllers.last
            }
            return parent.controllers[index - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == parent.controllers.count {
                return parent.controllers.first
            }
            return parent.controllers[index + 1]
        }
        
        /// 代理方法
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed,
                let visibleViewController = pageViewController.viewControllers?.first,
                let index = parent.controllers.firstIndex(of: visibleViewController)
            {
                parent.currentPage = index
                
            }
        }
        
        /// 监听滚动视图距离
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            self.home.offsetX = scrollView.contentOffset.x
        }
    }
    
    func makeCoordinator() -> PageViewController.Coordinator {
        Coordinator(self, home: self.home)
    }
  
    
}
