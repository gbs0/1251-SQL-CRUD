require_relative 'doctor'
require 'pry'
# 0. Criar a tabela Doctors
Doctor.create_table

# 1. Criar um novo doutor e inserir no banco
dr_dolittle = Doctor.new({"name" => "Asdrubal Doe", "age" => 50, "specialty" => "Ophtalmology"})
dr_dolittle.save

# 2. Mostrar todos os doutores da minha base de dados
all_doctors = Doctor.all
# p all_doctors

# 3. Buscar o doutor pelo seu id
dr_dolittle = Doctor.find(1)


# 4. Editar um determinado doutor
parameters = Doctor.find(1)
dr_dolittle = Doctor.new(parameters.first)
dr_dolittle.name = "Sigmund Freud"
dr_dolittle.specialty = "Psychology"
dr_dolittle.save


# 2. Mostrar todos os doutores da minha base de dados
all_doctors = Doctor.all
p all_doctors

# 5. Destruir um determinado doutor pelo seu ID
Doctor.destroy(2)
Doctor.destroy(3)
Doctor.destroy(4)

# Mostrando o resultado final
all_doctors = Doctor.all
p all_doctors