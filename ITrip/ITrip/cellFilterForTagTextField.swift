import UIKit


protocol cellTagText
{
    func tagText(string:String)

}
class cellFilterForTagTextField : UICollectionViewCell,UITextFieldDelegate {
    
    var addTag = UITextField()
    var delegate : cellTagText?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
        
        print("frame \(self.frame)")

        
        addTag.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width/2, 44)
        addTag.placeholder = "tag giriniz..."
        addTag.delegate = self
        addTag.keyboardType = UIKeyboardType.ASCIICapable

        self.contentView.addSubview(addTag)
        

    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        delegate?.tagText(textField.text!)
        self.addTag.text = ""

        
        return true
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        if(string == " ")
        {
        print("boş dedii")
            
            delegate?.tagText(textField.text!)
            self.addTag.text = ""
            self.addTag.becomeFirstResponder()

        }else
        {
            let maxLength = 15
            let currentString: NSString = textField.text!
            let newString: NSString =
            currentString.stringByReplacingCharactersInRange(range, withString: string)
            return newString.length <= maxLength

        
        }
        
        return true
        
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()

        
        
        
        self.contentView.setNeedsLayout()
        self.contentView.layoutIfNeeded()
        
    }
    
    
}
