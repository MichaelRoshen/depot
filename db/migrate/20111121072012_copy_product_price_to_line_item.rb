class CopyProductPriceToLineItem < ActiveRecord::Migration
  def up
    add_column :line_items, :price, :integer, :default=>0
    LineItem.all.each do |item|
      item.update_attribute(:price, item.product.price)
    end
  end

  def down
    remove_column :line_items,:price
  end
end
