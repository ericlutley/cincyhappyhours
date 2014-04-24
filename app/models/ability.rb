class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      can :read, Place
    elsif user.admin?
      can :manage, :all
    end
  end
end
