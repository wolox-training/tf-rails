ActiveAdmin.register Book do
  config.sort_order = 'id_asc'

  index do
    selectable_column
    id_column
    column :title
    column :author
    column :genre
    column :publisher
    column :year
    actions
  end

  filter :title
  filter :author
  filter :genre
  filter :publisher
  filter :year
end
