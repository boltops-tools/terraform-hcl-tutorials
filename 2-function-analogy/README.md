# Terraform Introduction: Function Analogy

This is repo contains the source code for the blog post: [Terraform Intro 2: Function Analogy]().

## Terraform Apply

    $ terraform apply -auto-approve
    random_pet.this: Refreshing state... [id=yellow-unicorn]

    Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

    Outputs:

    pet = {
      "id" = "yellow-unicorn"
      "length" = 2
      "separator" = "-"
    }
    $

## Ruby Mock

Note, the ruby mock is not going to create an actual resource. It's just to help compare Terraform to Ruby constructs.

    $ ruby main.rb
    Outputs:

    "pet" = {
      "id" = "yellow-unicorn"
      "length" = 2
      "separator" = "-"
    }
    $
