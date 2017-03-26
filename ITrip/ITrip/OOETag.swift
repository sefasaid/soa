//
//  File.swift
//  ITrip
//
//  Created by Özgün on 25.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//


import UIKit

protocol TagDelegate
{
    func returnSelectedTag(tag:[String])
}


enum CollectionType : Int {
    case TableForm = 1;
    case CollectionFrom = 2;
    case TagForm = 3;
    case SearchForm = 4;
    case Default = 0;
}
var tableCellHeight : CGFloat = 44.0
var tableMinLine : CGFloat = 2.5
var colMinLine : CGFloat = 1
var colHeight = CGFloat()

class OOETag :UICollectionView,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,cellTagText{
    
    
    var OOEdelegate : TagDelegate?
    private var layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    private var OOESelectedId  = [Int]() // delegate ile Controllera secilen olan cell lerin idlerini yollicaz..
    private var OOETag = [String]() //Tag bilgilerini burdan giricezzz
    
    
    
    private var selected = NSIndexPath()
    private var type = Int()//coklu table kullaımda delegateden dönen degeri ayırmam için
    var cellBackGroundColor = UInt()
    var tagTitleColor = UInt()
    var cellSelectedColor = UInt()
    var isHide : Bool = false
//    private var status : Bool = true // bu sorgu içine sadece birkere nesne atanması için tableview içindeki cellerde kullandığımız için bu classı genellikle bozabiliyordu secildi secilmedi ayarlarını.
    var tagStatus : Bool = true // tag ler iceriden yazılabilirmi yoksa yazılamazmı ayarladık section sayısını belirlemede önemli
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: UICollectionViewLayout())
        
        
        
        //cellin ayarları
        self.dataSource = self
        self.delegate = self
        
        
        
        
        
        self.registerClass(cellFilterTagForm.self, forCellWithReuseIdentifier: "CELLTAG")
        
        self.registerClass(cellFilterForTagTextField.self, forCellWithReuseIdentifier: "CELLTAGTEXT")
        
        
        
        self.backgroundColor = UIColor.clearColor()
            self.layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            self.layout.itemSize = CGSize(width: 50, height: 25)
            self.layout.minimumLineSpacing = tableMinLine
            self.layout.minimumInteritemSpacing = tableMinLine
            self.layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
            self.collectionViewLayout = self.layout
            
        
        
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func tagText(string: String) {
        print("string")
        setAddTag(string)
    }
    
    
    func setAddTag(tag:String){
        if let index = OOETag.indexOf(tag)//find(OOETag, tag)
        {
            print("bu tagdan var")
            
        }else if(tag != "")
        {
            
            if(OOETag.count<10)
            {
                isHide = false
                OOETag.append(tag)
                self.reloadData()
                
                OOEdelegate?.returnSelectedTag(OOETag)
                
                let lastItemIndex = NSIndexPath(forItem: OOETag.count-1, inSection: 0)
                self.scrollToItemAtIndexPath(lastItemIndex, atScrollPosition: UICollectionViewScrollPosition.Left, animated: true)
                
                
                
            }else
            {
                isHide = true;
                self.reloadData()
                
                
            }
            
        }
        
        
        
        
    }
    
    func setAddTagArray(tag:[String]){
        
        if(tag.count > 0) {
            for index in 0...tag.count-1
            {
                OOETag.append(tag[index])
                self.reloadData()
            }
        }
        
        
    }
    
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        
            if(tagStatus)
            {
                return 2
                
            }else
            {
                return 1
            }
        
        
      
        
      
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
            if(section == 0)
            {
                return OOETag.count
                
            }else
            {
                return 1
            }
            
            
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let nullCell = UICollectionViewCell()
        
        
            if(indexPath.section == 0)
            {
                let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CELLTAG", forIndexPath: indexPath) as! cellFilterTagForm
                
                cell.lbl_Title.text = OOETag[indexPath.row] as String
                cell.lbl_Title.layer.borderColor = UIColor.hexColor(cellBackGroundColor).CGColor
                cell.lbl_Title.textColor = UIColor.hexColor(tagTitleColor)
                return cell
                
            }else
            {
                if(tagStatus)
                {
                    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CELLTAGTEXT", forIndexPath: indexPath) as! cellFilterForTagTextField
                    cell.delegate = self
                    // cell.lbl_Title.text = OOETag[indexPath.row] as String
                    return cell
                }
                
                
                //bura olcak textfield
            }
            
            
            
        
        
        
        return nullCell
        
    }
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        
        
        
    }
    
    func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
        
        
        
        
        
        
    }
    
    func collectionView(collectionView: UICollectionView, didUnhighlightItemAtIndexPath indexPath: NSIndexPath) {
        
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
            if(indexPath.section == 0){
                OOETag.removeAtIndex(indexPath.row)
                self.reloadData()
                OOEdelegate?.returnSelectedTag(OOETag)
                if(OOETag.count<10)
                {
                    isHide = false
                }
                
            }
        
    }
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
            if(indexPath.section == 0)
            {
                let width = widthForView(OOETag[indexPath.row] as String, font: UIFont.systemFontOfSize(13))
                return CGSizeMake(width+4, 25)
                
            }else
                
                
                
            {
                if(isHide)
                {
                    return CGSizeMake(0, 44)
                }else
                {
                    return CGSizeMake(UIScreen.mainScreen().bounds.width/2, 44)
                    
                }
                
                
            }
            
            
        
        
        
    }
    
    
    
    
    
}
