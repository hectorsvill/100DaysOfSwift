//
//  NoteViewController.swift
//  hNotes
//
//  Created by Hector Steven on 4/20/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {
	@IBOutlet var noteTextView: UITextView!
	@IBOutlet var buttonsView: UIView!
	
	var note: Note? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
		
		if let n = note {
			self.title = n.noteTitle
			noteTextView.text = n.noteString
		}
		let nc = NotificationCenter.default
		nc.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
		nc.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
	
	}

	@objc func adjustForKeyboard(notification: Notification) {
		guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
		
		let keyboardScreenEndFrame = keyboardValue.cgRectValue
		let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
		
		if notification.name == UIResponder.keyboardWillHideNotification {
			noteTextView.contentInset = .zero
		} else {
			noteTextView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - view.safeAreaInsets.bottom, right: 0)
		}
		
		noteTextView.scrollIndicatorInsets = noteTextView.contentInset
		
		let selectedRange = noteTextView.selectedRange
		
		noteTextView.scrollRangeToVisible(selectedRange)
	}

	@IBAction func greenText(_ sender: Any) {
		noteTextView.textColor = noteTextView.textColor == UIColor.black ? .green : .black
	}
	
}
