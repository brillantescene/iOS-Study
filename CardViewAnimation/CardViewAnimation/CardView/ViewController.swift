//
//  ViewController.swift
//  CardViewAnimation
//
//  Created by ✨EUGENE✨ on 2020/12/31.
//

import UIKit

class ViewController: UIViewController {

    enum CardState {
        case expanded
        case collapsed
    }
    
    @IBOutlet var myBtn: UIButton!
    @IBOutlet var cardListView: UIView! // 보라색 카드 부분
    
    var cardViewController:CardViewController!
    var visualEffectView:UIVisualEffectView!
    
    
    let cardHeight:CGFloat = 600
    let cardHandleAreaHeight:CGFloat = 65 // 밑에 카드가 보이는 흰색~노란색살짝 부분
    
    var cardVisible = false
    
    var nextState:CardState {
        // cardVisible이 true면 .collapsed false면 .expanded
        return cardVisible ? .collapsed : .expanded
    }
    
    var runningAnimations = [UIViewPropertyAnimator]() // UIViewPropertyAnimator: 뷰의 변경사항에 대해 애니메이션을 적용하고 동적으로 수정할 수 있는 클래스임
    var animationProgressWhenInterrupted:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCard()
        cardListView.layer.cornerRadius = 10
        cardListView.isHidden = true
        myBtn.addTarget(self, action: #selector(myButtonTapped), for: UIControl.Event.touchUpInside)
    }
    
