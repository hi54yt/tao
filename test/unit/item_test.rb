require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "item attributes must not be empty" do
    item = Item.new
    assert item.invalid? 
    assert item.errors[:title].any?
    assert item.errors[:image_url].any?
    assert item.errors[:price].any?  
  end
  
  def new_item(image_url)
    Item.new(:title => "ipad",
             :price => 1,
             :image_url => image_url)
  end
  
  test "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.jpg http://a.b.c/x/y/z/fred.gif}
    bad =%w{ fred.doc fred.gif/more fred.gif.more}
    ok.each do |name|
      assert new_item(name).valid?, "#{name} shouldn't be invalid"
    end
    
    bad.each do |name|
      assert new_item(name).invalid?, "#{name} shouldn't be valid"
    end
  end
end
