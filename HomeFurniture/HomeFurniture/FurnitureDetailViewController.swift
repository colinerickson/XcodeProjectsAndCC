
import UIKit

class FurnitureDetailViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    var furniture: Furniture?
    
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var choosePhotoButton: UIButton!
    @IBOutlet var furnitureTitleLabel: UILabel!
    @IBOutlet var furnitureDescriptionLabel: UILabel!
    
    init?(coder: NSCoder, furniture: Furniture?) {
        self.furniture = furniture
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    func updateView() {
        guard let furniture = furniture else {return}
        if let imageData = furniture.imageData,
            let image = UIImage(data: imageData) {
            photoImageView.image = image
        } else {
            photoImageView.image = nil
        }
        
        furnitureTitleLabel.text = furniture.name
        furnitureDescriptionLabel.text = furniture.description
    }
    
    @IBAction func choosePhotoButtonTapped(_ sender: Any) {
        let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            let imageAlert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { _ in
                    imagePicker.sourceType = .photoLibrary
                    self.present(imagePicker, animated: true, completion: nil)
                }
                imageAlert.addAction(photoLibraryAction)
            }

            let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let takePictureButton = UIAlertAction(title: "Take Photo", style: .default) { _ in
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    imagePicker.sourceType = .camera
                    self.present(imagePicker, animated: true, completion: nil)
                }
            }

                    imageAlert.addAction(cancelButton)
                    imageAlert.addAction(takePictureButton)

                    if let popoverController = imageAlert.popoverPresentationController {
                        popoverController.sourceView = self.view
                        popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
                        popoverController.permittedArrowDirections = []
                    }

                    present(imageAlert, animated: true, completion: nil)
                
    }

    @IBAction func actionButtonTapped(_ sender: Any) {
        guard let furniture = furniture, let image = photoImageView.image else { return }

           let textToShare = "Check out this furniture: \(furniture.name)"

           let activityViewController = UIActivityViewController(activityItems: [textToShare, image], applicationActivities: nil)

           present(activityViewController, animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided with the following: \(info)")
        }
        if let imageData = selectedImage.jpegData(compressionQuality: 0.9) {
            furniture?.imageData = imageData
        }
        dismiss(animated: true) {
            self.updateView()
        }
    }
    
}
