class Ability

  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :manage, User, id: user.id
      can :manage, Order, id: user.id
      can :manage, Comment, user_id: user.id
      cannot [:destroy, :delete], Comment
    end
  end

end
