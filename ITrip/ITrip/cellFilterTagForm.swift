

import UIKit



class cellFilterTagForm : UICollectionViewCell {
    
    var lbl_Title = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
        
        print("frame \(self.frame)")
        
        lbl_Title.font = UIFont.systemFontOfSize(12)
        lbl_Title.textAlignment = NSTextAlignment.Center
        lbl_Title.textColor = UIColor.whiteColor()

        lbl_Title.layer.backgroundColor  = UIColor.clearColor().CGColor
        lbl_Title.layer.cornerRadius = 10
        lbl_Title.layer.borderWidth = 1
        lbl_Title.layer.borderColor = UIColor.hexColor(0xF34E4A).CGColor
        
        self.contentView.addSubview(lbl_Title)
       
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        lbl_Title.snp_makeConstraints { (make) -> Void in
            make.bottom.top.right.left.equalTo(self)
        }
     
        
        
        self.contentView.setNeedsLayout()
        self.contentView.layoutIfNeeded()
        
    }


}