    // 다른 부분 터치하면 보라색 카드 사라지고 바텀시트 보이기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        super.touchesBegan(touches, with: event)
        if let touch = touches.first , touch.view == self.view { // 터치를 했고 그 터치의 뷰가 이 뷰컨트롤러의 뷰라면
            cardListView.isHidden = true
            cardViewController.view.isHidden = false
        }
    }
    
    @objc func myButtonTapped(){
          if myBtn.isSelected == true {
            myBtn.isSelected = false
            cardListView.isHidden = true

          } else {
            myBtn.isSelected = true
            cardListView.isHidden = false
            cardViewController.view.isHidden = true
          }
        }
    func setupCard() {
//        visualEffectView = UIVisualEffectView()
//        visualEffectView.frame = self.view.frame
//        self.view.addSubview(visualEffectView)
        
        cardViewController = CardViewController(nibName:"CardViewController", bundle:nil)
        self.addChild(cardViewController)
        self.view.addSubview(cardViewController.view)
        
        cardViewController.view.frame = CGRect(x: 0, y: self.view.frame.height - cardHandleAreaHeight, width: self.view.bounds.width, height: cardHeight)
        
        
        // cornerRadius 준거 잘나오게 true. true로 하면 bounds를 넘어가는 subview들이 잘림 -> 모서리 둥글게 나옴. false하면 안잘림. 둥글게 적용이 안됨
        cardViewController.view.clipsToBounds = true
        
        // 핸들부분 탭하면 바텀시트 움직이기
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleCardTap(recognzier:)))
        // 핸들부분 끌면 바텀시트 움직이기
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handleCardPan(recognizer:)))
        
        // addTarget 해주는것처럼 제스쳐Recognizer를 등록해줌
        cardViewController.handleArea.addGestureRecognizer(tapGestureRecognizer)
        cardViewController.handleArea.addGestureRecognizer(panGestureRecognizer)
        
        
    }

    @objc
    func handleCardTap(recognzier: UITapGestureRecognizer) {
        
        /**
         UITapGestureRecognizer에는 state가 ended밖에 없음.
         걍 탭하면 바로 state = Ended 이렇게 뜸.
         그래서 탭 -> .ended -> (올리거나 내리는)애니메이션 넣기
         이런 플로우가 되는거임
         */
        
        switch recognzier.state {
        case .ended:
            animateTransitionIfNeeded(state: nextState, duration: 0.9)
        default:
            break
        }
    }
    
    @objc
    func handleCardPan (recognizer:UIPanGestureRecognizer) {
        
        /**
         UIPanGestureRecognizer state는 좀 다름.
         끌어서 움직이기 시작하면 Began -> 멈출때까지 Changed -> 멈추면 Ended이런식.
         멈추기 전까지 changed가 계속 뜸.
         */
        print("cardVisible \(cardVisible)")
        switch recognizer.state {
        case .began:
            startInteractiveTransition(state: nextState, duration: 0.9)
        case .changed:
            // 막 끌면서 위아래로 움직이자너
            // 핸들 부분의 새 위치가 어딘지 파악해서 translation에 넣어
            let translation = recognizer.translation(in: self.cardViewController.handleArea)
            // 현재 핸들의 y좌표 위치를 전체 카드뷰의 높이로 나눠서 진행률을 계산해
            var fractionComplete = translation.y / cardHeight
            fractionComplete = cardVisible ? fractionComplete : -fractionComplete
            print(translation, fractionComplete)
            updateInteractiveTransition(fractionCompleted: fractionComplete)
        case .ended:
            continueInteractiveTransition()
        default:
            break
        }
        
    }
    
    // 위아래로 움직이는 애니메이션
    // CardState -> .expanded, .collapsed 두가지
    func animateTransitionIfNeeded (state:CardState, duration:TimeInterval) {
        
        // 항상 비어있음. 왜냐면 넣고 바로 빼거든
        if runningAnimations.isEmpty { // UIViewPropertyAnimator 배열이 비어있으면
            
            let frameAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) { // animations: <#T##(() -> Void)?##(() -> Void)?##() -> Void#> 클로저
                // dampingRatio는 말그대로 땜핑 주는거임. 0에 가까울수록 애가 지진이 남. 1로 하면 댐핑없이 부드럽게 움직임.
                switch state {
                case .expanded: // 올라가는거면 cardHeight 뺀만큼 올라가고
                    self.cardViewController.view.frame.origin.y = self.view.frame.height - self.cardHeight
                case .collapsed: // 내려가는거면 card 핸들 높이만큼만 나오게 내려가기
                    self.cardViewController.view.frame.origin.y = self.view.frame.height - self.cardHandleAreaHeight
                }
            }
            
            // 애니메이션 완료되면 할 일 설정
            frameAnimator.addCompletion { _ in
                // cardVisible bool을 반대로 설정하고
                self.cardVisible = !self.cardVisible
                // runningAnimations에 넣은 UIViewPropertyAnimator들 모두 비우기
                self.runningAnimations.removeAll()
            }
            
            // 애니메이션 시작
            frameAnimator.startAnimation()
            // UIViewPropertyAnimator 배열에 UIViewPropertyAnimator 넣기
            runningAnimations.append(frameAnimator)
            
            // 모서리 둥글게 애니메이션
            let cornerRadiusAnimator = UIViewPropertyAnimator(duration: duration, curve: .linear) {
                // 12부터 0까지 duration동안 리니어하게 변하기
                switch state {
                case .expanded:
                    self.cardViewController.view.layer.cornerRadius = 12
                case .collapsed:
                    self.cardViewController.view.layer.cornerRadius = 0
                }
            }
            // 또 애니메이션 시작시키고 UIViewPropertyAnimator 배열에 넣기
            cornerRadiusAnimator.startAnimation()
            runningAnimations.append(cornerRadiusAnimator)
            
//            let blurAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
//                switch state {
//                case .expanded:
//                    self.visualEffectView.effect = UIBlurEffect(style: .dark)
//                case .collapsed:
//                    self.visualEffectView.effect = nil
//                }
//            }
            
//            blurAnimator.startAnimation()
//            runningAnimations.append(blurAnimator)
            
        }
    }
    
    // 여기 밑에 세개는 팬 제스쳐에 필요한 함수들임.
    // 팬이 시작될 때 실행됨
    func startInteractiveTransition(state:CardState, duration:TimeInterval) {
        if runningAnimations.isEmpty { // 애니메이션이 없는 상태면 시작하고
            animateTransitionIfNeeded(state: state, duration: duration)
        }
        // 있는 상태면
        for animator in runningAnimations {
            // 있는거 하나씩 멈추고
            animator.pauseAnimation()
            // 애니메이션 진행률을 저장해
            animationProgressWhenInterrupted = animator.fractionComplete
        }
    }
    // 팬 changed 상태일 때 실행
    func updateInteractiveTransition(fractionCompleted:CGFloat) {
        for animator in runningAnimations {
            // Began 떄 저장한 애니메이션 진행률에 파라메터로 받은 fractionCompleted를 더해서 진행률 업데이트 해줌
            animator.fractionComplete = fractionCompleted + animationProgressWhenInterrupted
        }
    }
    // Ended
    func continueInteractiveTransition (){
        for animator in runningAnimations {
            // 하던 애니메이션 이어서 진행
            animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        }
    }
    
}


