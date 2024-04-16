data "vault_kv_secret_v2" "secret_data" {
  mount = "secret" 
  name  = "test-secret"
}
resource "aws_instance" "my_instance" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
 
  tags = {
    Name = "test"
    Secret = data.vault_kv_secret_v2.secret_data.data["username"]
  }
}