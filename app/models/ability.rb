class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki fo details: https://github.com/ryanb/cancan/wiki/Defining-Abilities

if user.has_role? :admin
  #puts "gjkfgkfdhgkjfdhgkjfhdjkghdfkghkfdhgkjfhkjgfhkfgnkhfgnkhn"
  can :manage, :all
elsif user.has_role?:till_operator
  can :manage, Counter
  can :manage, Orderlist
  can :manage, SwipeCard
   
elsif user.has_role?:kitchen
  can :manage, Counter
  can :manage, Orderlist
elsif user.has_role?:manager||:moderator
  can :manage, :all
  cannot :manage, User

end

#if user.has_role? :admin
#  can :manage, :all
#  elsif user.has_role? :manager
#   can :manage, :all
#   #cannot :all, User
# elsif user.has_role? :kitchen
#    can :manage, :all
#      #can [:read, :update], [Orderlist, Order]
#      # cannot [:billing, :billing_nolayout, :sales, :inventory]
# elsif user.has_role? :billing
#    can :manage, :all
#      #can [:read, :update], [Order, Customer]
# else
#    can :manage, :all
#    #cannot :manage, :all
#   end
 end
end
