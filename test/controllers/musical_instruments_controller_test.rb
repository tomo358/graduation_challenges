require 'test_helper'

class MusicalInstrumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @musical_instrument = musical_instruments(:one)
  end

  test "should get index" do
    get musical_instruments_url
    assert_response :success
  end

  test "should get new" do
    get new_musical_instrument_url
    assert_response :success
  end

  test "should create musical_instrument" do
    assert_difference('MusicalInstrument.count') do
      post musical_instruments_url, params: { musical_instrument: {  } }
    end

    assert_redirected_to musical_instrument_url(MusicalInstrument.last)
  end

  test "should show musical_instrument" do
    get musical_instrument_url(@musical_instrument)
    assert_response :success
  end

  test "should get edit" do
    get edit_musical_instrument_url(@musical_instrument)
    assert_response :success
  end

  test "should update musical_instrument" do
    patch musical_instrument_url(@musical_instrument), params: { musical_instrument: {  } }
    assert_redirected_to musical_instrument_url(@musical_instrument)
  end

  test "should destroy musical_instrument" do
    assert_difference('MusicalInstrument.count', -1) do
      delete musical_instrument_url(@musical_instrument)
    end

    assert_redirected_to musical_instruments_url
  end
end
