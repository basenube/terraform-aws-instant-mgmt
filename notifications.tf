
// Guard Duty Events, Only Medium and High Events
resource "aws_cloudwatch_event_rule" "cloudwatchrule" {
  name = "${lower(var.basenube_key)}-cloudwatchrule-guardduty"

  event_pattern = <<PATTERN
  {
    "source": [
      "aws.guardduty"
    ],
    "detail-type": [
      "GuardDuty Finding"
    ],
    "detail": {
      "severity": [5.0,5.1,5.2,5.3,5.4,5.5,5.6,5.7,5.8,5.9,6.0,6.1,6.2,6.3,6.4,6.5,6.6,6.7,6.8,6.9,7.0,7.1,7.2,7.3,7.4,7.5,7.6,7.7,7.8,7.9,8.0,8.1,8.2,8.3,8.4,8.5,8.6,8.7,8.8,8.9]
    }
  }
  PATTERN
}

resource "aws_cloudwatch_event_target" "cloudwatchtarget" {
  rule      = "${aws_cloudwatch_event_rule.cloudwatchrule.name}"
  target_id = "${lower(var.basenube_key)}-target-guardduty"
  arn       = "${aws_sns_topic.sns-guardduty.arn}"
}

resource "aws_sns_topic" "sns-guardduty" {
  name = "${lower(var.basenube_key)}-sns-guardduty-topic"
  provisioner "local-exec" {
    command = "aws sns subscribe --topic-arn ${self.arn} --protocol email --notification-endpoint graeme.durkee@intersystems.com"
  }
    provisioner "local-exec" {
    command = "aws sns subscribe --topic-arn ${self.arn} --protocol email --notification-endpoint ron@basenube.com"
  }

}

// AWS Config Cloudwatch Events to a bucket

resource "aws_cloudwatch_event_rule" "cloudwatchruleconfig" {
  name = "${lower(var.basenube_key)}-cloudwatchrule-config"

  event_pattern = <<PATTERN
 
  {
  "source": [
    "aws.config"
  ],
  "detail": {
    "requestParameters": {
      "evaluations": {
        "complianceType": [
          "NON_COMPLIANT"
        ]
      }
    }
  }
}
  PATTERN
}

resource "aws_cloudwatch_event_target" "cloudwatchtargetconfig" {
  rule      = "${aws_cloudwatch_event_rule.cloudwatchruleconfig.name}"
  target_id = "${lower(var.basenube_key)}-target-config"
  arn       = "${aws_sns_topic.sns-config.arn}"
}

resource "aws_sns_topic" "sns-config" {
  name = "${lower(var.basenube_key)}-sns-config-topic"

  provisioner "local-exec" {
    command = "aws sns subscribe --topic-arn ${self.arn} --protocol email --notification-endpoint ron@basenube.com"
  }
    provisioner "local-exec" {
    command = "aws sns subscribe --topic-arn ${self.arn} --protocol email --notification-endpoint ron@basenube.com"
  }

}

// EC2 Events
resource "aws_cloudwatch_event_rule" "cloudwatchruleec2" {
  name = "${lower(var.basenube_key)}-cloudwatchrule-ec2"

  event_pattern = <<PATTERN

{
  "source": [
    "aws.ec2"
  ],
  "detail-type": [
    "EC2 Instance State-change Notification"
  ]
} 

  PATTERN
}

resource "aws_cloudwatch_event_target" "cloudwatchtargetec2" {
  rule      = "${aws_cloudwatch_event_rule.cloudwatchruleec2.name}"
  target_id = "${lower(var.basenube_key)}-target-config"
  arn       = "${aws_sns_topic.sns-config.arn}"
}