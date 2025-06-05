# Infraestrutura Terraform para Grêmio Brasileirão 2025

Este diretório contém os arquivos Terraform para provisionar a infraestrutura AWS necessária para a aplicação Grêmio Brasileirão 2025.

## Recursos provisionados

- Instância EC2 (t2.micro) com Amazon Linux 2023
- Security Group com portas 22 (SSH), 80 (HTTP), 443 (HTTPS) e 8080 (aplicação)
- Elastic IP para IP fixo
- Configuração automatizada com Docker e Docker Compose

## Pré-requisitos

- [Terraform](https://www.terraform.io/downloads.html) instalado (v1.2.0+)
- [AWS CLI](https://aws.amazon.com/cli/) instalado e configurado
- Par de chaves SSH da AWS (key pair) criado

## Configuração

1. Edite o arquivo `terraform.tfvars` com suas configurações:
   - `aws_region`: Região AWS a ser utilizada
   - `instance_type`: Tipo de instância EC2
   - `ami_id`: ID da AMI (varia por região)
   - `key_name`: Nome do seu par de chaves AWS para SSH
   - `ssh_allowed_ips`: Lista de IPs permitidos para SSH

## Uso

1. Inicialize o Terraform:
   ```bash
   terraform init
   ```

2. Verifique o plano de execução:
   ```bash
   terraform plan
   ```

3. Aplique as alterações:
   ```bash
   terraform apply
   ```

4. Para destruir a infraestrutura:
   ```bash
   terraform destroy
   ```

## Outputs

Após a execução bem-sucedida, o Terraform exibirá:
- ID da instância EC2
- IP público da instância
- URL para acessar a aplicação

## Notas importantes

- Por padrão, a porta SSH (22) está aberta para todos os IPs (`0.0.0.0/0`). Para ambientes de produção, restrinja a endereços IP específicos.
- O provisionamento inicial instala Docker e Docker Compose, mas não configura a aplicação. Use o GitHub Actions para deploy da aplicação após a infraestrutura estar pronta. 