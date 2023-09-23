#https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-setting-up.html

#! https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_document
resource "aws_ssm_document" "foo" {
  name          = "test_document"
  document_type = "Command"

  content = <<DOC
  {
    "schemaVersion": "1.2",
    "description": "Check ip configuration of a Linux instance.",
    "parameters": {

    },
    "runtimeConfig": {
      "aws:runShellScript": {
        "properties": [
          {
            "id": "0.aws:runShellScript",
            "runCommand": ["ifconfig"]
          }
        ]
      }
    }
  }
DOC
}
