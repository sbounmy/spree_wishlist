require File.dirname(__FILE__) + '/../../spec_helper'

describe Spree::WishedProductsController do

  #Delete this example and add some real ones
  it "should use Spree::WishedProductsController" do
    controller.should be_an_instance_of(Spree::WishedProductsController)
  end

  describe '#create' do
    before :each do
      controller.stub!(:current_user).and_return create(:user)
    end
    it 'should create successfuly' do
      v = create(:variant)

      expect {
        spree_post :create, :wished_product => { :variant_id => v.id }
      }.to change(Spree::WishedProduct, :count).by(1)
      Spree::WishedProduct.last.variant_id.should == v.id
    end

  end

end
