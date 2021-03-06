Feature: Allows an user to administrate your basic profile
#Cenário deprecado: A lógica corresponde ao login
	# Scenario: As a User I should navigate to Profile page
	# 	Given I am on the MediData home page
	# 	When I click on "Criar um Perfil"
	# 	Then I should be redirected to Novo Perfil page

  Background:
    Given I am an registered user with "joao@example.org" email address
    
  Scenario: As a new User, I shouldn't be allowed to create a new profile without my name, my e-mail and my birthdate
		Given I am on Novo Perfil page
		And I click on "Criar meu perfil"
		Then An error message saying that "O nome é obrigatório" should be exibited
		And An error message saying that "O sobrenome é obrigatório" should be exibited
		And An error message saying that "A data de nascimento é obrigatória" should be exibited

	Scenario: As a new User, I can create a New Profile
		Given I am on Novo Perfil page
		When I fill "firstname" with "João"
		And I fill "lastname" with "Silva"
		And I fill "birthdate" with "13/12/1980"
		And I select "Masculino"
		And I fill "gender" with "Masculino"
		And I click on "Criar meu perfil"
		Then A New Profile with "joao@example.org" email should be created
		And I should be redirected to my Profile main page
		And A "success" message saying "O perfil foi criado com sucesso" should be exibited

# Cenário deprecado: O controle é feito pela criação do login
	# Scenario: As a new User, I should not be able to create a New Profile with an existing email
	# 	Given I am on Novo Perfil page
	# 	And An user with "joao_silva@example.org" email already exists
	# 	When I fill "email" with "joao_silva@example.org"
	# 	And I fill "firstname" with "João"
	# 	And I fill "lastname" with "Silva"
	# 	And I fill "birthdate" with "10/12/1980"
	# 	And I select "Masculino"
	# 	And I fill "gender" with "Masculino"
	# 	And I click on "Criar meu perfil"
	# 	Then An error message saying that "Já existe um perfil com este e-mail" should be exibited
	
	Scenario: As an existing User, I should be allowed to edit "birthdate", "sex", and "gender" of my basic profile
		Given I have a registered profile with "joao@example.org" email address
		And I navigate to Editar Meu Perfil page with "joao@example.org"
		When I fill "birthdate" with "13/12/1999"
		And I select "Feminino"
		And I fill "gender" with "Feminino"
		And I click on "Salvar meu perfil"
		Then A "success" message saying "O perfil foi modificado com sucesso" should be exibited
		And The field "Birthdate" should have the date "13/12/1999"
		And The field "Gender" should be "Feminino"
		And "Sex" "Feminino" should be selected

  Scenario: As an existing User, I should not be allowed to edit a profile of another user
    Given I have a registered profile with "joao@example.org" email address
    And There are another user registered with "joana@example.org"
    When I navigate to Editar Meu Perfil page with "joana@example.org"
    Then I get an error indicating that I can not execute that action