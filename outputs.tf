output "vm_name" {
    value = google_compute_instance.default.name
}

output "private_ip_address" {
    value =  google_compute_instance.default.network_ip
}

output "public_ip_address" {
    value = google_compute_instance.default.access_config
}
output "root_password" {
    value = google_compute_instance.default.password
}
