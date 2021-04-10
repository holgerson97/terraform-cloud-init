output "user_data" {
  
    value = data.template_file.user-data.rendered

}

output "root_password" {
  
    value = random_password.server-password.result

}