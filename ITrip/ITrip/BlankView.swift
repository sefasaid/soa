
import UIKit


class BlankView : UIView{

    var btn_UserAction = UIButton()
    var imgView_Header = UIImageView()
    var lbl_Title = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setCreateUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



    func setCreateUI(){

        self.addSubview(imgView_Header)
        imgView_Header.snp_makeConstraints { (make) in
            make.width.equalTo(self.snp_width).multipliedBy(0.4)
            make.height.equalTo(self.snp_width).multipliedBy(0.4)
            make.top.equalTo(self).offset(128)
            make.centerX.equalTo(self)
        }
        imgView_Header.setRadius(5, clipsToBounds: true, borderWidth: 1, borderColor: UIColor.clearColor())
        imgView_Header.backgroundColor = UIColor.hexColor(0xFFFFFF)
        imgView_Header.image = UIImage(named: "noPage")


        self.addSubview(lbl_Title)
        lbl_Title.snp_makeConstraints { (make) in
            make.width.equalTo(self.snp_width).multipliedBy(0.9)
            make.top.equalTo(imgView_Header.snp_bottom).offset(10)
            make.centerX.equalTo(self)
        }
        lbl_Title.textAlignment = NSTextAlignment.Center
        lbl_Title.numberOfLines = 5
        lbl_Title.textColor = UIColor.hexColor(0x212121)
        lbl_Title.font = UIFont.appFont(13)
        self.addSubview(btn_UserAction)
        btn_UserAction.snp_makeConstraints { (make) in
            make.width.equalTo(self.snp_width).multipliedBy(0.5)
            make.height.equalTo(48)
            make.centerX.equalTo(self)
            make.bottom.equalTo(self).offset(-30)
        }
        btn_UserAction.setTitle("Tekrar Dene", forState: UIControlState.Normal)
        btn_UserAction.backgroundColor = UIColor.redColor()
        //btn_AddProduct.backgroundColor = UIColor.appGrapeFruiteColor()
        btn_UserAction.setBackgroundImage(UIImage(named: "navigationimg"), forState: UIControlState.Normal)
        btn_UserAction.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btn_UserAction.layer.masksToBounds = true
        btn_UserAction.layer.cornerRadius = 24
        btn_UserAction.titleLabel?.font = UIFont.appFont(16)



    }


}
