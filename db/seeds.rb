# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "PBZ", email: "tonx.andrews@gmail.com", password: "tonxandrews", password_confirmation: "tonxandrews", employer: true)
User.create(name: "Konzum", email: "pero@pero.com", password: "peropero", password_confirmation: "peropero", employer: true)
User.create(name: "Jura Juric", email: "jura@juric.com", password: "jurajura", password_confirmation: "jurajura")
User.create(name: "Šime Šimic", email: "sime@sime.com", password: "simesime", password_confirmation: "simesime")

Job.create(name: 'Job1', description: "Job description 1", category:"testing", expiration_date: "11.12.2020. 00:40:00", user_id: 1)
Job.create(name: 'Job2', description: "Job description 2", category:"testing", expiration_date: "17.2.2020. 00:40:00", user_id: 2)
Job.create(name: 'Job3', description: "Job description 3", category:"testing2", expiration_date: "18.2.2019. 00:40:00", user_id: 1)
Job.create(name: 'Job4', description: "Job description 4", category:"testing2", expiration_date: "14.2.2020. 00:40:00", user_id: 1)
Job.create(name: 'Job5', description: "Job description 5", category:"testing3", expiration_date: "12.2.2021. 00:40:00", user_id: 2)
Job.create(name: 'Job6', description: "Job description 6", category:"testing4", expiration_date: "7.12.2020. 00:40:00", user_id: 2)

JobAplication.create(name: "Jura Juric", date_of_birth: "11.12.2000. 00:40:00", email: "jura@juric.com", phone_num: "0913330320", address: "Juricevi", education: "SSS", job_id: 1, user_id: 3)
JobAplication.create(name: "Jura Juric", date_of_birth: "11.12.2000. 00:40:00", email: "jura@juric.com", phone_num: "0913330320", address: "Juricevi", education: "SSS", job_id: 2, user_id: 3)
JobAplication.create(name: "Šime Šimic", date_of_birth: "11.9.2000. 00:40:00", email: "sime@sime.com", phone_num: "091564545", address: "Šimovci", education: "VSS", job_id: 3, user_id: 4)
JobAplication.create(name: "Šime Šimic", date_of_birth: "11.9.2000. 00:40:00", email: "sime@sime.com", phone_num: "091564545", address: "Šimovci", education: "VSS", job_id: 4, user_id: 4)
JobAplication.create(name: "Jura Juric", date_of_birth: "11.12.2000. 00:40:00", email: "jura@juric.com", phone_num: "0913330320", address: "Juricevi", education: "SSS", job_id: 5, user_id: 3)