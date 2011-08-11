require 'spec_helper'

describe Admin::CommentsController do
  describe "GET index" do
    it "assigns a comments presenter" do
      Admin::CommentsPresenter.should_receive(:new).with(:review => 'visible').and_return 'presenter'

      get :index, :review => 'visible'

      controller.should assign_to(:presenter).with('presenter')
    end
  end
end