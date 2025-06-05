# Infraestrutura AWS para Grêmio Brasileirão 2025

Repositório para provisionar a infraestrutura AWS necessária para hospedar a aplicação Grêmio Brasileirão 2025.

## O que será criado

- Instância EC2 (t2.micro) com Amazon Linux 2023
- Security Group com portas 22 (SSH), 80 (HTTP), 443 (HTTPS) e 8080 (aplicação)
- Elastic IP para IP fixo
- Docker e Docker Compose instalados automaticamente

## Pré-requisitos

- [Terraform](https://www.terraform.io/downloads.html) instalado (v1.2.0+)
- [AWS CLI](https://aws.amazon.com/cli/) instalado e configurado
- Par de chaves SSH da AWS (key pair) criado no Console AWS

## Como usar

1. Entre no diretório terraform:
   ```bash
   cd terraform
   ```

2. **Configure suas variáveis**:
   ```bash
   # Copie o arquivo de exemplo
   cp terraform.tfvars.example terraform.tfvars
   
   # Edite o arquivo com suas configurações
   nano terraform.tfvars  # ou use seu editor preferido
   ```

3. **Edite o `terraform.tfvars`** com suas informações:
   - `key_name`: Nome do seu par de chaves AWS (criado no Console AWS)
   - `ssh_allowed_ips`: Seu IP público para SSH (recomendado usar `/32` para maior segurança)
   
   **Para descobrir seu IP público**:
   ```bash
   curl ifconfig.me
   ```

4. Inicialize o Terraform:
   ```bash
   terraform init
   ```

5. Veja o que será criado:
   ```bash
   terraform plan
   ```

6. Crie a infraestrutura:
   ```bash
   terraform apply
   ```

7. Após a conclusão, anote o IP público que será exibido.

## Configuração da Chave SSH

Antes de executar o Terraform, você deve criar uma chave SSH no Console AWS:

1. **AWS Console** → **EC2** → **Key Pairs**
2. **Create key pair**
3. **Name**: `gremio-app-key` (ou outro nome)
4. **Type**: RSA
5. **Format**: `.pem`
6. **Create** e baixe o arquivo `.pem`
7. **Guarde o arquivo em local seguro** - você precisará dele para acessar a EC2

## Após a criação

Para conectar na EC2:
```bash
ssh -i caminho/para/sua-chave.pem ec2-user@IP_PUBLICO
```

A aplicação ficará disponível em:
```
http://IP_PUBLICO:8080
```

## Para destruir

```bash
terraform destroy
```

## Estrutura de arquivos

- `main.tf`: Recursos principais (EC2, Security Group, EIP)
- `variables.tf`: Variáveis de configuração
- `outputs.tf`: Outputs após a criação
- `terraform.tfvars.example`: Arquivo de exemplo para configuração
- `terraform.tfvars`: Suas configurações (não versionado)

## ⚠️ Importante

- O arquivo `terraform.tfvars` está no `.gitignore` para proteger informações sensíveis
- Sempre use seu IP específico no `ssh_allowed_ips` em produção
- Mantenha sua chave SSH privada segura e nunca a compartilhe
