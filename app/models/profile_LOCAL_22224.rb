class Profile < ApplicationRecord
<<<<<<< HEAD
  has_many :weights
  has_many :heights
=======
  has_many :pressures
>>>>>>> Associando Modelos - Profile e Pressure

  validates :email, uniqueness: { case_sensitive: false,
                                  message: "Já existe um perfil com este e-mail" },
                    presence: { message: "O e-mail é obrigatório" }


  validates :firstname, presence: { message: "O nome é obrigatório" }
  validates :lastname, presence: { message: "O sobrenome é obrigatório" }
  validates :birthdate, presence: { message: "A data de nascimento é obrigatória" }

end
