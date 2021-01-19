import UIKit
import Parchment

class ImagePagingCell: PagingCell {
  
  fileprivate lazy var imageView: UIImageView = {
    let imageView = UIImageView(frame: .zero)
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()
  
  fileprivate lazy var titleLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.semibold)
    label.textColor = UIColor.white
    label.backgroundColor = UIColor(white: 0, alpha: 0.6)
    label.numberOfLines = 0
    return label
  }()
  
  fileprivate lazy var paragraphStyle: NSParagraphStyle = {
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.hyphenationFactor = 1
    paragraphStyle.alignment = .center
    return paragraphStyle
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.layer.cornerRadius = 6
    contentView.clipsToBounds = true
    contentView.addSubview(imageView)
    contentView.addSubview(titleLabel)
    contentView.constrainToEdges(imageView)
    contentView.constrainToEdges(titleLabel)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func setPagingItem(_ pagingItem: PagingItem, selected: Bool, options: PagingOptions) {
    let item = pagingItem as! ImageItem
    imageView.image = item.headerImage
    titleLabel.attributedText = NSAttributedString(
      string: item.title,
      attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
    
    if selected {
      imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
    } else {
      imageView.transform = CGAffineTransform.identity
    }
  }
  
  open override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
    if let attributes = layoutAttributes as? PagingCellLayoutAttributes {
      let scale = 1 + attributes.progress
      imageView.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
  }
  
}
