output "user-data" {
  
    value = data.template_file.user-data.rendered

}

output "root-password" {
  
    value = random_password.server-password.result

}