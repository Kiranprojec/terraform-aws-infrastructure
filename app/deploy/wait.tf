resource "null_resource" "wait" {
  triggers = {
    task_def = aws_ecs_task_definition.flask-app.arn
  }

  provisioner "local-exec" {
    command = "aws ecs wait services-stable --cluster ${var.cluster} --services ${aws_ecs_service.flask-app.name}"
  }

  depends_on = [aws_ecs_service.flask-app]
}

