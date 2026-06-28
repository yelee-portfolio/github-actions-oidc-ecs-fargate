resource "aws_secretsmanager_secret" "app" {
  name = "${var.project_name}/app"

  tags = {
    Name = "${var.project_name}-app-secret"
  }
}

data "aws_iam_policy_document" "ecs_task_execution_secret_access" {
  statement {
    effect = "Allow"

    actions = [
      "secretsmanager:GetSecretValue"
    ]

    resources = [
      aws_secretsmanager_secret.app.arn
    ]
  }
}

resource "aws_iam_role_policy" "ecs_task_execution_secret_access" {
  name   = "${var.project_name}-read-app-secret"
  role   = aws_iam_role.ecs_task_execution.id
  policy = data.aws_iam_policy_document.ecs_task_execution_secret_access.json
}
