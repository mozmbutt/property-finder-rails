module PropertiesHelper
  def property_thumbnail(property)
    img = property.photo.present? ? property.photo : 'placeholder.png'
    image_tag img, class: 'property-thumb'
  end

  def property_photo_url(property)
    property.photo.present? ? main_app.url_for(property.photo) : 'placeholder.png'
  end

  def show_image_if_present(property)
    if property.photo.record.id.present?
      img = property.photo
      image_tag img, width: '500'
    end
  end
end
