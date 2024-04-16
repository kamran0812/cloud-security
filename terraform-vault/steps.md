# Project Documentation: Setting up Vault with Terraform Integration


### Install GPG
GPG is used for encrypting and signing data.

```bash
sudo apt update && sudo apt install gpg
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
```
### Install VAULT
```bash 
sudo apt install vault 
```

### Start VAULT
```bash
vault server -dev -dev-listen-address="0.0.0.0:8200"
```
### Enable AppRole Authentication
```bash
vault auth enable approle
```
### Create a Policy
```bash
vault policy write terraform - <<EOF
path "secret/data/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
EOF

```
### Create an AppRole
```bash
vault write auth/approle/role/terraform \
    secret_id_ttl=10m \
    token_num_uses=10 \
    token_ttl=20m \
    token_max_ttl=30m \
    secret_id_num_uses=40 \
    token_policies=terraform

```
### Generate Role ID

```bash
vault read auth/approle/role/terraform/role-id
```
### Generate Secret ID

```bash
vault write -f auth/approle/role/terraform/secret-id
```

### Create a Key-Value (KV) Secret Engine

```bash
vault write sys/mounts/kv backend=kv
```
### Create a Demo Vault (test-secret)
```bash
vault kv put secret/data/test-secret username=credentials
```
