class User < ActiveRecord::Base
  has_many :requests
  SETOR = %w(Protocolo Dafi Pessoal Pagamento Compras Gabinete Dire RH Capacitacao Inspecao Nte Financas Cat)
  ROLES = %w[admin moderator author banned]
  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask || 0) & 2**ROLES.index(r)).zero?
    end
  end 
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :setor

  def to_s
    "#{username}"
  end
end
