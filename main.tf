provider "aws" {
  region = "us-east-1" // ou a região desejada
}

resource "aws_lambda_function" "my_lambda_function" {
  function_name = "my-lambda-function"
  filename      = "lambda_function_payload.zip"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  role = ""  
}
