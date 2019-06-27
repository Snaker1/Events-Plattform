class UserPolicy < ApplicationPolicy
  def index?
    true if user.try(:admin?)
  end
  def show?
		true
	end
 
  def create?
    true if user.try(:admin?)
  end
 
  def update?
    return true if user.present?
  end
 
  def destroy?
    return true if user.present?
  end
 
  private
 
  def article
    record
  end
end
