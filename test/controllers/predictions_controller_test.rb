require 'test_helper'

class PredictionsControllerTest < ActionController::TestCase
  setup do
    @prediction = predictions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:predictions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prediction" do
    assert_difference('Prediction.count') do
      post :create, prediction: { game10: @prediction.game10, game11: @prediction.game11, game12: @prediction.game12, game13: @prediction.game13, game14: @prediction.game14, game15: @prediction.game15, game16: @prediction.game16, game1: @prediction.game1, game2: @prediction.game2, game3: @prediction.game3, game4: @prediction.game4, game5: @prediction.game5, game6: @prediction.game6, game7: @prediction.game7, game8: @prediction.game8, game9: @prediction.game9, score: @prediction.score, week: @prediction.week }
    end

    assert_redirected_to prediction_path(assigns(:prediction))
  end

  test "should show prediction" do
    get :show, id: @prediction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prediction
    assert_response :success
  end

  test "should update prediction" do
    patch :update, id: @prediction, prediction: { game10: @prediction.game10, game11: @prediction.game11, game12: @prediction.game12, game13: @prediction.game13, game14: @prediction.game14, game15: @prediction.game15, game16: @prediction.game16, game1: @prediction.game1, game2: @prediction.game2, game3: @prediction.game3, game4: @prediction.game4, game5: @prediction.game5, game6: @prediction.game6, game7: @prediction.game7, game8: @prediction.game8, game9: @prediction.game9, score: @prediction.score, week: @prediction.week }
    assert_redirected_to prediction_path(assigns(:prediction))
  end

  test "should destroy prediction" do
    assert_difference('Prediction.count', -1) do
      delete :destroy, id: @prediction
    end

    assert_redirected_to predictions_path
  end
end
