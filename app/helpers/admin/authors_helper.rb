module Admin::AuthorsHelper
  def render_gender gender
    case gender
    when Settings.gender.male
      t "male"
    when Settings.gender.female
      t "female"
    else
      t "other"
    end
  end
end
