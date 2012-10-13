ActiveAdmin.register Api::Noun do

  form :html => { :enctype => "multipart/form-data" } do |f|

    f.inputs "Noun Details", :multipart => true do
      f.input :name
      f.input :attribution
      f.input :icon, :as => :file, :hint => f.template.image_tag(f.object.icon.url)
     
    end
    f.buttons
  end
end
