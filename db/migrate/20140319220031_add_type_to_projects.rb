class AddTypeToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :project_type, :string
    add_column :projects, :client, :string
    add_column :projects, :tech, :string
    add_column :projects, :link, :string
  end
end
