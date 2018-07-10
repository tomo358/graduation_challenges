module MusicalInstrumentsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_musical_instruments_path
    elsif action_name == 'edit'
      musical_instrument_path
    end
  end
end
