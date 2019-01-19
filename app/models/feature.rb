#TODO Cover other cases such as enable_group, enable_specific_user
class Feature < ActiveRecord::Base

  validates :name, uniqueness: true

  def disable
    FeatureControl.where(feature_name: self.name).destroy_all
  end

  def enable
    feature_control = {
        feature_name: self.name,
        type: 'All User',
        value: 'true'
    }
    FeatureControl.create(feature_control)
  end

  def enable?
    FeatureControl.where(feature_name: self.name).where(type_control: 'All_User').length > 0
  end

end
