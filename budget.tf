data "aws_caller_identity" "current" {}

//${data.aws_caller_identity.current.account_id}

resource "aws_cloudwatch_metric_alarm" "account-billing-alarm" {
  alarm_name          = "account-billing-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "EstimatedCharges"
  namespace           = "AWS/Billing"
  period              = "21600"
  statistic           = "Average"
  threshold           = "1000"
  alarm_description   = "Billing alarm by account"
  alarm_actions       = ["${aws_sns_topic.sns-budget.arn}"]

  dimensions {
    Currency      = "USD"
    LinkedAccount = "${data.aws_caller_identity.current.account_id}"
  }
}

resource "aws_sns_topic" "sns-budget" {
  name = "${lower(var.basenube_key)}-sns-budget-topic"

  provisioner "local-exec" {
    command = "aws sns subscribe --topic-arn ${self.arn} --protocol email --notification-endpoint ron@basenube.com"
  }
    provisioner "local-exec" {
    command = "aws sns subscribe --topic-arn ${self.arn} --protocol email --notification-endpoint ron@basenube.com"
  }

}
