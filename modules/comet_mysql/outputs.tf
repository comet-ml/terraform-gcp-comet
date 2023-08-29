output "mysql_connection_name" {
  description = "The connection name of the MySQL instance to be used in connection strings"
  value = module.mysql.instance_connection_name
}
