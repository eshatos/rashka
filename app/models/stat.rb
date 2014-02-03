class Stat < ActiveRecord::Base

  def increase_people_left
    self.update(people_left: self.people_left + 1)
  end

  def increase_shares_vk
    self.update(shares_vk: self.shares_vk + 1)
  end

  def increase_shares_tw
    self.update(shares_tw: self.shares_tw + 1)
  end

  def increase_shares_fb
    self.update(shares_fb: self.shares_fb + 1)
  end

  def increase_shares_gp
    self.update(shares_gp: self.shares_gp + 1)
  end
end