resource "aws_iam_role" "operator_role" {
  name               = "operator_role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      }
    }
  ]
}
EOF
}


resource "aws_iam_policy" "operator_policy" {
  name        = "operator_policy"
  description = "Policy for the operator"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:CreateInstance",
        "ec2:DescribeInstances",
        "ec2:TerminateInstances"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}


resource "aws_iam_role_policy_attachment" "operator_attachment" {
  policy_arn = aws_iam_policy.operator_policy.arn
  role       = aws_iam_role.operator_role.name
}

