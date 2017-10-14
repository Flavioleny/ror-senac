class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role == "admin"
      can :manage, :all
    else
      can [:index, :edit, :new], [:posts, :orders]
    end
  end
end
