ActiveAdmin.register Rent do
  permit_params :to

  index do
    selectable_column
    id_column
    column 'User' do |rent|
      link_to(rent.user.email, admin_user_path(rent.user_id))
    end
    column :book
    column :from
    column :to
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row 'User' do |rent|
        link_to(rent.user.email, admin_user_path(rent.user_id))
      end
      row :book
      row :from
      row :to
      row :created_at
      row :updated_at
    end
  end

  filter :user, collection: -> { User.all.pluck('id', 'email') }
  filter :book
  filter :from, label: 'Rent start'
  filter :to, label: 'Rent expiration'

  form do |f|
    f.inputs do
      if f.object.new_record?
        f.input :user, include_blank: false,
                       collection: User.all.pluck('id', 'email')
        f.input :book, include_blank: false
        f.input :from
      end
      f.input :to
    end
    f.actions
  end
end
