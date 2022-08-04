# Terraform + AWS

O Terraform é uma ferramenta para construir, alterar e configurar uma infraestrutura de rede de forma segura e eficiente. Com ele é possível gerenciar serviços de nuvem bem conhecidos, bem como soluções internas personalizadas.

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

## Criar chave pública

```bash
ssh-keygen -t rsa -b 4096 -C "email"
```

## Acessar aws_instance

```bash
ssh -i ~/.ssh/id_rsa ubuntu@ID_INSTÂNCIA
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

## Conceitos adicionais

- Local State:
  - Arquivo que o terraform cria automaticamente, onde ele armazena todos os recursos que ele geriu. E através da informação que está nesse arquivo, o terraform se torna idempotente, e isso quer dizer que você pode aplicar a mesma configuração várias vezes, que ele não vai criar os mesmos recursos repetidas vezes, apenas atualizar, se for necessário;
- Remote State:
  - Podemos armazenar remotamente o arquivo do *state* do **terraform**. Existem várias opções para fazer isso, mas uma das mais utilizadas é armazená-lo em um *bucket s3*;
- Provisioners:
  - Os provisionadores podem ser usados ​​para modelar ações específicas na máquina local ou em uma máquina remota para preparar servidores ou outros objetos de infraestrutura a serviço.
- Provisioners File:
  - Uma forma de copiar um arquivo para dentro da sua máquina remota.
- Módulos:
  - São um conjunto de códigos para construir determinados recursos, e estes poderá ser reaproveitado todo aquele conjunto de código, como por exemplo, construir uma VPC na AWS e em seguida salvar aquela pasta ou diretório, assim você pode chamar aquele conjunto de código, pasta ou módulo para suas configurações, isso evita a repetição do mesmo código repetidas vezes.
- Meta arguments:
  - São argumentos especiais que podem ser usados em qualquer tipo de bloco e recurso que você queira, ou também podem ser usados em módulos, no caso, são apenas esses quatros para módulos: "Providers", "depends_on", "count", "for_each"
  - depends_on : você pode ter uma instância da AWS que depende de um bucket específico. Então a instância só será criado quando o S3 já estiver criado.
  - Count : Serve para você dizer para o Terraform quantas cópias aquele determinado bloco/recurso o terraform irá criar. OBS: Não é possível usar COUNT E FOR_EACH no mesmo grupo.
  - For_each : O for_each também serve para criar múltiplas cópias de um recurso usando apenas um bloco. Só que, ao invés de receber um nuḿero como count, o for_each recebe um "map" ou um conjunto de strings.

## 🔍 links úteis

- [Documentação Terraform](https://www.terraform.io/language)
- [Terraform Vars](https://www.terraform.io/language/values/variables)
- [Documentação Providers](https://registry.terraform.io/browse/providers)
- [Provider AWS](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Código de todas regioẽs existentes na AWS](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html)
