require './test/test_helper'

class VizOnesControllerTest < ActionDispatch::IntegrationTest

  def test_index
    get '/'
    assert_template('viz_ones/index')
    assert_response(:success)
  end
  # test "the truth" do

  #   assert true
  # end
end
