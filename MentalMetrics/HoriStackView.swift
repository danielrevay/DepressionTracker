//
//  HoriStackView.swift
//  MentalMetrics
//
//  Created by Daniel Revay on 4/17/21.
//  https://medium.com/@anitaa_1990/create-a-horizontal-paging-uiscrollview-with-uipagecontrol-swift-4-xcode-9-a3dddc845e92

import Foundation
import UIKit

class HoriStackView : UIViewController {
    @IBOutlet weak var vwScrollView: UIScrollView!
    var slides:[Slide] = [];
    @IBOutlet weak var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        pageControl.numberOfPages = slides.count
        //pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
    }
    func createSlides() -> [Slide] {
        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.lblDate.text = "ur mom"
        slide1.lblActualMood.text = "xd"
        slide1.lblExpectedMood.text = "u"
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.lblDate.text = "ur dad"
        slide2.lblActualMood.text = "xyd"
        slide2.lblExpectedMood.text = "ur"
        let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.lblDate.text = "u"
        slide3.lblActualMood.text = "smthing"
        slide3.lblExpectedMood.text = "y"
        return [slide1,slide2,slide3]
    }
    func setupSlideScrollView(slides:[Slide]){
        vwScrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        vwScrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        vwScrollView.isPagingEnabled = true
                
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            vwScrollView.addSubview(slides[i])
        }
    }
}
