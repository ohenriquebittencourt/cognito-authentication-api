provider "aws" {
  region = "us-east-1" // ou a região desejada
}

resource "aws_iam_role" "lambda_role" {
  name               = "lambda-execution-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "lambda_policy" {
  name       = "lambda-execution-policy"
  roles      = [aws_iam_role.lambda_role.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "my_lambda_function" {
  function_name = "my-lambda-function"
  filename      = "lambda_function_payload.zip"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"

  role = aws_iam_role.lambda_role.arn

}
