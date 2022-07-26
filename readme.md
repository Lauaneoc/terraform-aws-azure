# Terraform + AWS + Azure

## comandos úteis

```bash
terraform init # prepara sua área de trabalho para os outros comandos
terraform validade # verifica se suas configurações são válidas 
terraform plan # mostra suas mudanças de configurações atuais
terraform fmt # ele vai formatar nosso código e alinhar tudo certinho, deixando o código com a sintaxe correta do terraform
terraform appply # cria ou atualiza sua insfraestrutura
terraform destroy # vai destruir o arquivo com tudo que você criou
```

## AWS Credentials

```bash
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
```

## Azure Credentials

```bash
export ARM_CLIENT_ID=
export ARM_TENANT_ID=
export ARM_SUBSCRIPTION_ID=
export ARM_CLIENT_SECRET=
```

## Tipos de blocos terraform

```bash
terraform {
# configurações básicas do terraform
}

provider "aws" { 
# nome do provider que irá utilizar, exemplo: AWS, Azure. E também, informações do provider utilizado.
}

resource "aws_instance" "nameLocal" { 
# nome do serviço que irá criar: Instância, bucket S3, etc.
}

data "aws_ami" "nomeDeReferenciaLocal" {
# nome do serviço que irá utilizar. O data vai buscar informações de fora do código do terraform, para ser usado dentro do terraform. 

}

module "nomeDeReferenciaLocal"{
# o bloco de módulo serve tanto para referenciar dentro do sub-diretório da sua configuração de terraform, como também serve para referenciar o módulo da comunidade
}

variable "nomeDaVariavel"{
# aqui vai a configuração da variável, as informações que você irá setar.
}

output "nomeDeIdentificacao" {
# é um recurso do terraform para pegar alguma informação de dentro do código do terraform e fazer (como o próprio nome já diz), mandar essa informação pra fora da documentação, para poder ser usado por outro recurso do computador, ou pipeline...Resumindo, você pode usar para o que você quiser.
}

locals {
# ele serve para pegar funções ou expressões que você usa repetidamente na configuração do terraform, da um nome pra ele, assim, ao invés de você ter que ficar repetindo o código toda vez, apenas chama o código pelo nome que você declarou 
}
```

## links úteis

[Documentação Terraform](https://www.terraform.io/language)
[Documentação Providers](https://registry.terraform.io/browse/providers)
