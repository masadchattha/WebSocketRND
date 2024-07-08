/*
 * Copyright (c) 2010-2020 Belledonne Communications SARL.
 *
 * This file is part of linphone-iphone
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

import Foundation
import SnapKit
import UIKit

extension UIView {
	
	// Few constraints wrapper to abstract SnapKit functions
	
	@objc func removeConstraints() -> UIView  {
		snp.removeConstraints()
		return self
	}
	
	
	@objc func square(_ size:Int) -> UIView {
		snp.makeConstraints { (make) in
			make.width.equalTo(size)
			make.height.equalTo(size)
		}
		return self
	}
	
	@objc func squareMax(_ size:Int) -> UIView {
		snp.makeConstraints { (make) in
			make.height.lessThanOrEqualTo(size).priority(.high)
			make.width.equalTo(snp.height).priority(.high)
		}
		return self
	}
	
	
	@objc func makeHeightMatchWidth() -> UIView {
		snp.makeConstraints { (make) in
			make.height.equalTo(snp.width)
		}
		return self
	}
	
	@objc func makeWidthMatchHeight() -> UIView {
		snp.makeConstraints { (make) in
			make.width.equalTo(snp.height)
		}
		return self
	}
	
	@objc func size(w:CGFloat,h:CGFloat) -> UIView {
		snp.makeConstraints { (make) in
			make.width.equalTo(w)
			make.height.equalTo(h)
		}
		return self
	}
	
	@objc func updateSize(w:CGFloat,h:CGFloat) -> UIView {
		snp.updateConstraints { (make) in
			make.width.equalTo(w)
			make.height.equalTo(h)
		}
		return self
	}

    @discardableResult
	@objc func height(_ h:CGFloat) -> UIView {
		snp.makeConstraints { (make) in
			make.height.equalTo(h)
		}
		return self
	}

    @discardableResult
    @objc func height(greaterThanOrEqualTo h:CGFloat) -> UIView {
        snp.makeConstraints { (make) in
            make.height.greaterThanOrEqualTo(h)
        }
        return self
    }

    @discardableResult
    @objc func height(lessThanOrEqualTo h:CGFloat) -> UIView {
        snp.makeConstraints { (make) in
            make.height.lessThanOrEqualTo(h)
        }
        return self
    }

    @discardableResult
	func height(_ h:Int) -> UIView {
		return height(CGFloat(h))
	}
	
	@objc func oHeight(_ h:Int) -> UIView {
		return height(CGFloat(h))
	}
	
	@objc func width(_ h:CGFloat) -> UIView {
		snp.makeConstraints { (make) in
			make.width.equalTo(h)
		}
		return self
	}
	
	@objc func updateWidth(_ h:CGFloat) -> UIView {
		snp.updateConstraints { (make) in
			make.width.equalTo(h)
		}
		return self
	}
	
    @discardableResult
	@objc func updateHeight(_ h:Int) -> UIView {
		snp.updateConstraints { (make) in
			make.height.equalTo(h)
		}
		return self
	}
	
	@objc func applyAspectRatio(_ ratio:CGFloat) -> UIView {
		snp.makeConstraints { (make) in
			make.width.equalTo(snp.height).multipliedBy(ratio)
		}
		return self
	}
	
	func width(_ h:Int) -> UIView {
		return width(CGFloat(h))
	}
	
	@objc func oWidth(_ h:Int) -> UIView {
		return width(CGFloat(h))
	}
	
	func maxHeight(_ h:CGFloat) -> UIView {
		snp.makeConstraints { (make) in
			make.height.lessThanOrEqualTo(h)
		}
		return self
	}
	
	func maxWidth(_ h:CGFloat) -> UIView {
		snp.makeConstraints { (make) in
			make.width.lessThanOrEqualTo(h)
		}
		return self
	}
	
	func minWidth(_ h:CGFloat) -> UIView {
		snp.makeConstraints { (make) in
			make.width.greaterThanOrEqualTo(h)
		}
		return self
	}
	
	
	@objc func matchParentSideBorders(insetedByDx:CGFloat = 0) -> UIView {
		snp.makeConstraints { (make) in
			make.left.equalToSuperview().offset(insetedByDx)
			make.right.equalToSuperview().offset(-insetedByDx)
		}
		return self
	}
	
	@objc func matchBordersOf(view:UIView) -> UIView {
		snp.makeConstraints { (make) in
			make.left.right.equalTo(view)
		}
		return self
	}
	
	@objc func matchParentDimmensions() -> UIView {
		snp.makeConstraints { (make) in
			make.left.right.top.bottom.equalToSuperview()
		}
		return self
	}
	
	@objc func matchParentDimmensions(insetedByDx:CGFloat) -> UIView {
		snp.makeConstraints { (make) in
			make.left.top.equalToSuperview().offset(insetedByDx)
			make.right.bottom.equalToSuperview().offset(-insetedByDx)
		}
		return self
	}
	
	@objc func matchParentDimmensions(insetedBy:UIEdgeInsets) -> UIView {
		snp.makeConstraints { (make) in
			make.left.equalToSuperview().offset(insetedBy.left)
			make.top.equalToSuperview().offset(insetedBy.top)
			make.right.equalToSuperview().offset(-insetedBy.right)
			make.bottom.equalToSuperview().offset(-insetedBy.bottom)
		}
		return self
	}
	
	@objc func matchParentDimensions(leftInset:CGFloat) -> UIView {
		return matchParentDimmensions(insetedBy: UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: 0))
	}
	
	@objc func matchParentDimensions(topInset:CGFloat) -> UIView {
		return matchParentDimmensions(insetedBy: UIEdgeInsets(top: topInset, left: 0, bottom: 0, right: 0))
	}
	
	@objc func matchBordersWith(view:UIView, insetedByDx:CGFloat = 0) -> UIView {
		snp.makeConstraints { (make) in
			make.left.top.equalTo(view).offset(insetedByDx)
			make.right.bottom.equalTo(view).offset(-insetedByDx)
		}
		return self
	}
	
	@objc func updateTopBorderWith(view:UIView, inset:CGFloat = 0) -> UIView {
		snp.updateConstraints { (make) in
			make.top.equalTo(view).offset(inset)
		}
		return self
	}
	
	@objc func matchParentEdges() -> UIView {
		snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}
		return self
	}
	
	@objc func matchDimentionsOf(view:UIView) -> UIView {
		snp.makeConstraints { (make) in
			make.left.right.top.bottom.equalTo(view)
		}
		return self
	}
	
	@objc func matchParentHeight() -> UIView {
		snp.makeConstraints { (make) in
			make.top.bottom.equalToSuperview()
		}
		return self
	}
	
	@objc func addRightMargin(margin:CGFloat) -> UIView {
		snp.makeConstraints { (make) in
			make.rightMargin.equalTo(margin)
		}
		return self
	}
	
	@objc func matchParentHeightDividedBy(_ divider : CGFloat) -> UIView {
		snp.makeConstraints { (make) in
			make.height.equalToSuperview().dividedBy(divider)
		}
		return self
	}
	
	@objc func matchParentWidthDividedBy(_ divider : CGFloat) -> UIView {
		snp.makeConstraints { (make) in
			make.width.equalToSuperview().dividedBy(divider)
		}
		return self
	}
	
	func center() -> UIView {
		snp.makeConstraints { (make) in
			make.center.equalToSuperview()
		}
		return self
	}

	@discardableResult
	@objc func alignParentTop(withMargin:CGFloat = 0.0) -> UIView {
		snp.makeConstraints { (make) in
			make.top.equalToSuperview().offset(withMargin)
		}
		return self
	}
	
	func alignParentTop(withMargin:Int ) -> UIView {
		return alignParentTop(withMargin:CGFloat(withMargin))
	}
	
	
	func alignUnder(view:UIView, withMargin:CGFloat = 0.0) -> UIView {
		snp.makeConstraints { (make) in
			make.top.equalTo(view.snp.bottom).offset(withMargin)
		}
		return self
	}
	
	@objc func alignUnder(view:UIView, withMargin:Int) -> UIView {
		return alignUnder(view: view,withMargin:CGFloat(withMargin))
	}
	
	@objc func matchRightOf(view:UIView, withMargin:CGFloat = 0) -> UIView {
		snp.makeConstraints { (make) in
			make.right.equalTo(view).offset(withMargin)
		}
		return self
	}
	
	@objc func updateAlignUnder(view:UIView, withMargin:CGFloat = 0.0) -> UIView {
		snp.updateConstraints { (make) in
			make.top.equalTo(view.snp.bottom).offset(withMargin)
		}
		return self
	}
	
	func alignParentBottom(withMargin:CGFloat = 0.0) -> UIView {
		snp.makeConstraints { (make) in
			make.bottom.equalToSuperview().offset(-withMargin)
		}
		return self
	}
	
	func updateAlignParentBottom(withMargin:CGFloat = 0.0) -> UIView {
		snp.updateConstraints { (make) in
			make.bottom.equalToSuperview().offset(-withMargin)
		}
		return self
	}
	
	@objc func alignParentBottom(withMargin:Int) -> UIView {
		return alignParentBottom(withMargin:CGFloat(withMargin))
	}
	
	@objc func updateAlignParentBottom(withMargin:Int) -> UIView {
		return updateAlignParentBottom(withMargin:CGFloat(withMargin))
	}
	
	func alignAbove(view:UIView, withMargin:CGFloat = 0.0) -> UIView {
		snp.makeConstraints { (make) in
			make.bottom.equalTo(view.snp.top).offset(-withMargin)
		}
		return self
	}
	
	@objc func alignAbove(view:UIView, withMargin:Int) -> UIView {
		return alignAbove(view: view,withMargin:CGFloat(withMargin))
	}
	
	@objc func alignBottomWith(otherView:UIView) -> UIView {
		snp.makeConstraints { (make) in
			make.bottom.equalTo(otherView)
		}
		return self
	}
	
	@objc func alignBottomWith(otherView:UIView, margin:CGFloat) -> UIView {
		snp.makeConstraints { (make) in
			make.bottom.equalTo(otherView).offset(margin)
		}
		return self
	}
	
	@objc func updateAlignBottomWith(otherView:UIView, margin:CGFloat) -> UIView {
		snp.updateConstraints { (make) in
			make.bottom.equalTo(otherView).offset(margin)
		}
		return self
	}
	
	@objc func marginLeft(_ m:CGFloat) -> UIView {
		snp.makeConstraints { (make) in
			make.left.equalToSuperview().offset(m)
		}
		return self
	}
	
	func alignParentLeft(withMargin:CGFloat = 0.0) -> UIView {
		snp.makeConstraints { (make) in
			make.left.equalToSuperview().offset(withMargin)
		}
		return self
	}
	
	func updateAlignParentLeft(withMargin:CGFloat = 0.0) -> UIView {
		snp.updateConstraints { (make) in
			make.left.equalToSuperview().offset(withMargin)
		}
		return self
	}

    @discardableResult
	@objc func alignParentLeft(withMargin:Int) -> UIView {
		return alignParentLeft(withMargin:CGFloat(withMargin))
	}

    @discardableResult
	@objc func alignParentRight(withMargin:Int = 0) -> UIView {
		snp.makeConstraints { (make) in
			make.right.equalToSuperview().offset(-withMargin)
		}
		return self
	}

    @discardableResult
	@objc func updateAlignParentRight(withMargin:CGFloat = 0) -> UIView {
		snp.updateConstraints { (make) in
			make.right.equalToSuperview().offset(-withMargin)
		}
		return self
	}

    @discardableResult
	func alignParentRight(withMargin:CGFloat) -> UIView {
		return alignParentRight(withMargin:Int(withMargin))
	}

	@discardableResult
	@objc func alignRightWith(_ view:UIView) -> UIView {
		snp.makeConstraints { (make) in
			make.right.equalTo(view.snp.right)
		}
		return self
	}

    @discardableResult
	@objc func alignLefttWith(_ view:UIView) -> UIView {
		snp.makeConstraints { (make) in
			make.left.equalTo(view.snp.left)
		}
		return self
	}
	
	func toRightOf(_ view:UIView, withLeftMargin:Int = 0) -> UIView {
		snp.makeConstraints { (make) in
			make.left.equalTo(view.snp.right).offset(withLeftMargin)
		}
		return self
	}
	
	@objc func toRightOf(_ view:UIView, withLeftMargin:CGFloat) -> UIView {
		return toRightOf(view,withLeftMargin: Int(withLeftMargin))
	}
	
	
	@objc func alignHorizontalCenterWith(_ view:UIView) -> UIView {
		snp.makeConstraints { (make) in
			make.centerY.equalTo(view)
		}
		return self
	}
	
	@objc func alignVerticalCenterWith(_ view:UIView) -> UIView {
		snp.makeConstraints { (make) in
			make.centerX.equalTo(view)
		}
		return self
	}
	
	
	@objc func toLeftOf(_ view:UIView) -> UIView {
		snp.makeConstraints { (make) in
			make.right.equalTo(view.snp.left)
		}
		return self
	}
	
	@objc func toLeftOf(_ view:UIView, withRightMargin:CGFloat) -> UIView {
		snp.makeConstraints { (make) in
			make.right.equalTo(view.snp.left).offset(-withRightMargin)
		}
		return self
	}
	
	@objc func centerX(withDx:Int = 0) -> UIView {
		snp.makeConstraints { (make) in
			make.centerX.equalToSuperview().offset(withDx)
		}
		return self
	}
	
	@objc func centerY(withDy:Int = 0) -> UIView {
		snp.makeConstraints { (make) in
			make.centerY.equalToSuperview().offset(withDy)
		}
		return self
	}
	
	@objc func matchCenterXOf(view:UIView, withDx:Int = 0) -> UIView {
		snp.makeConstraints { (make) in
			make.centerX.equalTo(view).offset(withDx)
		}
		return self
	}
	
	@objc func matchCenterYOf(view:UIView, withDy:Int = 0) -> UIView {
		snp.makeConstraints { (make) in
			make.centerY.equalTo(view).offset(withDy)
		}
		return self
	}
	
	@objc 	func wrapContentY() -> UIView {
		subviews.first?.snp.makeConstraints({ make in
			make.top.equalToSuperview()
		})
		subviews.last?.snp.makeConstraints({ make in
			make.bottom.equalToSuperview()
		})
		return self
	}
	
	@objc func wrapContentX() -> UIView {
		subviews.first?.snp.makeConstraints({ make in
			make.left.equalToSuperview()
		})
		subviews.last?.snp.makeConstraints({ make in
			make.right.equalToSuperview()
		})
		return self
	}
	
	@objc func wrapContent(inset:UIEdgeInsets) -> UIView {
		subviews.first?.snp.makeConstraints({ make in
			make.left.equalToSuperview().offset(inset.left)
		})
		subviews.last?.snp.makeConstraints({ make in
			make.right.equalToSuperview().offset(-inset.right)
		})
		subviews.first?.snp.makeConstraints({ make in
			make.top.equalToSuperview().offset(inset.top)
		})
		subviews.last?.snp.makeConstraints({ make in
			make.bottom.equalToSuperview().offset(-inset.bottom)
		})
		return self
	}
	
	@objc func done() {
		// to avoid the unused variable warning
	}
	
	// Single click

	class TapGestureRecognizer: UITapGestureRecognizer {
		var action : (()->Void)? = nil
	}
	
	func onClick(action : @escaping ()->Void ){
		let tap = TapGestureRecognizer(target: self , action: #selector(self.handleTap(_:)))
		tap.action = action
		tap.numberOfTapsRequired = 1
		tap.cancelsTouchesInView = false
		
		self.addGestureRecognizer(tap)
		self.isUserInteractionEnabled = true
		
	}
	
	func addClickAction(additionalAction : @escaping ()->Void) {
		if let gr = gestureRecognizers?.first as? TapGestureRecognizer {
			let action = gr.action
			gr.action = {
				action?()
				additionalAction()
			}
		}
	}
	
	@objc func handleTap(_ sender: TapGestureRecognizer) {
		sender.action!()
	}
	
	// Long click
	class LongPressGestureRecognizer: UILongPressGestureRecognizer {
		var action : (()->Void)? = nil
	}
	func onLongClick(action : @escaping ()->Void ){
		let tap = LongPressGestureRecognizer(target: self , action: #selector(self.handleLongClick(_:)))
		tap.action = action
		tap.cancelsTouchesInView = false
		self.addGestureRecognizer(tap)
		self.isUserInteractionEnabled = true
		
	}
	@objc func handleLongClick(_ sender: LongPressGestureRecognizer) {
		sender.action?()
	}
	
	func onLongClickOneClick(action : @escaping ()->Void ){
		let tap = LongPressGestureRecognizer(target: self , action: #selector(self.handleLongClickOneClick(_:)))
		tap.action = action
		tap.cancelsTouchesInView = false
		self.addGestureRecognizer(tap)
		self.isUserInteractionEnabled = true
	}
	@objc func handleLongClickOneClick(_ sender: LongPressGestureRecognizer) {
		if (sender.state == .began){
			sender.action?()
		}
	}
	
	@objc func toImage() -> UIImage? {
		UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0)
		guard let context = UIGraphicsGetCurrentContext() else { return nil }
		context.saveGState()
		layer.render(in: context)
		context.restoreGState()
		guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
		UIGraphicsEndImageContext()
		return image
	}
	
}


extension UIView {

    @discardableResult
    @objc func alignUnder(view:UIView, marginGreaterOrEqual:CGFloat) -> UIView {
        snp.makeConstraints { (make) in
            make.top.greaterThanOrEqualTo(view.snp.bottom).offset(marginGreaterOrEqual)
        }
        return self
    }

//    @objc func alignUnder(view:UIView, marginGreaterOrEqual:Int) -> UIView {
//        return alignUnder(view: view,withMarginGreaterOrEqual: marginGreaterOrEqual)
//    }
}
