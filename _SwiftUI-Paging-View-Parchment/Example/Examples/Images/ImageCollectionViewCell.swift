import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
  
  static let reuseIdentifier: String = "ImageCellIdentifier"
  
  fileprivate lazy var imageView: UIImageView = {
    let imageView = UIImageView(frame: .zero)
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.clipsToBounds = true
    contentView.addSubview(imageView)
    contentView.constrainToEdges(imageView)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setImage(_ image: UIImage) {
    imageView.image = image
  }
  
}
