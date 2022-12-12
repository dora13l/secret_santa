# if the item is saved
if @item.persisted?
  # we want to render the form empty and
  json.form render(partial: "items/form", formats: :html, locals: { wishlist: @wishlist, item: Item.new })
  # render the item created to be inserted in the products
  json.inserted_item render(partial: "wishlists/item", formats: :html, locals: { item: @item })
else
  # we want to render form with validation errors.
  json.form render(partial: "items/form", formats: :html, locals: { wishlist: @wishlist, item: @item })
end
