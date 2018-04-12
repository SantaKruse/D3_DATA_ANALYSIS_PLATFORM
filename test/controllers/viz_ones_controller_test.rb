require './test/test_helper'

class VizOnesControllerTest < ActionDispatch::IntegrationTest

  def test_index
    get '/'
    assert_template('viz_ones/index')
    assert_response(:success)
    assert(assigns[:viz_ones],
      "Should have @viz_ones")
  end

  def test_search
    #*******************************************
    # Searching by ethnicity
    #*******************************************
    get search_viz_ones_url(:viz_one => {:ethnicity => "White"}), xhr: true
    assert_response(:success)
    assert_equal(1,
      assigns[:viz_ones].count,
      "Should have one result")
    assert_equal(viz_ones(:viz_one_white),
      assigns[:viz_ones].first,
      "Should include #{viz_ones(:viz_one_white)} as search result")


    #*******************************************
    # Searching by sex
    #*******************************************
    get search_viz_ones_url(:viz_one => {:sex => "female"}), xhr: true
    assert_response(:success)
    assert_equal(2,
      assigns[:viz_ones].count,
      "Should have two result")
    assert_equal([
      viz_ones(:viz_one_other),
      viz_ones(:viz_one_mixed),
      ],
      assigns[:viz_ones],
      "Should return two results with sex Female")


    #*******************************************
    # Searching by diabetes_type
    #*******************************************
    get search_viz_ones_url(:viz_one => {:diabetes_type => "Type1"}), xhr: true
    assert_response(:success)
    assert_equal(2,
      assigns[:viz_ones].count,
      "Should have two result")
    assert_equal([
      viz_ones(:viz_one_white),
      viz_ones(:viz_one_mixed),
      ],
      assigns[:viz_ones],
      "Should return two results with specified diabetes_type")
  end

end
